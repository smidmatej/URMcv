close all
clear all

a1 = 2
a2 = 1.5
a3 = 0.5

figure
hold on
grid minor

phi = 0;
x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)

scatter(x0,y0,'+','MarkerEdgeColor',[0.9290, 0.6940, 0.1250])

phi = pi/2;
x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

phi = pi/2;
x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)

scatter(x0,y0,'+','MarkerEdgeColor',[0.9290, 0.6940, 0.1250])

phi = pi;
x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)

scatter(x0,y0,'+','MarkerEdgeColor',[0.9290, 0.6940, 0.1250])

phi =  3*pi/2;
x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)

scatter(x0,y0,'+','MarkerEdgeColor',[0.9290, 0.6940, 0.1250])

set(gcf,'color','w');
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
title('Singularni polohy pro $\varphi = 0$, $\varphi = \frac{pi}{2}$, $\varphi = \pi$, $\varphi = \frac{3\pi}{2}$','interpreter','latex')

% legend('$\varphi = 0$','','', '$\varphi = \frac{pi}{2}$','','',...
%        '$\varphi = \pi$','','', '$\varphi = \frac{3\pi}{2}$','','','interpreter','latex')
   


