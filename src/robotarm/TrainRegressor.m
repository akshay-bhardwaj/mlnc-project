function Wml = TrainRegressor(inputs, outputs)
length(inputs)
phi = zeros(length(inputs),3);
phi(:,1) = 1;
phi(:,[2:3]) = inputs;
%phi = phi'; Different notation's of phi


%Wml = (phi'*phi)\phi' * outputs; %Wml = inv(phi'*phi)*phi' * outputs;
ModifiedPhi = phi'*phi; %Used for calcuation of Wml
lambda = 0.2;
Wml = (lambda*eye(length(ModifiedPhi))+ModifiedPhi)\phi' * outputs;
%det(phi'*phi)
%size(Wml)




        


