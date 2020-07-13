% The function creates an image that has the action removed by applying a
% median filter , each pixel in the new image is obtained by taking the
% median RGB values of the stack of corresponding pixels taken from the
% source images.
%
%
% Inputs : pics      1xn 1D cell array containing n images, where each 
%                    element is an RGB image stored as 3D array of uint8
%                    value from 0 to 255.
%  
%
% Output : img       An RGB image ( stored as 3D array of uint8 values 
%                    ranging from 0 to 255) that was obtained by taking
%                    the median RGB values of the stack of corresponding 
%                    pixels corresponding pixels from the source images.
%
%
% Author : Mario
%
% Note: No helper function is called in order to increase performance.

function img = RemoveAction(pics) 
% Compose a 4D array where images are stack together in the 4th dimension
% RGB value corresponds to the pixel is stored in the 3rd dimension.
M = cat(4,pics{:});

% create a 3D array by finding the median across all the picture (along the
% 4th dimension of the 4D array)
img = median(M,4);
end
