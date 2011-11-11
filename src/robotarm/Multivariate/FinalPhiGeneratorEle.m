function [ Phi ] = FinalPhiGeneratorEle( Input, Inputs, NuPosition, CovMatrix )
%FINALPHIGENERATORELE Summary of this function goes here
%   Detailed explanation goes here

    cols = length(NuPosition) + 1;
    Phi = zeros(1, cols);
    
    Phi(1,1) = 1;       % Set w0 = 1
    
    j = 2;
    for k = 1:length(NuPosition)
        Mean = Inputs(NuPosition(k));
        inputNoMean = Input - Mean;
        Phi(j) = exp(-0.5*(inputNoMean * (CovMatrix\inputNoMean')));
        
        j = j +1;
    end
            
 Phi';
end


