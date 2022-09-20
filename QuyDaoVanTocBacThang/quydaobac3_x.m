function [f]= quydaobac3_x(A, B, T0, Te,t)
x0 = A(1) ; y0 = A(2) ; z0 = A(3);
xe = B(1) ; ye = B(2) ; ze = B(3);
a0 = x0;
a1 = 0;
a2 = 3*(xe-x0)/((Te-T0)^2);
a3 = -2*(xe-x0)/((Te-T0)^3);
%pt x(t) Vx(t) ax(t)
x = a0 +a1*(t-T0) +a2*(t-T0)^2 +a3*(t-T0)^3;
Vx = a1 +2*a2*(t-T0)^2 +a3*(t-T0)^2;
ax = 2*a2 +6*a3*(t-T0);
%pt y(t) Vy(t) ay(t)
y = ((ye-y0)/(xe-x0))*x +(xe*y0-x0*ye)/(xe-x0);
Vy = Vx*(ye-y0)/(xe-x0);
ay = ax*(ye-y0)/(xe-x0);
%pt z(t) Vz(t) az(t)
z = ((ze-z0)/(xe-x0))*x +(xe*z0-x0*ze)/(xe-x0);
Vz = Vx*(ze-z0)/(xe-x0);
az = ax*(ze-z0)/(xe-x0);
%ham ra
E=[x y z];
vE=[Vx Vy Vz];
aE=[ax ay az];
f=[E ,vE ,aE];
