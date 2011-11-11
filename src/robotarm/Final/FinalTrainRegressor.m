function [ parameters ] = FinalTrainRegressor( inputs, outputs )
%FINALTRAINREGRESSOR Summary of this function goes here
%   Detailed explanation goes here

    %[rows, columns] = size(inputs);
    %phi = zeros(rows,columns+1);
    
    %phi(:,1) = 1;
    %phi(:,2:(columns+1)) = PhiGenerator(inputs);
    
    ProbabilityDensityOfTheta1 = pdf('normal',outputs(:,1), inputs(:,1), inputs(:,2));
    ProbabilityDensityOfTheta2 = pdf('normal',outputs(:,2), inputs(:,1), inputs(:,2));
    ProbabilityDensityOfTheta2
    
    % We are using a limit of 0.006 (distribution of probabilty density
    % function for Theta1 & Theta2 with respect to x and y)
    
    NuPositionTheta1 = zeros(1,length(ProbabilityDensityOfTheta1(ProbabilityDensityOfTheta1>0.006)));
    NuPositionTheta2 = zeros(1,length(ProbabilityDensityOfTheta1(ProbabilityDensityOfTheta2>0.006)));
    
    if length(NuPositionTheta1) > length(NuPositionTheta2)
        NuPosition = NuPositionTheta1;
    else
        NuPosition = NuPositionTheta1;
    end
    
    
    count = 1;
    for i = 1:length(ProbabilityDensityOfTheta1)
        if ProbabilityDensityOfTheta1(i) > 0.006
            NuPositionTheta1(count) = i;
            count=count+1;
        end;
    end
    
    count = 1;
    for i = 1:length(ProbabilityDensityOfTheta2)
        if ProbabilityDensityOfTheta2(i) > 0.005
            NuPositionTheta2(count) = i;
            count=count+1;
        end;
    end
          
    SigmaX = std(inputs(:,1));
    SigmaY = std(inputs(:,2));
    
    %CovMatrix = cov(inputs);
    NuPositionTheta2
    
    
    PhiX = FinalPhiGenerator(inputs(:,1), NuPositionTheta1, SigmaX);
    PhiY = FinalPhiGenerator(inputs(:,2), NuPositionTheta2, SigmaY);
    lambda = 100;
    
    ModifiedPhiX = PhiX'*PhiX;
    Wx = (lambda*eye(length(ModifiedPhiX))+ModifiedPhiX)\PhiX' * outputs;
    
    ModifiedPhiY = PhiY'*PhiY;
    Wy = (lambda*eye(length(ModifiedPhiY))+ModifiedPhiY)\PhiY' * outputs;

    parameters.Wx = Wx;
    parameters.Wy = Wy;
%     inputX = inputs(:,1);
%     inputY = inputs(:,2);
    %parameters.Nu = inputX(NuPositionTheta1);
    parameters.NuPosTh1 = NuPositionTheta1;
    parameters.NuPosTh2 = NuPositionTheta2;
    parameters.SigmaX = SigmaX;
    parameters.SigmaY = SigmaY;
    parameters.Inputs = inputs;
      
    
       

end


