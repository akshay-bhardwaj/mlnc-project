function output = TestRegressor( parameters, input )
%TESTREGRESSOR Summary of this function goes here
%   Function is used to Test the Regressor system that was developed using
%   Train Regressor.
%   output variable the has the estimated theta1 and theta2


%   Initialising Parameters
InputsMean = parameters.MeanInputs;
OutputsMean = parameters.MeanOutputs;
StdInputs = parameters.SdInputs;
StdOutputs = parameters.SdOutputs;
Wml = parameters.Wml; 

% ModifiedInput = [0 0];
% ModifiedInput(1) = (input(1) - InputsMean(1))/StdInputs(1);
% ModifiedInput(2) = (input(2) - InputsMean(2))/StdInputs(2);


% inputTrans = [1, ModifiedInput]';
inputTrans = [1, PhiGenerator(input)]';

ModifiedOutput = Wml'*inputTrans;
output = [0 0];
output(1) = OutputsMean(1) + StdOutputs(1)*ModifiedOutput(1);
output(2) = OutputsMean(2) + StdOutputs(2)*ModifiedOutput(2);

%inputTrans = [1 input]';
%output = parameters'*inputTrans;

end

