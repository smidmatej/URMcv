a1 = 2
a2 = 1.5
a3 = 0.5

syms theta1 theta2 theta3
JQ = [-a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2) - a1 * sin(theta1), -a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2), -a3 * sin(theta1 + theta2 + theta3);...
       a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2) + a1 * cos(theta1), a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2), a3 * cos(theta1 + theta2 + theta3);...
       1, 1, 1];
   
iJQ = inv(JQ)


iJQ(:,3)
