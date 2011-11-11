function [ outputs, inputs ] = GenerateData( numSamples )
%GENERATEDATA Summary of this function goes here
%   Detailed explanation goes here

l1 = 43; %length of first arm	
	
p=0.5;	
select = rand(numSamples,1)>p;	
  


l1 = 43;  %length of first arm 
l2 = 70; %length of second arm	
theta1U	= randn(numSamples,1)+rand(numSamples,1)*195-65;	
theta2U = randn(numSamples,1)+rand(numSamples,1)*155;	
theta1G	= randn(numSamples,1)*31 + 27.5;	
theta2G = randn(numSamples,1)*20 + 95;
p=0.5;   
select   =   rand(numSamples,1)>p;   
theta1   =   theta1U;   
theta2   =   theta2U;   
theta1(select)   =   theta1G(select);   
theta2(select)   =   theta2G(select);   
   
%generate   a   grid   of   theta1   and   theta2   values   
X   =   randn(numSamples,1)   +   l1   *   cosd(theta1)   +   l2   *   cosd(theta1   +   theta2);   %   compute   x   coordinates   
Y   =   randn(numSamples,1)   +   l1   *   sind(theta1)   +   l2   *   sind(theta1   +   theta2);   %   compute   y   coordinates   
data1   =   [X(:)   Y(:)   theta1(:)];   %   create   x-­‐y-­‐theta1   dataset   
data2   =   [X(:)   Y(:)   theta2(:)];   %   create   x-­‐y-­‐theta2   dataset   
   
subplot(2,1,1)   
plot(theta1(:),   theta2(:),   'b.');   
xlabel('\theta_1   [deg]')   
ylabel('\theta_2   [deg]')   
title('(\theta_1,\theta_2)   joint   configura>on   space')   
axis   equal   
subplot(2,1,2)   
plot(X(:),   Y(:),   'r.');   
xlabel('X')   
ylabel('Y')   
title('(X-­‐Y)   cartesian   space')   
axis   equal;
inputs = [X Y];	
outputs = [theta1 theta2];	

end

