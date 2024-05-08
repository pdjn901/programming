% Define the file path of the MATLAB file
file_path = 'path/to/your/matlab/file.m';

% Read the contents of the file
fid = fopen(file_path, 'r');
file_contents = fread(fid, '*char').';
fclose(fid);

% Find lines that contain fprintf statements
fprintf_lines = strfind(file_contents, 'fprintf');

% Perform the replacement for '\' excluding '\n' and excluding fprintf lines
file_contents_new = '';
start_index = 1;
for i = 1:length(fprintf_lines)
    % Append the portion of file_contents from the previous fprintf line to the current fprintf line
    file_contents_new = [file_contents_new, regexprep(file_contents(start_index:fprintf_lines(i)-1), '\\([^n])', '/$1')];
    
    % Find the end of the fprintf line
    end_index = strfind(file_contents(fprintf_lines(i):end), ';');
    end_index = end_index(1) + fprintf_lines(i) - 1;
    
    % Append the fprintf line without replacement
    file_contents_new = [file_contents_new, file_contents(fprintf_lines(i):end_index)];
    
    % Update the start index for the next iteration
    start_index = end_index + 1;
end

% Append the portion of file_contents after the last fprintf line
file_contents_new = [file_contents_new, regexprep(file_contents(start_index:end), '\\([^n])', '/$1')];

% Write the modified contents back to the file
fid = fopen(file_path, 'w');
fwrite(fid, file_contents_new);
fclose(fid);

disp(['Replaced "\" with "/" in file: ', file_path]);
