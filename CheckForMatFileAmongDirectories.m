% Define the root directory
root_directory = 'C:\your\root\directory';

% Define a function to recursively traverse directories and identify MATLAB files
function traverse_directory(directory)
    % Get a list of all items (files and directories) in the current directory
    all_items = dir(directory);
    
    % Loop through each item
    for i = 1:numel(all_items)
        % Exclude '.' and '..' directories
        if strcmp(all_items(i).name, '.') || strcmp(all_items(i).name, '..')
            continue;
        end
        
        % Print the name of the current item
        disp(['Item: ', fullfile(directory, all_items(i).name)]);
        
        % Check if the current item is a directory
        if all_items(i).isdir
            % Recursively traverse the subdirectory
            traverse_directory(fullfile(directory, all_items(i).name));
        else
            % Check if the current item is a MATLAB file (*.m)
            [~, ~, ext] = fileparts(all_items(i).name);
            if strcmp(ext, '.m')
                % Print the name of the MATLAB file
                disp(['MATLAB file: ', fullfile(directory, all_items(i).name)]);
            end
        end
    end
end

% Call the function to traverse the root directory
traverse_directory(root_directory);
