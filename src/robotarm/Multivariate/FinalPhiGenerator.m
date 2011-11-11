function [ Phi ] = FinalPhiGenerator( Inputs, NuPosition, CovMatrix )
%FINALPHIGENERATOR Summary of this function goes here
%   Detailed explanation goes here
    rows = length(Inputs);
    cols = length(NuPosition) + 1;
    Phi = zeros(rows, cols);
    
    Phi(:,1) = 1;
    
    j = 2;
    for k = 1:length(NuPosition)
        Mean = Inputs(NuPosition(k));
        inputNoMean = Inputs - Mean;
        for i = 1:length(inputNoMean)
            Phi(i,j) = exp(-0.5*((inputNoMean(i,:)/(CovMatrix)*inputNoMean(i,:)')));
        end
        j = j +1;
    end
            

end

