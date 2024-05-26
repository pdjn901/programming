% Example MATLAB program demonstrating try-catch

% Clear workspace and command window
clear;
clc;

% Specify the file name
fileName = 'example.txt';

try
    % Try to open the file
    fileID = fopen(fileName, 'r');
    
    % Check if file was successfully opened
    if fileID == -1
        error('FileOpenError:FileNotFound', 'The file %s does not exist.', fileName);
    end
    
    % Read data from the file
    fileContent = fread(fileID, '*char')';
    
    % Close the file
    fclose(fileID);
    
    % Display the content of the file
    fprintf('File Content:\n%s\n', fileContent);
    
catch ME
    % Catch any error that occurs and display an error message
    fprintf('An error occurred:\n');
    fprintf('Error identifier: %s\n', ME.identifier);
    fprintf('Error message: %s\n', ME.message);
    
    % Additional actions based on the type of error
    switch ME.identifier
        case 'FileOpenError:FileNotFound'
            fprintf('Please check the file name and try again.\n');
        otherwise
            fprintf('An unexpected error occurred.\n');
    end
end

% Continue with the rest of the program
fprintf('Program continues...\n');
