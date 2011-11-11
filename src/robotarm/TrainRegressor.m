function parameters = TrainRegressor(inputs, outputs)
length(inputs)

InputsMean = mean(inputs);
OutputsMean = mean(outputs);
StdInputs = std(inputs);
StdOutputs = std(outputs);

%inputs = (inputs - InputsMean)/StdInputs;
%inputs(:,1) = inputs(:,1) - InputsMean(1);
% inputs(:,2) = inputs(:,2) - InputsMean(2);
% outputs(:,1) = outputs(:,1) - OutputsMean(1);
% outputs(:,2) = outputs(:,2) - OutputsMean(2);
[rows, columns] = size(inputs);

phi = zeros(rows,columns+1);
%Below commented code for simplest linear basis funciton!
%phi(:,1) = 1;
%phi(:,[2:3]) = inputs;
%phi = phi'; Different notation's of phi

phi(:,1) = 1;
phi(:,2:(columns+1)) = PhiGenerator(inputs);


%Wml = (phi'*phi)\phi' * outputs; %Wml = inv(phi'*phi)*phi' * outputs;
ModifiedPhi = phi'*phi; %Used for calcuation of Wml
lambda = 0.012;
parameters.MeanInputs = InputsMean;
parameters.MeanOutputs = OutputsMean;
parameters.SdInputs = StdInputs;
parameters.SdOutputs = StdOutputs;
parameters.Wml = (lambda*eye(length(ModifiedPhi))+ModifiedPhi)\phi' * outputs;

%det(phi'*phi)
%size(Wml)




        


