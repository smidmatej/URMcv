clear all
a1 = 2
a2 = 1.5
a3 = 0.5

r = a1-a2-a3 % nejvetsi - suma mensich je asi vnitrni polomer
R = a1+a2+a3 % kam az dosahne

v = 0.5
v2 = 2
vmax = 1

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
% [x,y,phi] = DGM(1,1,1,a1,a2,a3)


simulation = sim('generator_trajektorie');
%%
figure
subplot(3,1,1)
hold on
plot(simulation.tout, simulation.q_man1.Data(:))
plot(simulation.tout, simulation.q_man2.Data(:))
plot(simulation.tout, simulation.q_man3.Data(:))

legend({'$q_1$  ','$q_2$  ','$q_3$  ','$q_1$ POKU','$q_2$ POKU','$q_3$ POKU'},'interpreter','latex')
xlabel('Time $t$ [s]','interpreter','latex')
ylabel('$Q$ [rad]','interpreter','latex')
title('Pohyb po generovane trajektorii','interpreter','latex')

subplot(3,1,2)
hold on
plot(simulation.tout, simulation.dq_man1.Data(:))
plot(simulation.tout, simulation.dq_man2.Data(:))
plot(simulation.tout, simulation.dq_man3.Data(:))

legend({'$\dot{q}_1$  ','$\dot{q}_2$  ','$\dot{q}_3$  ','$\dot{q}_1$ POKU','$\dot{q}_2$ POKU','$\dot{q}_3$ POKU'},'interpreter','latex')
xlabel('Time $t$ [s]','interpreter','latex')
ylabel('$\dot{Q}$ [rad$\cdot s^{-1}$]','interpreter','latex')
title('Pohyb po generovane trajektorii','interpreter','latex')

subplot(3,1,3)
hold on
plot(simulation.tout, simulation.ddq_man1.Data(:))
plot(simulation.tout, simulation.ddq_man2.Data(:))
plot(simulation.tout, simulation.ddq_man3.Data(:))

legend({'$\ddot{q}_1$  ','$\ddot{q}_2$  ','$\ddot{q}_3$  ','$\ddot{q}_1$ POKU','$\ddot{q}_2$ POKU','$\ddot{q}_3$ POKU'},'interpreter','latex')
xlabel('Time $t$ [s]','interpreter','latex')
ylabel('$\ddot{Q}$ [rad $\cdot s^{-2}$]','interpreter','latex')
title('Pohyb po generovane trajektorii','interpreter','latex')




figure
subplot(3,1,1)
hold on
plot(simulation.tout, simulation.x_man1.Data(:))
plot(simulation.tout, simulation.x_man2.Data(:))
plot(simulation.tout, simulation.x_man3.Data(:))

legend({'$x$  ','$y$  ','$\varphi$  ','$x$ POKU','$y$ POKU','$\varphi$  POKU'},'interpreter','latex')
xlabel('Time $t$ [s]','interpreter','latex')
ylabel('$X$','interpreter','latex')
title('Pohyb po generovane trajektorii','interpreter','latex')

subplot(3,1,2)
hold on
plot(simulation.tout, simulation.dx_man1.Data(:))
plot(simulation.tout, simulation.dx_man2.Data(:))
plot(simulation.tout, simulation.dx_man3.Data(:))

legend({'$\dot{x}$  ','$\dot{y}$  ','$\dot{\varphi}$  ','$\dot{x}$ POKU','$\dot{y}$ POKU','$\dot{\varphi}$  POKU'},'interpreter','latex')
xlabel('Time $t$ [s]','interpreter','latex')
ylabel('$\dot{X}$','interpreter','latex')
title('Pohyb po generovane trajektorii','interpreter','latex')

subplot(3,1,3)
hold on
plot(simulation.tout, simulation.ddx_man1.Data(:))
plot(simulation.tout, simulation.ddx_man2.Data(:))
plot(simulation.tout, simulation.ddx_man3.Data(:))

legend({'$\ddot{x}$  ','$\ddot{y}$  ','$\ddot{\varphi}$  ','$\ddot{x}$ POKU','$\ddot{y}$ POKU','$\ddot{\varphi}$  POKU'},'interpreter','latex')
xlabel('Time t [s]','interpreter','latex')
ylabel('$\ddot{X}$','interpreter','latex')
title('Pohyb po generovane trajektorii','interpreter','latex')

%%

figure
hold on
plot(simulation.tout, ones(1,length(simulation.tout))*simulation.v.Data(:),'--')
plot(simulation.tout, simulation.vmax.Data(:))

ylim([0 2])

legend({'$v_{ref}$  ','$v$'},'interpreter','latex')
xlabel('Time t [s]','interpreter','latex')
ylabel('Rychlost $v$','interpreter','latex')
title('Norma vektoru rychlosti zobecnenych souradnic','interpreter','latex')



% subplot(2,1,2)
% hold on
% plot(simulation.tout, simulation.x_man1.Data(:))
% plot(simulation.tout, simulation.x_man2.Data(:))
% plot(simulation.tout, simulation.x_man3.Data(:),'--','LineWidth',2)
% plot(simulation.tout, simulation.x_poku1.Data(:))
% plot(simulation.tout, simulation.x_poku2.Data(:))
% plot(simulation.tout, simulation.x_poku3.Data(:))


% legend({'x  ','y  ','$\varphi$  ','x POKU','y POKU','$\varphi$  POKU'},'interpreter','latex')
% xlabel('Time t [s]','interpreter','latex')
% ylabel('$X$','interpreter','latex')
% title('Pohyb po generovane trajektorii','interpreter','latex')