function [ T_01, T_12, T_23, T_02, T_03 ] = DH_parametry( parametry )
T_01 = [ cos(parametry(1,2)),-sin(parametry(1,2)),0,parametry(1,3);
        sin(parametry(1,2)),cos(parametry(1,2)),0,0;
        0,0,1,0;
        0,0,0,1 ];
T_12 = [ cos(parametry(2,2)),-sin(parametry(2,2)),0,parametry(2,3);
        sin(parametry(2,2)),cos(parametry(2,2)),0,0;
        0,0,1,0;
        0,0,0,1 ];
T_23 = [ cos(parametry(3,2)),-sin(parametry(3,2)),0,parametry(3,3);
        sin(parametry(3,2)),cos(parametry(3,2)),0,0;
        0,0,1,0;
        0,0,0,1 ];
T_02 = T_01 * T_12;
T_03 = T_01 * T_12 * T_23;
end

