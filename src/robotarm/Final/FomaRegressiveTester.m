%Number of samples to be generated from GenerateData function
NoOfElements = 500;

%Generate Data for training
[outputs, inputs] = GenerateData(NoOfElements);

%Use generated data for training
parameters = FinalTrainRegressor(inputs, outputs);
%parameters.Wml
%Generate data for Testion;
[TestOutputs, TestInputs] = GenerateData(NoOfElements);

GeneratedOutputs = zeros(NoOfElements,2);

SqErrorTheta = 0;
for i = 1:length(TestInputs)
    ComputedOutput = FinalTestRegressor(parameters, TestInputs(i,:));
    GeneratedOutputs(i,:) = ComputedOutput;
    SqErrorTheta = SqErrorTheta + (ComputedOuput(1)-TestOutputs(i,1))^2 + (ComputedOutput(1)-TestOuputs(i,2))^2;
end


MeanSqErrorTheta = sqrt(SqErrorTheta/NoOfElements);


