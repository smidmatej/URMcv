% vykresleni globu
[x,y,z] = sphere(50);
x = -x;
y = -(y);
z = (z)
load topo
props.FaceColor= 'texture';
props.Cdata = 1*(topo);
surface(x,y,z,props);
xlabel('x_0')
ylabel('y_0')
zlabel('z_0')
axis equal



Sl = -103.986306*pi/180
Sw = 1.351652*pi/180
NYl = 74.168944*pi/180
NYw = -40.690093*pi/180

syms alfa

Rz = [cos(alfa) sin(alfa) 0;
      -sin(alfa) cos(alfa) 0;
      0 0 1]
      
Ry = [cos(alfa) 0 sin(alfa);
    0 1 0;
    -sin(alfa) 0 cos(alfa)]
Rx = [1 0 0;
    0 cos(alfa) -sin(alfa);
    0 sin(alfa) cos(alfa)]
Rzsw = subs(Rz,alfa,Sl)
Rysl = subs(Ry,alfa,Sw)
RzNY = subs(Rz,alfa,NYl)
RyNY = subs(Ry,alfa,NYw)

P = [1 0 0]'

PS= double(Rzsw*Rysl*P)'
PNY= double(RzNY*RyNY*P)'
hold on
%plot3(PS(1),PS(2),PS(3),'o')
plot3(PNY(1),PNY(2),PNY(3),'o')

Rzsw = subs(Rz,alfa,Sl)
Rysl = subs(Ry,alfa,Sw)

k = 100
len = linspace(Sl,NYl,k)
wid = linspace(Sw,NYw,k)
for i = 1:k
    Rzn = subs(Rz,alfa,len(i));
    Ryn = subs(Ry,alfa,wid(i));
    Pn{i} = 1.01*double(Rzn*Ryn*P)';
    
end

points = cell2mat(Pn')
plot3(points(:,1),points(:,2),points(:,3),'LineWidth',1);


%       
% T0_1 = [R0_1, r0_1;
%         0 0 0 1]

% plot3(Sl,Sw,'o')

