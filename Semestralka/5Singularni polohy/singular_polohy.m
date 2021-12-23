close all
clear all

a1 = 2
a2 = 1.5
a3 = 0.5
%% Singularni polohy pro vybrane phi
figure

phi = 0;

x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

subplot(2,2,1)
hold on
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)
title('Singularni polohy pro $\varphi = 0$','interpreter','latex')
xlabel('$x$','interpreter','latex')
xlabel('$y$','interpreter','latex')
grid on
set(gcf,'color','w');
%%
phi = pi/2;

x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);

subplot(2,2,2)
hold on
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)
title('Singularni polohy pro $\varphi = \frac{\pi}{2}$','interpreter','latex')
xlabel('$x$','interpreter','latex')
xlabel('$y$','interpreter','latex')
grid on
set(gcf,'color','w');

%%
phi = pi;

x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);


subplot(2,2,3)
hold on
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)
title('Singularni polohy pro $\varphi = \pi$','interpreter','latex')
xlabel('$x$','interpreter','latex')
xlabel('$y$','interpreter','latex')
grid on
set(gcf,'color','w');
%%
phi =  3*pi/2;

x0 = a3*cos(phi);
y0 = a3*sin(phi);
r1 = (a1+a2);
r2 = (a1-a2);


subplot(2,2,4)
hold on
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r1.^2)
set(f,'Color',[0, 0.4470, 0.7410], 'LineWidth', 1)
f=ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r2.^2)
set(f,'Color',[0.600, 0.3250, 0.0980], 'LineWidth', 1)

title('Singularni polohy pro $\varphi = \frac{3\pi}{2}$','interpreter','latex')
xlabel('$x$','interpreter','latex')
xlabel('$y$','interpreter','latex')
grid on 
set(gcf,'color','w');

%% Singular polohy rezy jiny pohled
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

%% Singularni polohy ve 3D
tmax = 100;
inneramp = a1-a2;
outeramp = a3+a1;
t = linspace(0,2*pi,tmax);
for i = 1:tmax
    
    x0(i) = inneramp*sin(t(i));
    y0(i) = inneramp*cos(t(i));
    
    jmax = 100;
    th = linspace(0,2*pi,jmax);
    for j = 1:jmax
        xouter(i,j) = outeramp * cos(th(j)) + x0(i);
        youter(i,j) = outeramp * sin(th(j)) + y0(i);
        xinner(i,j) = inneramp * cos(th(j)) + x0(i);
        yinner(i,j) = inneramp * sin(th(j)) + y0(i);
        fi0(i,j) = t(i);
    end
        xouter(i,jmax+1) = NaN;
        youter(i,jmax+1) =  NaN;
        xinner(i,jmax+1) = NaN;
        yinner(i,jmax+1) = NaN;
        fi0(i,jmax+1) =  NaN;
end
xouter(tmax+1,:) = NaN(1,101);
youter(tmax+1,:) =  NaN(1,101);
xinner(tmax+1,:) = NaN(1,101);
yinner(tmax+1,:) =  NaN(1,101);
fi0(tmax+1,:) =  NaN(1,101);

figure
hold on
plot3(reshape(xouter,length(xouter)*length(xouter),1), reshape(youter,length(youter)*length(youter),1), reshape(fi0,length(youter)*length(youter),1),'LineWidth',2,'Color',[0.8500, 0.3250, 0.0980 0.2])

plot3(reshape(xinner,length(xinner)*length(xinner),1), reshape(yinner,length(yinner)*length(yinner),1), reshape(fi0,length(youter)*length(youter),1),'LineWidth',2,'Color',[0, 0.4470, 0.7410, 0.2])
view([45,30])
axis on
title('Singularni polohy parametrizovane $\varphi$','interpreter','latex')
set(gcf,'color','w');
xlabel('Zobecnena souradnice $x$','interpreter','latex')
ylabel('Zobecnena souradnice $y$','interpreter','latex')
zlabel('Zobecnena souradnice $\varphi$','interpreter','latex')
box on
grid on
legend({'$\Theta_2 = 0$', '$\Theta_2=\pi$'},'interpreter','latex')
set(gcf,'color','w');