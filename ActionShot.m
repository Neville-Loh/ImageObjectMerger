% This function creates an action shot image by finding the most distant
% pixels from the median RGB of the pixels. Each pixel in the new image is
% obtained by finding the pixel in the same row and column of the source
% images that is most distant from the median RGB values of te stack of
% corresponding pixels.
%
%
% Inputs : pics      1xn 1D cell array containing n images, where each 
%                    element is an RGB image stored as 3D array of uint8
%                    value from 0 to 255.
%  
%
% Output : imgArray  An RGB image (stored as 3D array of uint8 values 
%                    ranging from 0 to 255) that was obtained by finding 
%                    the most different pixel of the stack of pixels 
%                    corresponding pixels from the source images.
%
%
% Author : Mario
%
% Note: for perfomance reaseon, all calculation is done within the function
%       using 4D matricies instead of calling helper function.
%

function [imgArray] = ActionShot(pics)

% Compose a 4D array where images are stack together in the 4th dimension
% RGB value corresponds to the pixel is stored in the 3rd dimension.
imgArray = cat(4,pics{:});


% Finding the Matrix I, a 2D index matrix containing the picture number 
% of each pixel to be displayed.(most distant pixel)
% The square difference is calculated between each pixel and their median 
% counterpart across the images. The opeartion is done in single to prevent
% bit overflow. 
% The index is found by finding the maximum sumative square distance
% across all picture(4th dimension of the 4D imgArray)
% For perfomance reason, no helper function is called.


% Finding the difference of each pixel from median
diff = single(imgArray) - single(median(imgArray,4));

% Sum the square distance across all the RGB value of all pixels.
sq_diff = sum(diff.^2 ,3);

% Finding the maximun across all picture(4th dimension)
[~,I] = max(sq_diff,[],4);



% Create a 4D index array turnON, where location corresponds to pixels of
% every image, The value contain is either 0 or 1. value 1 indiacate the
% pixel to be turned on.
% (I==i) creates a n by n logic array indicate pixels to be turned on 
% in every picture, set the current layer in 4th dimension to be the 
% 2D array in uint8.

% Preallocate a index array with size of original 4D matrix without RGB
[row,col,~,imgCount] = size(imgArray);
turnON = zeros(row,col,1,imgCount,'uint8');

% loop through each picture 
for i = 1:imgCount
    % set the pixel matrix to 1 if I is the picture number
    turnON(:,:,:,i) = uint8(I==i);
end



% Every element is multiply by 0 or 1, keeping the RGB value, or setting it
% to 0.
imgArray = imgArray.*turnON;
% Adding up all the picture together in uint8 to create a n by n by 3 RGB
% matrix of a image
imgArray = sum(imgArray,4,'native');

end