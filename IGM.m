function [Q1, Q2, Q3] = IGM( x, y, phi, a1, a2, a3)
    cosQ2 = ((x - a3 *cos(phi))^2 + (y - a3 * sin(phi))^2 - a2^2 - a1^2)/(2*a1*a2);
    sinQ2 =  -abs(sqrt(abs(1 - cosQ2^2))); % 2 reseni, vybereme -
    
    Q2 = atan2(sinQ2, cosQ2); % Q2
%     A = [-a2 * sin(theta2), a2*cos(theta2) + a1;
%          a2 * cos(theta2)  + a1, a2*sin(theta2)];
     A = [-a2 * sinQ2, a2*cosQ2 + a1;
         a2 * cosQ2  + a1, a2*sinQ2];
    b = [x - a3 * cos(phi); y - a3 * sin(phi)];
    
    X = A\b;
%     sin(theta1) = X(1);
%     cos(theta1) = X(2);
    
    Q1 = atan2(X(1),X(2)); % Q1
    
    Q3 = mod(phi - Q2 - Q1,2*pi); % Q3
end