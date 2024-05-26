%note: 1) this script has tested with /app/../../ directory only.
    %  2) Not tested with /MatlabTester/../
    %  3) provide directory as an argument while running
function result = backSlash_2_forward_slash(directory)
    if(exist(directory) ~= 7)
        result = false;
        warning("Path not correct");
        return;
    end
    all_items = dir(directory);    
    % Loop through each item
    for i = 1:numel(all_items)
        % Exclude '.' and '..' directories
        if strcmp(all_items(i).name, '.') || strcmp(all_items(i).name, '..')
            continue;
        end                
        % Check if the current item is a directory
        if all_items(i).isdir
            % Recursively traverse the subdirectory
            backSlash_2_forward_slash(fullfile(directory, all_items(i).name));
        else
            % Check if the current item is a MATLAB file (*.m)
            [~, ~, ext] = fileparts(all_items(i).name);
            if strcmp(ext, '.m')
                %disp([Print the name of the MATLAB file ', fullfile(directory, all_items(i).name)]);          
                full_file_name = fullfile(directory, all_items(i).name);
                
                %calling below function, if fprintf(),for "\n"
                paths_exclude_fprintf_lines(full_file_name);          
                fprintf("i[%d],full_file modified:%s \n",i,full_file_name);                
            end
        end
    end
end
