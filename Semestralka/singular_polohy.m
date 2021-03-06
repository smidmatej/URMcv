close all
clear all
a1 = 2
a2 = 1.5
a3 = 0.5



Q1 = linspace(-pi,pi,10);
Q3 = linspace(-pi,pi,20);

Q2 = 0;
for i = 1:length(Q1)
    for j = 1:length(Q3)
        [x(i,j), y(i,j), phi(i,j)] = DGM(Q1(i),Q2,Q3(j), a1, a2, a3);
%         deter(i,j) = det(double(subs(J,[theta1,theta2,theta3],[Q1,Q2,Q3])));
    end
end

figure
hold on
scatter(reshape(x,length(Q1)*length(Q3),1),reshape(y,length(Q1)*length(Q3),1))

plot([0 -a1],[0 0])
plot([-a1 -a2-a1],[0 0])
plot([-a1-a2 -a2-a1],[0 a3])
scatter(0,0,'.')
scatter(-a1,0,'.')
scatter(-a1-a2,0,'.')
scatter(-a1-a2,a3,'.')
xlim([-abs(a1+a2+a3+1) abs(a1+a2+a3+1)])
ylim([-abs(a1+a2+a3+1) abs(a1+a2+a3+1)])

axis square
axis on
title('Singularni polohy pro $Q_2 = 0$','interpreter','latex')
set(gcf,'color','w');
xlabel('Zobecnena souradnice $x$','interpreter','latex')
ylabel('Zobecnena souradnice $y$','interpreter','latex')
legend({'Vzorky','LINK1','LINK2','LINK3'},'interpreter','latex')


%%
clear all
a1 = 2
a2 = 1.5
a3 = 0.5
Q1 = linspace(-pi,pi,10);
Q3 = linspace(-pi,pi,100);

Q2 = pi;
for i = 1:length(Q1)
    for j = 1:length(Q3)
        [x(i,j), y(i,j), phi(i,j)] = DGM(Q1(i),Q2,Q3(j), a1, a2, a3);
%         deter(i,j) = det(double(subs(J,[theta1,theta2,theta3],[Q1,Q2,Q3])));
    end
end

figure
hold on
scatter(reshape(x,length(Q1)*length(Q3),1),reshape(y,length(Q1)*length(Q3),1))

plot([0 -a1],[0 0])
plot([-a1 +a2-a1],[0 0])
plot([-a1+a2 +a2-a1],[0 a3])
scatter(0,0,'.')
scatter(-a1,0,'.')
scatter(-a1+a2,0,'.')
scatter(-a1+a2,a3,'.')
xlim([-abs(a1-a2+a3+1) abs(a1-a2+a3+1)])
ylim([-abs(a1-a2+a3+1) abs(a1-a2+a3+1)])

axis square
axis on
title('Singularni polohy pro $Q_2 = \pi$','interpreter','latex')
set(gcf,'color','w');
xlabel('Zobecnena souradnice $x$','interpreter','latex')
ylabel('Zobecnena souradnice $y$','interpreter','latex')
legend({'Vzorky','LINK1','LINK2','LINK3'},'interpreter','latex')


%%
clear all
a1 = 2
a2 = 1.5
a3 = 0.5
Q1 = linspace(-pi,pi,10);
Q3 = linspace(-pi,pi,100);

Q2 = pi;
for i = 1:length(Q1)
    for j = 1:length(Q3)
        [x(i,j), y(i,j), phi(i,j)] = DGM(Q1(i),Q2,Q3(j), a1, a2, a3);
%         deter(i,j) = det(double(subs(J,[theta1,theta2,theta3],[Q1,Q2,Q3])));
    end
end

figure
hold on
scatter3(reshape(x,length(Q1)*length(Q3),1),reshape(y,length(Q1)*length(Q3),1),reshape(phi,length(Q1)*length(Q3),1))


axis square
axis on
title('Singularni polohy pro $Q_2 = \pi$','interpreter','latex')
set(gcf,'color','w');
xlabel('Zobecnena souradnice $x$','interpreter','latex')
ylabel('Zobecnena souradnice $y$','interpreter','latex')
zlabel('Zobecnena souradnice $\varphi$','interpreter','latex')
% % legend({'Vzorky'},'interpreter','latex')
%%
close all
tmax = 100
inneramp = a1-a2;
outeramp = a3;
t = linspace(0,2*pi,tmax)
for i = 1:tmax
    

    x0(i) = inneramp*sin(t(i));
    y0(i) = inneramp*cos(t(i));


    
    jmax = 100;
    th = linspace(0,2*pi,jmax);
    for j = 1:jmax
        xouter(i,j) = outeramp * cos(th(j)) + x0(i);
        youter(i,j) = outeramp * sin(th(j)) + y0(i);
        fi0(i,j) = t(i);
    end
    
end

figure
plot3(x0,y0,fi0(:,1))
scatter3(reshape(xouter,length(xouter)*length(xouter),1),reshape(youter,length(youter)*length(youter),1),reshape(fi0,length(youter)*length(youter),1))
%%

%%

%%
