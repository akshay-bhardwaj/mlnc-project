function [ parameters ] = TrainClassifier( inputs, outputs )
%TRAINCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

    %% Separate classes
    [C, I] = sort(outputs);
    nOfZeros = sum(C == 0);
    nOfOnes = sum(C == 1);

    Class0 = zeros(nOfZeros, 30);
    for point = 1:nOfZeros
        Class0(point,:) = inputs(I(point),:);                  % Store point as a point belonging to class 0
    end

    Class1 = zeros(nOfOnes, 30);
    for point = 1:nOfOnes
        Class1(point,:) = inputs(I(point + nOfZeros),:);       % Store point as a point belonging to class 1
    end

    %% Compute Sigma and mu for given training data
    Mu0 = mean(Class0);                         % Compute mean value for each dimension
    Mu1 = mean(Class1);
    Sigma = cov(inputs);                       % Compute covariance matrix

    %% Return parameters to be fed in the Classifier for testing
    parameters.Mu0 = Mu0;
    parameters.Mu1 = Mu1;
    parameters.Sigma = Sigma;
    parameters.pC0 = nOfZeros / (nOfZeros + nOfOnes);   % Prior probability for C0
    parameters.pC1 = nOfOnes / (nOfZeros + nOfOnes);    % Prior probability for C1

end
