clear all
close all
clc

% vykresleni globu
[x,y,z] = sphere(50);
x = -x;
y = -y;
z = z;
load topo
props.FaceColor= 'texture';
props.Cdata = 1*(topo);
surface(x,y,z,props);
xlabel('x_0')
ylabel('y_0')
zlabel('z_0')
axis equal

 

Sl = 103.986306*pi/180;
Sw = 1.351652*pi/180;
NYl = -74.168944*pi/180; 
NYw = 40.690093*pi/180; 

syms alpha beta

Rz = [cos(alpha) sin(alpha) 0;
      -sin(alpha) cos(alpha) 0;
      0 0 1];
% rotace kolem osy z o zeměpisnou délku Singapuru
Rzsw = subs(Rz,alpha,-Sl); 

Ry = [cos(beta) 0 sin(beta);
    0 1 0;
    -sin(beta) 0 cos(beta)];
% záporná rotace kolem osy y o minus zeměpisnou šířku Singapuru
Rysl = subs(Ry,beta,-Sw);

% Rx = [1 0 0;
%     0 cos(gamma) -sin(gamma);
%     0 sin(gamma) cos(gamma)]

% translace ve směru osy x
P = [1 0 0]';

% pozice Singapuru na globusu
PS = double(Rzsw*Rysl*P)';

% záporná rotace kolem osy z o minus zeměpisnou délku NY  
RzNY = subs(Rz,alpha,-NYl);
% záporná rotace kolem osy y o minus zeměpisnou šířku NY 
RyNY = subs(Ry,beta,-NYw);

% pozice NY
PNY= double(RzNY*RyNY*P)';

% vykresleni pozic na globu
hold on
plot3(PS(1),PS(2),PS(3),'or')
plot3(PNY(1),PNY(2),PNY(3),'or')

%%

k = 100
len = linspace(-Sl,-NYl,k)
wid = linspace(-Sw,-NYw,k)
for i = 1:k
    Rzn = subs(Rz,alpha,len(i));
    Ryn = subs(Ry,beta,wid(i));
    Pn{i} = 1.01*double(Rzn*Ryn*P)';
    
end

points = cell2mat(Pn')
plot3(points(:,1),points(:,2),points(:,3),'r','LineWidth',3);


%       
% T0_1 = [R0_1, r0_1;
%         0 0 0 1]

% plot3(Sl,Sw,'o')


