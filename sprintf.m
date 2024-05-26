% Advanced example using sprintf in MATLAB

% Define some variables
integerValue = 42;
floatValue = 3.14159265358979;
stringValue = 'MATLAB';
scientificValue = 12345.6789;
charValue = 'A';

% Use sprintf to create a formatted string
formattedString = sprintf('Integer: %d\nFloat: %.4f\nString: %s\nScientific: %e\nCharacter: %c', ...
                          integerValue, floatValue, stringValue, scientificValue, charValue);

% Display the formatted string
disp('Formatted String:');
disp(formattedString);
