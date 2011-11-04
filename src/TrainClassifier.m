function [ parameters ] = TrainClassifier( inputs, outputs )
%TRAINCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    %% Normalising the input data
    inputs = NormaliseData(inputs, 'minrange');
%     for col = 1: 30
%         %%TempMedian = mean(inputs(:,col));
%         %%inputs(:,col) = (inputs(:,col)-min(inputs(:,col)))/(max(inputs(:,col))-min(inputs(:,col)));
%         inputs(:,col) = (inputs(:,col)-median(inputs(:,col)))/(2*std(inputs(:,col))^2);
%     end
    MidVal = length(inputs)/2;
    Train = inputs(1:MidVal,:);
    Error = zeros(100,1);
    
    DistanceMatrix = dist(Train');
    for K = 1:100
        for ItTrain = 1:length(Train)
            [~, Index] = sort(DistanceMatrix(:,ItTrain));
            OutputNeighbor = outputs(Index(2:K+1));
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
            
            if (class == outputs(ItTrain))
                Error(K) = Error(K)-1;
            else
                Error(K) = Error(K)+1;
            end
        end
    end
    
    plot(Error,'g');
    [~, parameters.K] = min(Error);
    parameters.inputs = Train;
    parameters.outputs = outputs(1:MidVal,:);
end

