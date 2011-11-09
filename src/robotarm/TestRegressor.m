function output = TestRegressor( parameters, input )
%TESTREGRESSOR Summary of this function goes here
%   Function is used to Test the Regressor system that was developed using
%   Train Regressor.
%   output variable the has the estimated theta1 and theta2

inputTrans = [1 input]';
output = parameters'*inputTrans;

end

