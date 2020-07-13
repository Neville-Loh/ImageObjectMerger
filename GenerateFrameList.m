% This function generates a 1-D array containing the n frame number from
% the initial frame number with the given spacing.
%
% Inputs : initialFrame     ,integer, starting frame number
%          step             ,integer, step size or spacing of frame
%          n                ,integer, the number of frames to generate 
%                            in 1-D array
%
% Output : frameList,       , 1xn 1D Array containing starting frame number
%                             and 
%                             e.g [ 10 30 50 70]
%
% Author : Mario

function [frameList]= GenerateFrameList(initialFrame,step,n)

% Calculate the frame number of the last frame
lastFrame = initialFrame + (n-1)* step;

% Create a 1-D array from initialFrame to the lastFrame 
frameList = initialFrame:step:lastFrame;
end



