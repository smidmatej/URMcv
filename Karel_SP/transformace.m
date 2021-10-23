function vysledek = transformace(R, x, y)
% uhel natoceni v radianech x
% uhel natoceni v radianech y

    T01 = [cos(y) -sin(y) 0 0;
           sin(y) cos(y) 0 0;
           0    0   1   0;
           0    0   0   1];
  
    T12 = [cos(-x) 0 sin(-x) 0;
           0    1   0   0;
           -sin(-x) 0 cos(-x) 0;
           0    0   0   1];
   
    T23 = [eye(3) [R 0 0]';
           0 0 0 1];
   
    vysledek = T01*T12*T23;
end
