function [class] = Classifier(input, parameters)
%CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    [K, Inputs, Outputs] = parameters;
    DistanceMatrix = dist(Inputs);
    [Y, Index] = sort(DistanceMatrix(:,input));
    OutputNeighbor = Ouputs(Index(K));
    Count = 0;
    for i = 1:length(OutputNeighbor)
        if (OutputNeighbor(i) == 1)
            Count = Count + 1;
        end
    end
    
    if ((Count/K) > 1/2)
        class = 1;
    else
        class = 0;
    end
        
    
end

