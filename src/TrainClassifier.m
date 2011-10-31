function [ parameters ] = TrainClassifier( inputs, outputs )
%TRAINCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    K = 3;
    MidVal = length(inputs)/2;
    Train = inputs(1:MidVal);
    Test = inputs(MidVal+1:length(inputs));
    %DistanceMatrix = dist(Train);
    Error = zeros(10);
    for ItError = 1:10
        for ItTrain = 1:length(Train)
            Class = Classifier(ItTrain, [K Train outputs(1:MidVal)]);
            if (Class == outputs(ItTrain))
                Error(ItError) = Error(ItError)-1;
            else
                Error(ItError) = Error(ItError)+1;
            end
        end
    end
    
    plot(1:10, Error);
end

