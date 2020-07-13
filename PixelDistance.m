% This function calculate the square distance between two points in colour
% space.
%
% Inputs : P      ,  An array containing three elements representing a
%                    RGB value of a pixel
%
%          Q      ,  An array containing three elements representing a
%                    RGB value of a pixel
%  
%
% Output : squareDistance,    double, the square distance between 2 points 
%                             in 3D colour space.
%
% Author : Mario


function [squareDistance] = PixelDistance(P,Q)
% Check if the P,Q is double, if not change it to double.
if ~isa(P,'double') && ~isa(Q,'double')
    P = double(P);
    Q = double(Q);
end

% Creating an 1D array of the square difference, and summing up every
% element, return a number of the total square distance in 3D space
squareDistance = sum((P-Q).^2);
end
