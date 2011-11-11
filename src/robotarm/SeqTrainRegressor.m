function [ parameters ] = SeqTrainRegressor( inputs, outputs )
%SEQTRAINREGRESSOR Summary of this function goes here
%   Detailed explanation goes here

[rows, cols] = size(inputs);

phi = zeros(rows,cols+1);
phi(:,1) = 1;
phi(:,[2:(cols+1)]) = inputs;
Wml = (phi'*phi)\phi' * outputs;
% Wml will bue used as the W0;
W0 = Wml;

size(Wml)
%%Parameters for Optimisation of Weight
%Block Start
neta = 0.1;
W10 = W0(:,1);
W20 = W0(:,2);
%Block End


%%Initialising Parameters for for loop
%Block Start
W1 = W10;
W2 = W20;
%Block End

for i = 1:rows
	input(1) = 1;
	input(2:(cols+1)) = inputs(i,:)
	output = outputs(i,:)

	size(W1)
	size(input)
%	error1 = 0.5 * sum((output(:,1) - (w1'*input)).^2)
%	error2 = 0.5 * sum((output(:,2) - (w2'*input)).^2)
	Error1 = 0.5 * sum((output(:,1) - (W1'*input')).^2)
	Error2 = 0.5 * sum((output(:,2) - (W2'*input')).^2)

	GradientError1 = gradient(Error1)
	GradientError2 = gradient(Error2)

	W1next = W1 - neta*GradientError1;
	W2next = W2 - neta*GradientError2;
    
    %Update W
    W1 = W1next
    W2 = W2next

end

parameters.W1 = W1;
parameters.W2 = W2;



