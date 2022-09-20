function [f]= quydaobac3_z(A, B, T0, Te,t)
x0 = A(1) ; y0 = A(2) ; z0 = A(3);
xe = B(1) ; ye = B(2) ; ze = B(3);
a0 = z0;
a1 = 0;
a2 = 3*(ze-z0)/((Te-T0)^2);
a3 = -2*(ze-z0)/((Te-T0)^3);
%pt z(t) Vz(t) az(t)
z = a0 +a1*(t-T0) +a2*(t-T0)^2 +a3*(t-T0)^3;
Vz = a1 +2*a2*(t-T0)^2 +a3*(t-T0)^2;
az = 2*a2 +6*a3*(t-T0);
%pt y(t) Vy(t) ay(t)
y = ((ye-y0)/(ze-z0))*z +(ze*y0-z0*ye)/(ze-z0);
Vy = Vz*(ye-y0)/(ze-z0);
ay = az*(ye-y0)/(ze-z0);
%pt x(t) Vx(t) ax(t)
x = ((xe-x0)/(ze-z0))*z +(ze*x0-z0*xe)/(ze-z0);
Vx = Vz*(xe-x0)/(ze-z0);
ax = az*(xe-x0)/(ze-z0);
%ham ra
E=[x y z];
vE=[Vx Vy Vz];
aE=[ax ay az];
f=[E, vE, aE];
