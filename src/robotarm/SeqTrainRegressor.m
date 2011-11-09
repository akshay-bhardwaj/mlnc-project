function [ paramters ] = SeqTrainRegressor( inputs, outputs )
%SEQTRAINREGRESSOR Summary of this function goes here
%   Detailed explanation goes here

phi = zeros(length(inputs),3);
phi(:,1) = 1;
phi(:,[2:3]) = inputs;
Wml = (phi'*phi)\phi' * outputs;
% Wml will bue used as the W0;
W0 = Wml;

W01 = W0(1,:);
W02 = W0(2,:);

Error1 = 0.5 * sum((outputs(:,2) - (inputs*W01)).^2);
Error1 = 0.5 * sum((outputs(:,2) - (inputs*W02)).^2);







end

