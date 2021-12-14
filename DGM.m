function [x,y,phi] = DGM(theta1, theta2, theta3,a1,a2,a3)
   x = a3*cos(theta1+theta2+theta3) + a2*cos(theta1+theta2) + a1*cos(theta1);
   y = a3*sin(theta1+theta2+theta3) + a2*sin(theta1+theta2) + a1*sin(theta1);
   phi = atan2(sin(theta1+theta2+theta3),cos(theta1+theta2+theta3));
end


% function matice_T = DGM_funkce(u)
% Q1 = u(1);
% Q2 = u(4);
% Q3 = u(7);
% a1 = u(10);
% a2 = u(11);
% a3 = u(12);
% matice_T = zeros(4);
% 
% x = a3 * cos(Q1 + Q2 + Q3) + a2 * cos(Q1 + Q2) + a1 * cos(Q1);
% y = a3 * sin(Q1 + Q2 + Q3) + a2 * sin(Q1 + Q2) + a1 * sin(Q1);
% vysledny_uhel = Q1 + Q2 + Q3; 
% 
% matice_T = [ cos(vysledny_uhel),-sin(vysledny_uhel),0,x;
%             sin(vysledny_uhel),cos(vysledny_uhel),0,y;
%             0,0,1,0;
%             0,0,0,1 ];
% end