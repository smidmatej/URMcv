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

Rz = [cos(alpha) -sin(alpha) 0;
      sin(alpha) cos(alpha) 0;
      0 0 1];
% rotace kolem osy z o zeměpisnou délku Singapuru
Rzsw = subs(Rz,alpha,Sl); 

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
RzNY = subs(Rz,alpha,NYl);
% záporná rotace kolem osy y o minus zeměpisnou šířku NY 
RyNY = subs(Ry,beta,-NYw);

% pozice NY
PNY= double(RzNY*RyNY*P)';

% vykresleni pozic na globu
hold on
plot3(PS(1),PS(2),PS(3),'or')
plot3(PNY(1),PNY(2),PNY(3),'or')



k = 100
len = linspace(Sl,NYl,k)
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

PS = double(Rzsw*Rysl*P)';
spendlik_S = [1.1 0 0]';
PS_1 = double(Rzsw*Rysl*spendlik_S)';
PNY_1= double(RzNY*RyNY*spendlik_S)';

plot3(PS_1(1),PS_1(2),PS_1(3),'or','MarkerFaceColor','r')
plot3(PNY_1(1),PNY_1(2),PNY_1(3),'or','MarkerFaceColor','r')
plot3([PS(1),PS_1(1)]',[PS(2),PS_1(2)]',[PS(3),PS_1(3)]','r','LineWidth',3)
plot3([PNY(1),PNY_1(1)]',[PNY(2),PNY_1(2)]',[PNY(3),PNY_1(3)]','r','LineWidth',3)

% %% lepsi cesta
% 
% [lat,lon] = track2(Sw/pi*180,Sl/pi*180,NYw/pi*180,NYl/pi*180)
% 
% for i = 1:length(lat)
% 
%     Rz_lat = subs(Rz,alpha,lat(i)*pi/180); 
%     Ry_lon = subs(Ry,beta,lon(i)*pi/180);
%     P_track2 = [1 0 0]';
%     top_track(i,:) = double(Rz_lat*Ry_lon*P_track2)';
%     
% end
% 
% plot3(top_track(:,1),top_track(:,2),top_track(:,3),'y','LineWidth',6);
% figure
% plot3(top_track(:,1),top_track(:,2),top_track(:,3),'y','LineWidth',3);
% %plot3(points(:,1),points(:,2),points(:,3),'r','LineWidth',3);

%% lepsi cesta 2

% Sl = 103.986306*pi/180;
% Sw = 1.351652*pi/180;
% NYl = -74.168944*pi/180; 
% NYw = 40.690093*pi/180; 
Fi1 = 1.351652*pi/180; % latitude
la1 = 103.986306*pi/180; % longitude

Fi2 = 40.690093*pi/180;
la2 = -74.168944*pi/180; 

Fi0 = 0; % latitude rovniku

la12 = la2-la1; % rozdil longitude

alfa1 = atan2(cos(Fi2)*sin(la12),cos(Fi1)*sin(Fi2)-sin(Fi1)*cos(Fi2)*cos(la12));
alfa2 = atan2(cos(Fi1)*sin(la12),-cos(Fi2)*sin(Fi1)+sin(Fi2)*cos(Fi1)*cos(la12));

% uhlova vzdalenost mezi Singapurem a NY
sigma12 = atan2(sqrt((cos(Fi1)*sin(Fi2)-sin(Fi1)*cos(Fi2)*cos(la12))^2+(cos(Fi2)*sin(la12))^2),sin(Fi1)*sin(Fi2)+cos(Fi1)*cos(Fi2)*cos(la12))
% uhel pod kterym vychazi kruh z rovniku
alfa0 = atan2(sin(alfa1)*cos(Fi1),sqrt(cos(alfa1)^2+(sin(alfa1)^2)*sin(Fi1)^2));
% uhlova vzdalenost rovniku od Singapuru
sigma01 = atan2(tan(Fi1),cos(alfa1));

la01 = atan2(sin(alfa0)*sin(sigma01),cos(sigma01));
% longitude na ktery se velky kruh protina s rovnikem = nejaky polednik
la0 = la1 - la01;

RZ_A = subs(Rz,alpha,la0);
A = double(RZ_A*[1.1 0 0]')'
plot3(A(1),A(2),A(3),'b+')
sigma02 = sigma01+sigma12
% figure
% hold on
j = 1;
for sigma = -sigma01:-0.01:-sigma02 % navzorkujeme si uhel sigma
    
    % latitude nejakeho naseho bodu
    FI = atan2(cos(alfa0)*sin(sigma),sqrt(cos(sigma)^2+sin(alfa0)^2*sin(sigma)^2));
% 	FI = atan((cos(alfa0)*sin(sigma))/(sqrt(cos(sigma)^2+sin(alfa0)^2*sin(sigma)^2)));
    % longitude naseho bodu
    LAMBDA = atan2(sin(alfa0)*sin(sigma),cos(sigma))+la0;
%     LAMBDA = atan((sin(alfa0)*sin(sigma))/(cos(sigma)))+la0;

    RY_FI = subs(Ry,beta,FI);
    RZ_LAMBDA = subs(Rz,alpha,LAMBDA); 
    
    P_TRACK = [1 0 0]';
    GREAT_CIRCLE(j,:) = double(RZ_LAMBDA*RY_FI*P_TRACK)';
%     scatter(FI,LAMBDA)
    j=j+1;

end

plot3(GREAT_CIRCLE(:,1),GREAT_CIRCLE(:,2),GREAT_CIRCLE(:,3),'y','LineWidth',6);
% legend({'','První nalezená cesta','Ortodroma'},'Interpreter','Latex')
% figure
% plot3(GREAT_CIRCLE(:,1),GREAT_CIRCLE(:,2),GREAT_CIRCLE(:,3),'y','LineWidth',3);
