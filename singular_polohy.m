clear all
a1 = 2
a2 = 1.5
a3 = 0.5

syms theta1 theta2 theta3
J = [-a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2) - a1 * sin(theta1), -a3 * sin(theta1 + theta2 + theta3) - a2 * sin(theta1 + theta2), -a3 * sin(theta1 + theta2 + theta3);
           a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2) + a1 * cos(theta1), a3 * cos(theta1 + theta2 + theta3) + a2 * cos(theta1 + theta2), a3 * cos(theta1 + theta2 + theta3);
          1,1,1];
      
determinant = det(J)

% goniometrickej vzorec
solve(3*sin(theta1+theta2-theta1) == 0)
% Singularni poloha pro theta2 = 0+pi*k

x = linspace(-3,3,100);
y = linspace(-3,3,100);

for i = 1:length(x)
    for j = 1:length(y)
        [Q1, Q2, Q3] = IGM( x(i), y(j), 0, a1, a2, a3);
        deter(i,j) = det(double(subs(J,[theta1,theta2,theta3],[Q1,Q2,Q3])));
    end
end


figure
surf(x,y,deter)

% Q2_space = linspace(-2*pi,2*pi,10)
% 
% for i = 1:length(Q2_space)
%     
%     Q1 = 0
%     Q3 = 0
%     Q2 = Q2_space(i)
%     deter(i) = det(double(subs(J,[theta1,theta2,theta3],[Q1,Q2,Q3])))
% end
% figure
% plot(Q2_space,deter)