clc;
clear all;
close all;
%% 1) cast - globus
%vykresleni globu
[x,y,z] = sphere(50);
x = -x;
y = -y;
load topo;
props.FaceColor = 'texture';
props.Cdata = topo;
surface(x,y,z,props);
xlabel('x');
ylabel('y');
zlabel('z');
axis equal;
grid on;
hold on;
set(gcf,'color','w');

%vykresleni bodu
d1 = -44.296875; % jih gronska
s1= 60.152442;
d2 = 19.467773; % jih afriky
s2 = -34.234512;
R = 1;

%matice
T_1_0 = [cosd(d1), sind(d1),0,0; sind(d1), cosd(d1),0,0; 0,0,1,0;0,0,0,1];
T_2_1 = [cosd(-s1), 0,sind(-s1),0; 0, 1,0,0; -sind(-s1),0,cosd(-s1),0;0,0,0,1];
T_3_2 = [1, 0,0,R; 0, 1,0,0; 0,0,1,0;0,0,0,1];

T2_1_0 = [cosd(d2), sind(d2),0,0; sind(d2), cosd(d2),0,0; 0,0,1,0;0,0,0,1];
T2_2_1 = [cosd(-s2), 0,sind(-s2),0; 0, 1,0,0; -sind(-s2),0,cosd(-s2),0;0,0,0,1];
T2_3_2 = [1, 0,0,R; 0, 1,0,0; 0,0,1,0;0,0,0,1];

pozice = T_1_0 * T_2_1 * T_3_2
T_3_0 = pozice(1:3,4);
pozice2 = T2_1_0 * T2_2_1 * T2_3_2
T2_3_0 = pozice2(1:3,4);

for i=1:1:2
    if i == 1
    	pom1 = s1*(pi/180);
    	pom2 = d1*(pi/180);
    else
    	pom1 = s2*(pi/180);
    	pom2 = d2*(pi/180);
    end
    T_vysledne = transformace(R, pom1, pom2); 
    T_translace = T_vysledne*[eye(3) [0.15 0 0]'; 0 0 0 1]; %translavce
           
    prvek(:,i) = T_vysledne(1:3,4);
    souradnice = T_translace(1:3,4);
    
    plot3(souradnice(1), souradnice(2), souradnice(3), 'black.', 'MarkerSize',25);
    hold on
    plot3([prvek(1,i) souradnice(1)], [prvek(2,i) souradnice(2)], [prvek(3,i) souradnice(3)], 'r');
    hold on
end

n = 100;
D = linspace(d1,d2,n);
S = linspace(s1,s2,n);
cesta = [D,S];
for i = 1:n
    T3_1_0 = [cosd(D(i)), sind(D(i)),0,0; sind(D(i)), cosd(D(i)),0,0; 0,0,1,0;0,0,0,1];
    T3_2_1 = [cosd(-S(i)), 0,sind(-S(i)),0; 0, 1,0,0; -sind(-S(i)),0,cosd(-S(i)),0;0,0,0,1];
    T3_3_2 = [1, 0,0,R; 0, 1,0,0; 0,0,1,0;0,0,0,1];
    
    vysledna_pozice = T3_1_0 * T3_2_1 * T3_3_2
    T3_3_0 = vysledna_pozice(1:3,4);
    plot3(T3_3_0(1),T3_3_0(2),T3_3_0(3),'r*','MarkerSize',3)
    hold on;
end
%% 2) cast - ukoly 1-3) DGM, IGM, POKU, IOKU
a1 = 2;
a2 = 1.5;
a3 = 0.5;
x = 0;
y = 0;

theta1 = 0;
theta2 = 0;
theta3 = 0;
T_0 = eye(4)
sestavene_DH_parametry = [0, theta1, a1, 0;
                          0, theta2, a2, 0;
                          0, theta3, a3, 0;]

[T_01, T_12, T_23, T_02, T_03] = DH_parametry(sestavene_DH_parametry)

% Link1
rameno1.A = T_0(1:3, 4); %[T0(1,4), T0(2,4), T0(3,4)];
rameno1.B = T_01(1:3, 4); %[T01(1,4), T01(2,4), T01(3,4)];
rameno1.CG = (rameno1.A + rameno1.B)./2;
rameno1.R = T_01(1:3,1:3);
rameno1.osa = T_0(1:3,3); %osa rotace z

% Link2
rameno2.A = T_01(1:3, 4);
rameno2.B = T_02(1:3, 4);
rameno2.CG = (rameno2.A + rameno2.B)./2;
rameno2.R = T_02(1:3,1:3);
rameno2.osa = T_01(1:3,3); %osa rotace z

