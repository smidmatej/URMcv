function [x,y,phi] = DGM(theta1, theta2, theta3,a1,a2,a3)
   x = a3*cos(theta1+theta2+theta3) + a2*cos(theta1+theta2) + a1*cos(theta1);
   y = a3*sin(theta1+theta2+theta3) + a2*sin(theta1+theta2) + a1*sin(theta1);
   phi = atan2(sin(theta1+theta2+theta3),cos(theta1+theta2+theta3));
end
