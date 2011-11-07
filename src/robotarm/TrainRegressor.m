function Wml = TrainRegressor(inputs, outputs);

phi = zeros(100,3);
phi(:,1) = 1;
phi(:,[2:3]) = inputs;

Wml = inv(phi'*phi)*phi' * outputs;
det(phi'*phi)
size(Wml)




        


