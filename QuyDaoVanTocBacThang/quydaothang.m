function f = quydaothang(A, B, S, Vmax, T0, Te,t)
x0 = A(1) ; y0 = A(2) ; z0 = A(3);
xe = B(1) ; ye = B(2) ; ze = B(3);

T = t-T0
Ta = 2*S/Vmax;

a2 = Vmax/Ta;
a0 = z0;
a1 = 0;

b1 = Vmax;
b0 = ((Vmax*Ta)/2)+z0;


c2 = -Vmax/Ta;
c1 = (Vmax*(Te-T0)/Ta);
c0 = ze + (Vmax*((Te-T0)^2)/(2*Ta));
%pt z(t) Vz(t) az(t)
z1 = 0;
Vz1=0;
az1=0;
if (0<=T)&&(T<Ta)
    z1 = a0 - a1*T - (a2*(T^2))/2;
    Vz1 = a2*T+a1;
    az1 = a2;
elseif (Ta<=T)&&(T<(Te-T0-Ta))
    z1 = b0-b1*T;
    Vz1 = b1;
    az1= 0;
elseif ((Te-T0-Ta)<=T)&&(T<=(Te-T0))
    z1 = -(c2*(T^2)/2) -c1*T+c0;
    Vz1= c2*T+c1;
    az1= c2;
end


z = z1;
Vz=Vz1;
az=az1;
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