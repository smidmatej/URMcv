function [theta1, theta2, theta3,theta1_dot,theta2_dot,theta3_dot,theta1_dot_dot,theta2_dot_dot,theta3_dot_dot] = IOKU( x, y, phi, dx, dy, dphi, ddx, ddy, ddphi, a1, a2, a3)

% theta2
cosQ2 = ((x - a3*cos(phi))^2 + (y - a3*sin(phi))^2 - a1^2 - a2^2)/(2 * a1 * a2);
sinQ2 = -abs((sqrt((1 - cosQ2^2))));
theta2 = atan2(sinQ2, cosQ2);

% theta1
A = [-a2 * sinQ2, a2 * cosQ2 + a1; a2 * cosQ2 + a1, a2 * sinQ2];
B = [x - a3*cos(phi); y - a3*sin(phi)];
X = A\B;
theta1 = atan2(X(1), X(2));

% theta3
theta3 = phi - theta1 - theta2;

% uhlova rychlost
JQ = [-a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2) - a1 * sin(theta1), -a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2), -a3 * sin(theta1 + theta2 + theta3);...
       a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2) + a1 * cos(theta1), a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2), a3 * cos(theta1 + theta2 + theta3);...
       1, 1, 1];
dX = [dx; dy; dphi];
dQ = JQ^(-1) * dX;
theta1_dot = dQ(1);
theta2_dot = dQ(2);
theta3_dot = dQ(3);

% uhlove zrychleni
dJQ = [-a3*cos(theta1+theta2+theta3)*(theta1_dot+theta2_dot+theta3_dot) - a2*cos(theta1+theta2)*(theta1_dot+theta2_dot) - a1*cos(theta1)*theta1_dot, -a3*cos(theta1+theta2+theta3)*(theta1_dot+theta2_dot+theta3_dot) - a2*cos(theta1+theta2)*(theta1_dot+theta2_dot), -a3*cos(theta1+theta2+theta3)*(theta1_dot+theta2_dot+theta3_dot);...
    -a3*sin(theta1+theta2+theta3)*(theta1_dot+theta2_dot+theta3_dot) - a2*sin(theta1+theta2)*(theta1_dot+theta2_dot) - a1*sin(theta1)*theta1_dot, -a3*sin(theta1+theta2+theta3)*(theta1_dot+theta2_dot+theta3_dot) - a2*sin(theta1+theta2)*(theta1_dot+theta2_dot), -a3*sin(theta1+theta2+theta3)*(theta1_dot+theta2_dot+theta3_dot);...
    0, 0, 0];
ddX = [ddx; ddy; ddfi];
ddQ = JQ^(-1) * (ddX - dJQ * dQ);
theta1_dot_dot = ddQ(1);
theta2_dot_dot = ddQ(2);
theta3_dot_dot = ddQ(3);


end
