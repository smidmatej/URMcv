clear all
close all
clc

a1 = 2;
a2 = 1.5;
a3 = 0.5;

% syms theta1 theta2 theta3

% random zvolene uhly kloubu
theta1 = pi/3;
theta2 = -pi/2;
theta3 = -pi/2;

% homog trans matice ze soustavy 0 do sous. 1
T01 = [cos(theta1), -sin(theta1),0,a1*cos(theta1);
       sin(theta1), cos(theta1),0,a1*sin(theta1);
       0,0,1,0;
       0,0,0,1];
       
T12 = [cos(theta2), -sin(theta2),0,a2*cos(theta2);
       sin(theta2), cos(theta2),0,a2*sin(theta2);
       0,0,1,0;
       0,0,0,1];
       
T23 = [cos(theta3), -sin(theta3),0,a3*cos(theta3);
       sin(theta3), cos(theta3),0,a3*sin(theta3);
       0,0,1,0;
       0,0,0,1];
       
T03 = T01*T12*T23;

% obecne homog trans matice ze soustavy i-1 do sous. i
syms a_i d_i alpha_i theta_i
TiMIN1i = [cos(theta_i), -sin(theta_i)*cos(alpha_i), sin(theta_i)*sin(alpha_i), a_i*cos(theta_i);
           sin(theta_i),  cos(theta_i)*cos(alpha_i),-cos(theta_i)*sin(alpha_i), a_i*sin(theta_i);
           0,             sin(alpha_i),              cos(alpha_i),              d_i;
           0,             0,                         0,                         1]



