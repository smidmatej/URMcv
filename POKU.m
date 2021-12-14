function [position,speed,acceleration] = POKU(theta1, theta2, theta3,theta1_dot,theta2_dot,theta3_dot,theta1_dot_dot,theta2_dot_dot,theta3_dot_dot,a1,a2,a3)
    % poloha
    position(1) = a3*cos(theta1+theta2+theta3) + a2*cos(theta1+theta2) + a1*cos(theta1);
    position(2) = a3*sin(theta1+theta2+theta3) + a2*sin(theta1+theta2) + a1*sin(theta1);
    position(3) = atan2(sin(theta1+theta2+theta3),cos(theta1+theta2+theta3));
   
    % rychlost
    JQ = [-a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2) - a1 * sin(theta1), -a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2), -a3 * sin(theta1 + theta2 + theta3);
           a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2) + a1 * cos(theta1), a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2), a3 * cos(theta1 + theta2 + theta3);
          1,1,1];
    theta_dot = [theta1_dot, theta2_dot, theta3_dot]';
    theta_dot_123 = theta1_dot + theta2_dot + theta3_dot;
    theta_dot_12 = theta1_dot + theta2_dot;
    speed = JQ * theta_dot;
    
    % zrychleni
    dJQ = [-a3 * cos(theta1 + theta1 + theta1) * theta_dot_123 - a2 * cos(theta1 + theta2) * theta_dot_12 - a1 * cos(theta1)*theta1_dot, - a3*cos(theta1 + theta2 + theta3) * theta_dot_123 - a2*cos(theta1 + theta2) * theta_dot_12, -a3 * cos(theta1 + theta2 + theta3) * theta_dot_123;
       -a3 * sin(theta1 + theta2 + theta3) * theta_dot_123 - a2 * sin(theta1 + theta2) * theta_dot_12 - a1 * sin(theta1)*theta1_dot, - a3*sin(theta1 + theta2 + theta3) * theta_dot_123 - a2*sin(theta1 + theta2) * theta_dot_12, -a3 * sin(theta1 + theta2 + theta3) * theta_dot_123;
       0,0,0];
    theta_dot_dot = [theta1_dot_dot, theta2_dot_dot, theta3_dot_dot]';

    acceleration = dJQ * theta_dot + JQ * theta_dot_dot;
end