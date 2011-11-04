function [class] = Classifier(input, parameters)
%CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    Inputs = parameters.inputs;
    Outputs = parameters.outputs;
    K = parameters.K;
    InputM = [Inputs', input']';
    %% Normalising the input data
    InputM = NormaliseData(InputM, 'minrange');
%     for col = 1: 30
%         %TempMedian = mean(inputs(:,col));
%         %InputM(:,col) = (InputM(:,col)-min(InputM(:,col)))/(max(InputM(:,col))-min(InputM(:,col)));
%         InputM(:,col) = (InputM(:,col)-median(InputM(:,col)))/(2*std(InputM(:,col))^2);
%     end
    DistanceMatrix = dist(InputM');
    [~, Index] = sort(DistanceMatrix(:,length(DistanceMatrix)));
    OutputNeighbor = Outputs(Index(2:K+1));
    Count = 0;
    for i = 1:length(OutputNeighbor)
        if (OutputNeighbor(i) == 1)
            Count = Count + 1;
        end
    end
    
    if (2*Count > K)
        class = 1;
    else
        class = 0;
    end   
end

