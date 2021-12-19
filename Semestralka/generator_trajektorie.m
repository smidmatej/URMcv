A = [2 0.5]'
B = [0 1]'
C = [2,2.5]'

r = 0.3
vmax = 1

nba = (A - B)/norm(A-B)
nbc = (C-B)/norm(C-B)
nbs = (nba+nbc)/norm(nba+nbc)
K1 = (nba*nba'*nbs-nbs)
l = r/(sqrt(K1'*K1))
S = B+nbs*l
k = nba'*(A-S)
Pa = A-nba*k
Pc = B + norm(Pa-B)*nbc
k1 = linspace(0,norm(A-Pa),100)
x_pab = A-k1.*nba
Pb = B

helper = (Pa-S)
fi_pa = atan2(helper(2),helper(1))
dir = -1

deltafi = acos(((Pc-S)'*(Pa-S))/r^2)
fi = linspace(0,deltafi,100)
x_rot = [r*cos(fi_pa+dir*fi);
         r*sin(fi_pa+dir*fi)]+S

k2 = linspace(0,norm(Pc-C),100)
x_pbc = Pc + k2.*nbc


s1 = norm(Pa-A)
s2 = norm(Pc-C)
sk = r*deltafi
smax = s1+s2+sk
Tmax = smax/vmax

T = 100
t = linspace(0,Tmax,T)
t1 = linspace(0,s1/vmax,T)
tk = linspace(s1/vmax,sk/vmax,T)
t2 = linspace(sk/vmax,s2/vmax,T)
% s = linspace(0,smax,smax/Tmax*10)
s = vmax*t


k1 = 0+vmax*t

k1 = linspace(0,s1,s1/Tmax*T)
fi = linspace(0,(sk)/r,(sk)/Tmax*T)
k2 = linspace(0,s2,s2/Tmax*T)

X1 = A-k1.*nba
Xk = [r*cos(fi_pa+dir*fi);r*sin(fi_pa+dir*fi)]+S
X2 = Pc+k2.*nbc

figure
subplot(2,1,1)
hold on
scatter(X1(1,:),X1(2,:))
scatter(Xk(1,:),Xk(2,:))
scatter(X2(1,:),X2(2,:))
scatter(A(1),A(2),'+')
scatter(B(1),B(2),'+')
scatter(C(1),C(2),'+')
scatter(S(1),S(2),'+')
subplot(2,1,2)
plot(t,s)
%%
figure
hold on
scatter(x_rot(1,:),x_rot(2,:))
scatter(x_pab(1,:),x_pab(2,:))
scatter(x_pbc(1,:),x_pbc(2,:))
scatter(A(1),A(2),'+')
scatter(B(1),B(2),'+')
scatter(C(1),C(2),'+')
scatter(S(1),S(2),'+')
% scatter(x_pbc(1,:),x_pbc(2,:))