% Link3
rameno3.A = T_02(1:3, 4);
rameno3.B = T_03(1:3, 4);
rameno3.CG = (rameno3.A + rameno3.B)./2;
rameno3.R = T_03(1:3,1:3);
rameno3.osa = T_02(1:3,3); %osa rotace z
%% simulace
%sim('URM_DGM_2a.slx');
%sim('URM_IGM_2b.slx'); %nastavit volbu reseni ve funkci +-
%sim('URM_POKU_3a.slx');
%sim('URM_POKU_3b.slx');
%sim('URM_IOKU_3b.slx'); %funguje jen do cca 20s, potom dosahne
%singularniho bodu, musel bych prepinat reseni
%% 4) IOKU trajektorie
A = [2; 0.5]; % bod A
B = [0; 1]; % bod B
C = [2; 2.5]; % bod C
r = 0.3; % polomer kruznice
vmax = 1; % maximalni rychlost

n_BA = (A - B)/ norm(A-B); % smerovy vektor z B do A
n_BC = (C - B)/ norm(C-B); % smerovy vektor z B do C
n_BS = (n_BA  + n_BC)/norm(n_BA  + n_BC); % smerovy vektor z B do S

K1 = n_BA * n_BA' * n_BS - n_BS; 
l = r/(sqrt(K1' * K1)); % konstantni vzdalenost z B do S
S = B + n_BS * l; % souradnice stredu kruznice
k = n_BA' * (A - S); 

P_A = A - n_BA * k; % pocatecni bod oblouku
P_C = B + norm(P_A - B) * n_BC; %koncovy bod oblouku

dfi = acos((P_C - S)' * (P_A - S) / r^2); %delta fi

s1 = norm(P_A - A); % prvni usek - usecka
sk = r * dfi; %druhy usek - oblouk
s2 = norm(P_C - C); % treti usek - usecka

smax = s1 + sk + s2; % maximalni draha
a = 0; % zrychleni
tmax = smax/vmax; % maximalni cas

%% simulace trajektorie
sim('URM_IOKU_trajektorie_4_pokus.slx');

%% plot trajektorie
figure;
plot(poloha.signals.values(:,1), poloha.signals.values(:,2))
hold on;
plot(A(1),A(2),'ro',B(1),B(2),'go',C(1),C(2),'bo',S(1),S(2),'kd',P_A(1),P_A(2),'c*',P_C(1),P_C(2),'m*');
legend('traj. KE','A','B','C','S','PA','PC');
title('Vygenerovana trajektorie');
grid on;
set(gcf,'color','w');
xlabel('x');
ylabel('y');

%% plot zobecnene souradnice - poloha, rychlost, zrychleni
time = poloha.time;
figure;
axis(1) = subplot(3,1,1);
grid on;
hold on;
plot(time, poloha.signals.values(:,1), 'r', time, poloha.signals.values(:,2), 'g', time, poloha.signals.values(:,3), 'b');
legend('x', 'y', '\phi');
ylabel('[m]');
title('Poloha');
hold off;

axis(2) = subplot(3,1,2);
hold on;
grid on;
plot(time, rychlost.signals.values(:,1), 'r', time, rychlost.signals.values(:,2), 'g', time, rychlost.signals.values(:,3), 'b');
title('Rychlost');
legend('x', 'y', '\phi');
ylabel('[m/s]');
hold off;

axis(3) = subplot(3,1,3);
hold on;
plot(time, zrychleni.signals.values(:,1), 'r', time, zrychleni.signals.values(:,2), 'g', time, zrychleni.signals.values(:,3), 'b');
title('Zrychleni');
legend('x', 'y', '\phi');
ylabel('[m/s^2]');
xlabel('cas [s]');
grid on;
hold off;
set(gcf,'color','w');
linkaxes(axis, 'x');

%% plot kloubove souradnice - poloha, rychlost, zrychleni
time = kloub_poloha.time;
figure;
axis(1) = subplot(3,1,1);
grid on;
hold on;
plot(time, kloub_poloha.signals.values(:,1), 'r', time, kloub_poloha.signals.values(:,2), 'g', time, kloub_poloha.signals.values(:,3), 'b');
legend('\theta_1', '\theta_2', '\theta_3');
ylabel('[m]');
title('Poloha');
hold off;

axis(2) = subplot(3,1,2);
hold on;
grid on;
plot(time, kloub_rychlost.signals.values(:,1), 'r', time, kloub_rychlost.signals.values(:,2), 'g', time, kloub_rychlost.signals.values(:,3), 'b');
title('Rychlost');
legend('\theta_1', '\theta_2', '\theta_3');
ylabel('[m/s]');
hold off;

axis(3) = subplot(3,1,3);
hold on;
plot(time, kloub_zrychleni.signals.values(:,1), 'r', time, kloub_zrychleni.signals.values(:,2), 'g', time, kloub_zrychleni.signals.values(:,3), 'b');
title('Zrychleni');
legend('\theta_1', '\theta_2', '\theta_3');
ylabel('[m/s^2]');
xlabel('cas [s]');
grid on;
hold off;
set(gcf,'color','w');
linkaxes(axis, 'x');

%% 6 ukol
% Meshgrid
mesh_phi = -0.5:pi/82:pi/2; %da 55 prvku
mesh_smax = 0:(smax/54):smax;
normy = zeros(55);
for i=1:length(mesh_phi)
    uhel_phi = mesh_phi(i);
    sim('URM_6_test.slx');
    for k=1:length(mesh_smax)
        normy(i,k) = norm(kloub_rychlost.signals.values(k,:));
    end
end
[mesh_x,mesh_y] = meshgrid(mesh_smax, mesh_phi);
%%
figure;
surf(mesh_x, mesh_y, normy);
view(0,90);
hold on;
ylim([-0.5, pi/2]);
xlabel('trajektorie');
ylabel('\phi');
set(gcf,'color','w');

%% 6b
sim('URM_trajektorie_6b.slx');
%%
figure;
surf(mesh_x, mesh_y, normy);
view(0,90)
hold on
ylim([-0.5, pi/2]);
xlabel('trajektorie');
ylabel('\phi');
%zlabel('normy');
plot3([0, smax], [pi/2, 0], [max(max(normy)),max(max(normy))], 'y', 'LineWidth', 2);
set(gcf,'color','w');

%% 6b plot zobecnene souradnice - poloha, rychlost, zrychleni
time = poloha.time;
figure;
axis(1) = subplot(3,1,1);
grid on;
hold on;
plot(time, poloha.signals.values(:,1), 'r', time, poloha.signals.values(:,2), 'g', time, poloha.signals.values(:,3), 'b');
legend('x', 'y', '\phi');
ylabel('[m]');
title('Poloha');
hold off;

axis(2) = subplot(3,1,2);
hold on;
grid on;
plot(time, rychlost.signals.values(:,1), 'r', time, rychlost.signals.values(:,2), 'g', time, rychlost.signals.values(:,3), 'b');
title('Rychlost');
legend('x', 'y', '\phi');
ylabel('[m/s]');
hold off;

axis(3) = subplot(3,1,3);
hold on;
plot(time, zrychleni.signals.values(:,1), 'r', time, zrychleni.signals.values(:,2), 'g', time, zrychleni.signals.values(:,3), 'b');
title('Zrychleni');
legend('x', 'y', '\phi');
ylabel('[m/s^2]');
xlabel('cas [s]');
grid on;
hold off;
set(gcf,'color','w');
linkaxes(axis, 'x');

%6b plot kloubove souradnice - poloha, rychlost, zrychleni
time = kloub_poloha.time;
figure;
axis(1) = subplot(3,1,1);
grid on;
hold on;
plot(time, kloub_poloha.signals.values(:,1), 'r', time, kloub_poloha.signals.values(:,2), 'g', time, kloub_poloha.signals.values(:,3), 'b');
legend('\theta_1', '\theta_2', '\theta_3');
ylabel('[m]');
title('Poloha');
hold off;

axis(2) = subplot(3,1,2);
hold on;
grid on;
plot(time, kloub_rychlost.signals.values(:,1), 'r', time, kloub_rychlost.signals.values(:,2), 'g', time, kloub_rychlost.signals.values(:,3), 'b');
title('Rychlost');
legend('\theta_1', '\theta_2', '\theta_3');
ylabel('[m/s]');
hold off;

axis(3) = subplot(3,1,3);
hold on;
plot(time, kloub_zrychleni.signals.values(:,1), 'r', time, kloub_zrychleni.signals.values(:,2), 'g', time, kloub_zrychleni.signals.values(:,3), 'b');
title('Zrychleni');
legend('\theta_1', '\theta_2', '\theta_3');
ylabel('[m/s^2]');
xlabel('cas [s]');
grid on;
hold off;
set(gcf,'color','w');
linkaxes(axis, 'x');




