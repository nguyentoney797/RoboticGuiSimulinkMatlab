function [xt,yt,zt,ketqua]=QuyDaoCungTron(num)

% xt yt zt la ma tran 1*6 
% cot 1->4 la he so hs0,hs1,hs2,hs3 cot 5 là xi ,cot 6 la bankinhr
%goc dich chuyen<=180 do
x0=num(1,3);
y0=num(1,4);
z0=num(1,5);
QuayTheoTruc=num(2,11);
TheoChieu=num(2,12);
x1=num(1+1,3);
y1=num(1+1,4);
z1=num(1+1,5);
xi=num(1+1,7);
yi=num(1+1,8);
zi=num(1+1,9);
t0=num(1,6);
t1=num(1+1,6);
v0=num(1,13);
v1=num(2,13);
if QuayTheoTruc==1 %quay truc x
    bankinhr=sqrt((z0-zi)*(z0-zi)+(y0-yi)*(y0-yi));
    s0=asin((y0-yi)/bankinhr);
    s1=asin((y1-yi)/bankinhr);
end
if QuayTheoTruc==2 %quay theo truc y
    bankinhr=sqrt((x0-xi)*(x0-xi)+(z0-zi)*(z0-zi));
    s0=asin((x0-xi)/bankinhr);
    s1=asin((x1-xi)/bankinhr);
end
if QuayTheoTruc==3 %quay theo truc z
    bankinhr=sqrt((x0-xi)*(x0-xi)+(y0-yi)*(y0-yi));
    %if x0==x1
    %  s0=asin((y0-yi)/bankinhr);
    %   s1=asin((y1-yi)/bankinhr);
        
    %else
       s0=asin((x0-xi)/bankinhr);
       s1=asin((x1-xi)/bankinhr);
    %end
end
[hs0,hs1,hs2,hs3,ketqua]=GiaiHe4Pt(t0,t1,v0,v1,s0,s1);
if ketqua==2 || ketqua==1
    xt=[0,0,0,0,0,0];
    yt=[0,0,0,0,0,0];
    zt=[0,0,0,0,0,0];
else
if QuayTheoTruc==1 %quay theo truc x
    if TheoChieu==1 %quay theo chieu nguoc chieu truc quy tac ban tay phai
        xt=[x0,0,0,0,xi,0];
        yt=[hs0,hs1,hs2,hs3,yi,bankinhr]; %sin
        zt=[hs0,hs1,hs2,hs3,zi,bankinhr]; % cos
    end
    if TheoChieu==2 %quay theo chieu duong truc
        xt=[x0,0,0,0,xi,0];
        yt=[-hs0,-hs1,-hs2,-hs3,yi,-bankinhr]; %sin
        zt=[-hs0,-hs1,-hs2,-hs3,zi,-bankinhr]; % cos
    end
end

if QuayTheoTruc==2 %quay theo truc y
    if TheoChieu==1 %quay theo chieu nguoc chieu truc quy tac ban tay phai
        yt=[y0,0,0,0,yi,0];
        xt=[hs0,hs1,hs2,hs3,xi,bankinhr]; %sin
        zt=[hs0,hs1,hs2,hs3,zi,bankinhr]; % cos
    end
    if TheoChieu==2 %quay theo chieu duong truc
        yt=[y0,0,0,0,yi,0];
        xt=[-hs0,-hs1,-hs2,-hs3,xi,-bankinhr]; %sin
        zt=[-hs0,-hs1,-hs2,-hs3,zi,-bankinhr]; % cos
    end
end

if QuayTheoTruc==3 %quay theo truc z
    if TheoChieu==1 %quay theo chieu nguoc chieu truc quy tac ban tay phai
        zt=[z0,0,0,0,zi,0];
        xt=[hs0,hs1,hs2,hs3,xi,bankinhr]; %sin
        yt=[hs0,hs1,hs2,hs3,yi,bankinhr]; % cos
    end
    if TheoChieu==2 %quay theo chieu duong truc
        zt=[z0,0,0,0,zi,0];
        xt=[-hs0,-hs1,-hs2,-hs3,xi,-bankinhr]; %sin
        yt=[-hs0,-hs1,-hs2,-hs3,yi,-bankinhr]; % cos
    end
end
end
end