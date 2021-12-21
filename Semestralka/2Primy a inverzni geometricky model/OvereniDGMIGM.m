clear all

a1 = 2
a2 = 1.5
a3 = 0.5



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


simulation = sim('OvereniDGMIGM');
%%
figure
subplot(2,1,1)
hold on
plot(simulation.tout, simulation.q_man1.Data(:),'--','LineWidth',2)
plot(simulation.tout, simulation.q_man2.Data(:),'--','LineWidth',2)
plot(simulation.tout, simulation.q_man3.Data(:),'--','LineWidth',2)
plot(simulation.tout, simulation.q_dgm1.Data(:))
plot(simulation.tout, simulation.q_dgm2.Data(:))
plot(simulation.tout, simulation.q_dgm3.Data(:))
legend({'q_1 Manipulator','q_2 Manipulator','q_3 Manipulator','q_1 DGM','q_2 DGM','q_3 DGM'},'interpreter','latex')
xlabel('Time t [s]','interpreter','latex')
ylabel('q [rad]','interpreter','latex')
title('Harmonicky referencni signal','interpreter','latex')

subplot(2,1,2)
hold on
plot(simulation.tout, simulation.x_man1.Data(:),'--','LineWidth',2)
plot(simulation.tout, simulation.x_man2.Data(:),'--','LineWidth',2)
plot(simulation.tout, simulation.x_man3.Data(:),'--','LineWidth',2)
plot(simulation.tout, simulation.x_dgm1.Data(:))
plot(simulation.tout, simulation.x_dgm2.Data(:))
plot(simulation.tout, simulation.x_dgm3.Data(:))


legend({'x Manipulator','y Manipulator','$\varphi$ Manipulator','x DGM','y DGM','$\varphi$  DGM'},'interpreter','latex')
xlabel('Time t [s]','interpreter','latex')
ylabel('$X$','interpreter','latex')
title('Harmonicky referencni signal','interpreter','latex')