function [ output ] = FinalTestRegressor( parameters, input )
%FINALTESTREGRESSOR Summary of this function goes here
%   Detailed explanation goes here

    Wx = parameters.Wx;
    Wy = parameters.Wy;
    NuPositionTheta1 = parameters.NuPosTh1;
    NuPositionTheta2 =parameters.NuPosTh2;
    SigmaX = parameters.SigmaX; 
    SigmaY = parameters.SigmaY;
    PhiX = FinalPhiGeneratorEle(input(1), parameters.Inputs, NuPositionTheta1, SigmaX);
    PhiY = FinalPhiGeneratorEle(input(2), parameters.Inputs, NuPositionTheta2, SigmaY);
        
    output = PhiX*Wx + PhiY*Wy;


end

