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
% [x,y,phi] = DGM(1,1,1,a1,a2,a3)


