function [ Phi ] = FinalPhiGenerator( Inputs, NuPosition, SigmaX )
%FINALPHIGENERATOR Summary of this function goes here
%   Detailed explanation goes here
    rows = length(Inputs);
    cols = length(NuPosition) + 1;
    Phi = zeros(rows, cols);
    
    Phi(:,1) = 1;
    
    j = 2;
    for k = 1:length(NuPosition)
        Mean = mean(Inputs(NuPosition(k)));
        Phi(:,j) = exp((Inputs-Mean).^2 ./ (2*SigmaX^2));
        j = j +1;
    end
            

end

