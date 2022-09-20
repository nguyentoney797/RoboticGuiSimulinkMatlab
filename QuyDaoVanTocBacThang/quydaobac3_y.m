function [f]= quydaobac3_y(A, B, T0, Te,t)
x0 = A(1) ; y0 = A(2) ; z0 = A(3);
xe = B(1) ; ye = B(2) ; ze = B(3);
a0 = y0;
a1 = 0;
a2 = 3*(ye-y0)/((Te-T0)^2);
a3 = -2*(ye-y0)/((Te-T0)^3);
%pt y(t) Vy(t) ay(t)
y = a0 +a1*(t-T0) +a2*(t-T0)^2 +a3*(t-T0)^3;
Vy = a1 +2*a2*(t-T0)^2 +a3*(t-T0)^2;
ay = 2*a2 +6*a3*(t-T0);
%pt x(t) Vx(t) ax(t)
x = ((xe-x0)/(ye-y0))*y +(ye*x0-y0*xe)/(ye-y0);
Vx = Vy*(xe-x0)/(ye-y0);
ax = ay*(xe-x0)/(ye-y0);
%pt z(t) Vz(t) az(t)
z = ((ze-z0)/(ye-y0))*y +(ye*z0-y0*ze)/(ye-y0);
Vz = Vy*(ze-z0)/(ye-y0);
az = ay*(ze-z0)/(ye-y0);
%ham ra
 E=[x y z];
 vE=[Vx Vy Vz];
 aE=[ax ay az];
f=[E ,vE, aE];


