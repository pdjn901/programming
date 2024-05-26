% Example MATLAB program demonstrating try-catch with switch-case

% Clear workspace and command window
clear;
clc;

% Function to demonstrate error handling
function result = performOperation(operationType)
    switch operationType
        case 'division'
            % This will cause a division by zero error if b is zero
            a = 10;
            b = 0; % Change this to a non-zero value to avoid the error
            result = a / b;
        case 'index'
            % This will cause an index out of bounds error
            arr = [1, 2, 3];
            result = arr(5); % Index 5 does not exist
        case 'file'
            % This will cause a file not found error
            fileName = 'nonexistent_file.txt';
            fileID = fopen(fileName, 'r');
            if fileID == -1
                error('FileOpenError:FileNotFound', 'The file %s does not exist.', fileName);
            end
            result = fread(fileID, '*char')';
            fclose(fileID);
        otherwise
            % This will handle any other unexpected operation types
            error('OperationError:InvalidOperation', 'The operation %s is not supported.', operationType);
    end
end

% Specify the type of operation to perform
operationType = 'division'; % Change this to 'index', 'file', or any other string to test different errors

try
    % Try to perform the operation
    result = performOperation(operationType);
    fprintf('Operation result: %s\n', result);
catch ME
    % Catch any error that occurs and display an error message
    fprintf('An error occurred:\n');
    fprintf('Error identifier: %s\n', ME.identifier);
    fprintf('Error message: %s\n', ME.message);
    
    % Handle different types of errors using switch-case
    switch ME.identifier
        case 'MATLAB:divideByZero'
            fprintf('Error: Division by zero.\n');
        case 'MATLAB:badsubscript'
            fprintf('Error: Index out of bounds.\n');
        case 'FileOpenError:FileNotFound'
            fprintf('Error: The specified file does not exist.\n');
        case 'OperationError:InvalidOperation'
            fprintf('Error: Invalid operation specified.\n');
        otherwise
            fprintf('An unexpected error occurred.\n');
    end
end

% Continue with the rest of the program
fprintf('Program continues...\n');
