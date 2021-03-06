%% setup
clear all
a1 = 2
a2 = 1.5
a3 = 0.5

r = a1-a2-a3 % nejvetsi - suma mensich je asi vnitrni polomer
R = a1+a2+a3 % kam az dosahne

v = 0.5
v2 = 2
smax = 3.9769
Tmax = smax/v

theta10 = 0
theta20 = 0
theta30 = 0
T_1_0 = [cos(theta10), -sin(theta10), 0, a1*cos(theta10);
    sin(theta10), cos(theta10), 0, a1*sin(theta10);
    0 0 1 0;
    0 0 0 1]
T_2_1 = [cos(theta20), -sin(theta20), 0, a2*cos(theta20);
    sin(theta20), cos(theta20), 0, a2*sin(theta20);
    0 0 1 0;
    0 0 0 1]
T_3_2 = [cos(theta30), -sin(theta30), 0, a3*cos(theta30);
    sin(theta30), cos(theta30), 0, a3*sin(theta30);
    0 0 1 0;
    0 0 0 1]

%%
clear dQ

imax = 10
fiss = linspace(-0.5,pi/2,imax)
for i = 1:imax
    
    fi_sample = fiss(i);
    
    simulation = sim('linearni_quad_trajektorie');
    set_param('linearni_quad_trajektorie','SimMechanicsOpenEditorOnUpdate','off')
    dQ(i,:) = simulation.dQ_const.signals.values;
end



%%
% r = logspace(-0.7,-0.3,256)'*1
% b = flip(logspace(-1,0,256)')*0.4
% g = linspace(0.4,0.1,256)'
% cmap = [r g b]

figure
hold on
s = surf(simulation.s_lin.signals.values,fiss,dQ)
mycolors = flip([1 0 0; 1 1 0; 0 0 1]');
s.FaceColor = 'interp'
% colormap(jet);
s.FaceAlpha = 0.99
set(gcf,'color','w');
box on
grid on
s.FaceLighting  = 'flat'
shading interp
ax = gca;
% ax.YTick = (-0.5:pi/4:pi/2);
% ax.YTickLabel = {'-2\pi','-3\pi/2','-\pi','-\pi/2','0',...
%     '\pi/2','\pi','3\pi/2','2\pi'};

title('Chovani $\vert \vert \dot{Q} \vert \vert$','interpreter','latex')
set(gcf,'color','w');
xlabel('$s(t)$','interpreter','latex')
ylabel('$\varphi$','interpreter','latex')
zlabel('$\vert \vert \dot{Q} \vert \vert$','interpreter','latex')
ylim([min(fiss),max(fiss)])
xlim([0,smax])
view(([0,90]))
% view(([-30,20]))

plot3(simulation.s_lin.signals.values, simulation.phi_quad.signals.values, simulation.dQ_quad.signals.values,'-g','LineWidth',3)
plot3(simulation.s_lin.signals.values, simulation.phi_lin.signals.values, simulation.dQ_lin.signals.values,'-r','LineWidth',3)
% linphi = simulation.phi_lin.signals.values
% linQ = simulation.dQ_lin.signals.values


% clear normy
% % mesh_phi = -0.5:pi/82:pi/2; %da 55 prvku
% % mesh_smax = 0:(smax/54):smax;
% mesh_smax = linspace(0,smax,10)
% mesh_phi = linspace(-0.5,pi/2,10)
% normy = zeros(length(mesh_phi),length(mesh_smax));
% for i=1:length(mesh_phi)
%     uhel_phi = mesh_phi(i);
%     set_param('dontopenpls','SimMechanicsOpenEditorOnUpdate','off')
%     sim('dontopenpls.slx');
%     set_param('dontopenpls','SimMechanicsOpenEditorOnUpdate','off')
%     
%     for k=1:length(mesh_smax)
%         normy(i,k) = norm([out.dQ1.signals.values(k) out.dQ2.signals.values(k) out.dQ3.signals.values(k)]);
%     end
% end
% [mesh_x,mesh_y] = meshgrid(mesh_smax, mesh_phi);
% %%
% 
% figure
% % surf(mesh_phi,mesh_smax,normy)
% surf(mesh_x,mesh_y,normy)
% 

