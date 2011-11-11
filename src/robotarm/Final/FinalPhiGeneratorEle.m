function [ Phi ] = FinalPhiGeneratorEle( Input, Inputs, NuPosition, SigmaX )
%FINALPHIGENERATORELE Summary of this function goes here
%   Detailed explanation goes here

    rows = length(Input);
    cols = length(NuPosition) + 1;
    Phi = zeros(rows, cols);
    
    Phi(:,1) = 1;
    
    j = 2;
    for k = 1:length(NuPosition)
        Mean = Inputs(NuPosition(k));
        Phi(:,j) = exp((Input-Mean).^2 ./ (2*SigmaX^2));
        j = j +1;
    end
            

end


