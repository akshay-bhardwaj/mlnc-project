%Number of samples to be generated from GenerateData function
NoOfElements = 500;

%Generate Data for training
[outputs, inputs] = GenerateData(NoOfElements);

%Use generated data for training
parameters = TrainRegressor(inputs, outputs);

%Generate data for Testion;
[TestOutputs, TestInputs] = GenerateData(NoOfElements);

GeneratedOutputs = zeros(NoOfElements,2);

SqErrorTheta = 0;
for i = 1:length(TestInputs)
    ComputedOutput = TestRegressor(parameters, TestInputs(i,:));
    GeneratedOutputs(i,:) = ComputedOutput;
    SqErrorTheta = SqErrorTheta + (TestOutputs(i,1) - ComputedOutput(1))^2 + (TestOutputs(i,2) - ComputedOutput(2))^2;
    
end


MeanSqErrorTheta = sqrt(SqErrorTheta/NoOfElements);




   
    
    



