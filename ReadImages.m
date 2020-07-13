% This function read the image with the matching filenames in the given 
% path and return the RGB data of each image in a 1xn 1D cell array.
%
% Inputs : path   ,   string, directory of the file containing images
%          name   ,   1xn 1D cell array containing n strings of filenames
%                     to read
% 
% Output : pic    ,   1xn 1D array containing n images, where each element
%                     is an RGB image. Order of the list will correspond
%                     to order of the filenames input
%
% Author : Mario


function pics = ReadImages(path,name)

% Preallocate a 1D cell array with length of filenames array
pics = cell(1,length(name));

% Read and store every image in the cell
for i = 1:length(name)
    % create a string of the location to read (e.g. C:\src\Filename.jpg)
    location = path + string(filesep) + string(name(i));
    % read the image as a uint8 RGB matrix
    pics{i} = imread(location);
end
end
    
