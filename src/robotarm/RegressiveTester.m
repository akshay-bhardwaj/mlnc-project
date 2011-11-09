%Generate Data for training
[outputs, inputs] = GenerateData(100);

%Use generated data for training
parameters = TrainRegressor(inputs, outputs);

%Generate data for Testion;
[TestOutputs, TestInputs] = GenerateData(100);

