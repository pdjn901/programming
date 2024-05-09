% "\\" to "/" 
% Define the file path of the MATLAB file
file_path = 'path/to/your/matlab/file.m';

% Read the contents of the file
fid = fopen(file_path, 'r');
file_contents = fread(fid, '*char').';
fclose(fid);

% Perform the replacement for '//' with '\' excluding '\n' and excluding fprintf lines
file_contents_new = regexprep(file_contents, '//', '\');

% Write the modified contents back to the file
fid = fopen(file_path, 'w');
fwrite(fid, file_contents_new);
fclose(fid);

disp(['Replaced "//" with "\" in file: ', file_path]);
