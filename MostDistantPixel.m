% This function finds the pixel from a list that is most distant from
% the median RGB values of that list, and return the RGB of that pixel.
%
% Inputs : pixels  1xNx3 array containing the RGB value of N pixel
%  
%
% Output : R  ,unit8 , most distance RGB value of the red color
%          G  ,unit8 , most distance RGB of the green color
%          B  ,unit8 , most distance RGB of the blue color
%
% Note: MedianPixel() was not used because the output will have to be
%       restructure into array in order to be used, where median() gives
%       the same result.
%
% Author : Mario

function [R,G,B] = MostDistantPixel(pixels)

% Finding the square difference of RGB of each pixel and the median 
% in a 3D 1xNx3 array
pixels = single(pixels);
sqdiff = (pixels - median(pixels)).^2;

% summing RGB differece in the third dimension, S is a 1xN array
S = sum(sqdiff,3);

% find the index of the element with the max value
[~,I] = max(S);

% set RGB to the RGB of the most distance pixel using the index
R = pixels(1,I,1);
G = pixels(1,I,2);
B = pixels(1,I,3);

end


