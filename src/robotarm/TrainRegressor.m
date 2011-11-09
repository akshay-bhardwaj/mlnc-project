function Wml = TrainRegressor(inputs, outputs)

phi = zeros(100,3);
phi(:,1) = 1;
phi(:,[2:3]) = inputs;
%phi = phi'; Different notation's of phi


Wml = (phi'*phi)\phi' * outputs; %Wml = inv(phi'*phi)*phi' * outputs;
det(phi'*phi)
size(Wml)




        


