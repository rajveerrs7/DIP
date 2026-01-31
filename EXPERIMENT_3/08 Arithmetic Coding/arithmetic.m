%Written by Rajveer Singh (BT23ECE108)
%Arithmatic codeing
clc;
clear;

% Symbols and probabilities
symbols = ['A','B','C','D'];
prob = [0.4 0.3 0.2 0.1];

% Message to encode
msg = 'ABCD';

% Cumulative probability table
cum_prob = [0 cumsum(prob)];

% Initial range
low = 0;
high = 1;

fprintf('Step-wise Arithmetic Coding:\n\n');
fprintf('Symbol\tLow\t\tHigh\n');

for i = 1:length(msg)
    % Find symbol index
    idx = find(symbols == msg(i));
    
    range = high - low;
    
    % Update range
    new_low  = low + range * cum_prob(idx);
    new_high = low + range * cum_prob(idx+1);
    
    low = new_low;
    high = new_high;
    
    fprintf('%c\t%.6f\t%.6f\n', msg(i), low, high);
end

% Final arithmetic code (any number in [low, high))
code = (low + high) / 2;

fprintf('\nFinal Arithmetic Code Value = %.8f\n', code);
