function [ Phi ] = PhiGenerator( Inputs )
%PHIGENERATOR Summary of this function goes here
%   Detailed explanation goes here
[rows, columns] = size(Inputs);
Mean = zeros(1,columns);
Sigma = zeros(1, columns);
Phi = zeros(rows, columns);
% Figure out mean for each vector component
for i = 1:columns
    Mean(i) = mean(Inputs(:,i));
    Sigma(i) = std(Inputs(:,i));
end

for i = 1:columns
    Phi(:,i) = exp((Inputs(:,i)-Mean(i)).^2 ./ (2*Sigma(i)^2));
end;


    




