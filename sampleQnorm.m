

imax = 20
fiss = linspace(-0.5,pi/2,imax)
for i = 1:imax
    
    fi_sample = fiss(i);
    output = sim('dontopenpls');
    dQ(i,:) = output.normdQ.signals.values;
end

%%



%%
% r = logspace(-0.7,-0.3,256)'*1
% b = flip(logspace(-1,0,256)')*0.4
% g = linspace(0.4,0.1,256)'
% cmap = [r g b]

figure
hold on
s = surf(out.normdQ.time,fiss,dQ)
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
% view(([0,90]))

%%

plot3(out.normdQ.time,out.phi_sample.signals.values, out.normdQ.signals.values)


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

