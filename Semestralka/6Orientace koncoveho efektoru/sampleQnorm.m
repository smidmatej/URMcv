clear all
close all
clc

%% Parametry
a1 = 2;
a2 = 1.5;
a3 = 0.5;

r = a1-a2-a3; % nejvetsi - suma mensich je asi vnitrni polomer
R = a1+a2+a3; % kam az dosahne

v = 0.5;
v2 = 2;
smax = 3.9769;
Tmax = smax/v;

theta10 = 0;
theta20 = 0;
theta30 = 0;
T_1_0 = [cos(theta10), -sin(theta10), 0, a1*cos(theta10);
    sin(theta10), cos(theta10), 0, a1*sin(theta10);
    0 0 1 0;
    0 0 0 1];
T_2_1 = [cos(theta20), -sin(theta20), 0, a2*cos(theta20);
    sin(theta20), cos(theta20), 0, a2*sin(theta20);
    0 0 1 0;
    0 0 0 1];
T_3_2 = [cos(theta30), -sin(theta30), 0, a3*cos(theta30);
    sin(theta30), cos(theta30), 0, a3*sin(theta30);
    0 0 1 0;
    0 0 0 1];

%% Chovani normy dQ

imax = 10;
fiss = linspace(-0.5,pi/2,imax);
for i = 1:imax
    fi_sample = fiss(i);
    set_param('trajektorie_sim','SimMechanicsOpenEditorOnUpdate','off');
    simulation = sim('trajektorie_sim');
    dQ(i,:) = simulation.dQ_const.signals.values;
end
%%
figure
hold on
s = surf(simulation.s_lin.signals.values,fiss,dQ);
mycolors = flip([1 0 0; 1 1 0; 0 0 1]');
s.FaceColor = 'interp'
s.FaceAlpha = 0.99;
set(gcf,'color','w');
box on
grid on
s.FaceLighting  = 'flat'
shading interp
ax = gca;
title('Chovani $\vert \vert \dot{Q} \vert \vert$','interpreter','latex')
set(gcf,'color','w');
xlabel('$s(t)$','interpreter','latex')
ylabel('$\varphi$','interpreter','latex')
zlabel('$\vert \vert \dot{Q} \vert \vert$','interpreter','latex')
ylim([min(fiss),max(fiss)])
xlim([0,smax])
view(([0,90]))

plot3(simulation.s_lin.signals.values, simulation.phi_quad.signals.values, simulation.dQ_quad.signals.values,'-g','LineWidth',3)
plot3(simulation.s_lin.signals.values, simulation.phi_lin.signals.values, simulation.dQ_lin.signals.values,'-r','LineWidth',3)

