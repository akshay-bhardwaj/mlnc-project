function [ paramters ] = SeqTrainRegressor( inputs, outputs )re u in
%SEQTRAINREGRESSOR Summary of this function goes here
%   Detailed explanation goes here

phi = zeros(length(inputs),3);
phi(:,1) = 1;
phi(:,[2:3]) = inputs;
Wml = (phi'*phi)\phi' * outputs;
% Wml will bue used as the W0;
W0 = Wml;


%%Parameters for Optimisation of Weight
%Block Start
neta = 0.1
W10 = W0(1,:);
W20 = W0(2,:);
%Block End


%%Initialising Parameters for for loop
%Block Start
W1 = W10;
W2 = W20;
%Block End

for i = length(inputs)
input = inputs(:,i);
output = output(j);

Error1 = 0.5 * sum((output(:,2) - (input*W10)).^2);
Error1 = 0.5 * sum((output(:,2) - (input*W20)).^2);

GradientError1 = gradient(Error1);
GradientError2 = gradiemt(Error2);



W1next = W1 - neta*GradientError1;
W2next = W2 - neta*GradientError2;







end

