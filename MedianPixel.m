% This function calculate a median value of the RGB value for given 
% number of pixel, output R,G,B as a unit8 interger
%
% Inputs : pixels  1xNx3 array containing the RGB value of the pixel
%  
%
% Output : R  ,unit8 , median value of the red color of all pixels
%          G  ,unit8 , median value of the green color of all pixels
%          B  ,unit8 , median value of the blue color of all pixels
%
% Author : Mario

function [R,G,B] = MedianPixel(pixels)

% The third dimension of the 3D array correspond to the RGB
R = median(pixels(:,:,1));  % find the median value across all pixel in R
G = median(pixels(:,:,2));  % find the median value across all pixel in G
B = median(pixels(:,:,3));  % find the median value across all pixel in B

end

