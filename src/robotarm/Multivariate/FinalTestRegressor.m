function [ output ] = FinalTestRegressor( parameters, input )
%FINALTESTREGRESSOR Summary of this function goes here
%   Detailed explanation goes here

    W = parameters.W;
    NuPosition = parameters.NuPosition;
    CovMatrix = parameters.CovMatrix;
    Phi = FinalPhiGeneratorEle(input, parameters.Inputs, NuPosition, CovMatrix);
            
    output = Phi*W;


end

