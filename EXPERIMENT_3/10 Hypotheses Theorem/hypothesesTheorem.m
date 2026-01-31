% written by Rajveer Singh (BT23ECE108)
% Hypothesis testing using Z-test (critical value method)
% Testing manufacturer's claim about battery lifetime

clc;
clear;

% Given data
mu0 = 500;          % Claimed mean lifetime (hours)
xbar = 485;         % Sample mean
sigma = 60;         % Population standard deviation
n = 36;             % Sample size
alpha = 0.05;       % Level of significance

% Step 1: Define hypotheses
% H0: mu >= 500
% H1: mu < 500 (left-tailed test)

% Step 2: Compute test statistic (Z)
z = (xbar - mu0) / (sigma / sqrt(n));

% Step 3: Critical value for left-tailed test
z_critical = -1.645;   % From Z-table at alpha = 0.05

% Step 4: Decision rule
fprintf('Calculated Z value = %.3f\n', z);
fprintf('Critical Z value = %.3f\n', z_critical);

if z < z_critical
    fprintf('Reject H0\n');
    fprintf('Conclusion: The manufacturer’s claim is not supported.\n');
else
    fprintf('Fail to Reject H0\n');
    fprintf('Conclusion: The manufacturer’s claim is supported.\n');
end
