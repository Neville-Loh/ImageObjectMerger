% This function returns a 1D cell array of the names of all file with a
% particular file extension that are contained in a specified directory.
%
% Inputs : path        ,   string, name or path of the directory which
%                          files are searched.
%          extension   ,   string, extension of the file, e.g. "png" "jpg"
%  
%
% Output : filenames, 1D - cell Array containing strings of the file with 
%                     given extension
%
% Author : Mario

function [filenames] = GenerateImageList(path,extension)

% Generate a 1D-array containg objects of file (struct)
f = dir(path);

% Generate a 1D-array of file name
filenames = {f.name};

% check if filename contain ".extension", if not set the element to empty
filenames(~contains(filenames,"." + extension)) = [];

end