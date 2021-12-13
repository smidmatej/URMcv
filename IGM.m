function [theta1, theta2, theta3] = IGM( x, y, phi, a1, a2, a3)
    cosQ2 = ((x - a3 * cos(phi))^2 + (y - a3 * sin(phi))^2 - a2^2 - a1^2)/(2*a1*a2);
    sinQ2 = - abs( sqrt(1 - cosQ2)); % 2 reseni, vybereme -
    
    theta2 = atan2(sinQ2, cosQ2); % Q2
    A = [-a2 * sinQ2, a2*cosQ2 + a1;
         a2 * cosQ2 + a1, -a2*sinQ2];
    b = [x - a3 * cos(uhel); y - a3 * sin(phi)];
    
    X = A\b;
    sin(theta1) = X(1);
    cos(theta1) = X(2);
    
    theta1 = atan2(sin(theta1), cos(theta1)); % Q1
    
    theta3 = phi - theta2 - theta1; % Q3
end