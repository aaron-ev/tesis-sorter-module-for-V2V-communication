
global x,global M,global ohm,global Nd;  

R = rand(2,2);
y = rand(2,1);
Nd = 2;
M = 2;
ohm = 2; % It must be a vector, fix it! 
x = rand(2,2);
detectorNearML(y,R);