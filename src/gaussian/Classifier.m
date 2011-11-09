function [class] = Classifier(input, parameters)
%CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

    % Get parameters by splitting structure
    Mu0 = parameters.Mu0;
    Mu1 = parameters.Mu1;
    Sigma = parameters.Sigma;
    pC0 = parameters.pC0;
    pC1 = parameters.pC1;

    %% Compute likelihood
    alpha = 1 / (sqrt((2*pi) ^ 30) * sqrt(det(Sigma)));
    pXC0 = alpha * exp( -(1/2) * (input - Mu0) * (Sigma \ (input - Mu0)'));        % Compute likelihood for Class 0
    pXC1 = alpha * exp( -(1/2) * (input - Mu1) * (Sigma \ (input - Mu1)'));        % Compute likelihood for Class 1
    
    %% Classify point 
    %% Compute Bayes - pCX = alpha * pXC * pC;
%     pC0 = 0.5;
%     pC1 = 0.5;
    pC0X = (pXC0 * pC0) / ((pXC0 * pC0) + (pXC1 * pC1));
    pC1X = (pXC1 * pC1) / ((pXC0 * pC0) + (pXC1 * pC1));
     
    if (pC0X > pC1X)
        class = 0;
    elseif (pC1X >= pC0X)
        class = 1;
    end
end