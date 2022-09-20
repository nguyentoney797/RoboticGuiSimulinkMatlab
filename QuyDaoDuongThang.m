function[xt,yt,zt,ketqua]=QuyDaoDuongThang(num)
 
% cac gia tri ban dau

x0=num(1,3);
y0=num(1,4);
z0=num(1,5);
t0=num(1,6);
v0=num(1,13);
%cac gia tri sau
x1=num(1+1,3);
y1=num(1+1,4);
z1=num(1+1,5);
t1=num(1+1,6);
v1=num(1+1,13);
        %xac dinh cac truong hop
th1=0;% toa do khong thay doi
th2=0;% xy khong doi z thay doi
th3=0;% x khong thay doi y thay doi
th4=0;% x khong thay doi
%so sanh cac toa do dau va cuoi co bang nhau hay khong
 if x0==x1
  if y0==y1
        
    if z0==z1
            % toa do khong doi
       th1=1;
       s0=0;
       s1=0;
     else
            th2=1;
            s0=z0;
            s1=z1;
     end
    else
        th3=1;
        s0=y0;
        s1=y1;
  end
 else
    th4=1;
    s0=x0;
    s1=x1;
 end
 
[hs0,hs1,hs2,hs3,ketqua]=GiaiHe4Pt(t0,t1,v0,v1,s0,s1);
%ket qua
if ketqua==2 || ketqua==1
    xt=0;
    yt=0;
    zt=0;
   
end

if ketqua==3
    
if th1==1 % x,y,z khong thay doi
    xt=[x0,0,0,0,0,0];
    yt=[y0,0,0,0,0,0];
    zt=[z0,0,0,0,0,0];
    
    
end
if th2==1 % x,y  khong thay doi z thay doi
    xt=[x0,0,0,0,0,0];
    yt=[y0,0,0,0,0,0];
    zt=[hs0,hs1,hs2,hs3,0,0];
   
end
if th3==1 %x khong doi y thay doi
     xt=[x0,0,0,0,0,0];
     yt=[hs0,hs1,hs2,hs3,0,0];
     %tinh zt theo xt dat hesoz=(z1-z0)/(y1-y0)
     hesoz1=(z1-z0)/(y1-y0);
     hesoz2=(z0*y1-z1*y0)/(y1-y0);
     %zt=[hs0*hesoz1+hesoz2,hs1*hesoz1,hs2*hesoz1,hs3*hesoz1];
     hszt0=hs0*hesoz1+hesoz2;
     hszt1=hs1*hesoz1;
     hszt2=hs2*hesoz1;
     hszt3=hs3*hesoz1;
     zt=[hszt0,hszt1,hszt2,hszt3,0,0];
    
end
if th4==1 % x thay doi
    xt=[hs0,hs1,hs2,hs3,0,0];
    hesoy1=(y1-y0)/(x1-x0);
    hesoy2=(y0*x1-y1*x0)/(x1-x0);
    hesoz1=(z1-z0)/(x1-x0);
    hesoz2=(z0*x1-z1*x0)/(x1-x0);
    yt=[hs0*hesoy1+hesoy2,hs1*hesoy1,hs2*hesoy1,hs3*hesoy1,0,0];
    zt=[hs0*hesoz1+hesoz2,hs1*hesoz1,hs2*hesoz1,hs3*hesoz1,0,0];
end
end
end
