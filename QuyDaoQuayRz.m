function [rzt,ketqua]=QuyDaoQuayRz(num)

rz0=num(1,10);
rz1=num(1+1,10);
rz0=rz0*pi/180;
rz1=rz1*pi/180;

if rz0==rz1
  rzt=[rz0,0,0,0,0,0];
else
  s0=rz0;
  s1=rz1;
  t0=num(1,6);
  t1=num(1+1,6);
  v0=num(1,13);
  v1=num(1+1,13);%% van toc Rz
  [hs0,hs1,hs2,hs3,ketqua]=GiaiHe4Pt(t0,t1,v0,v1,s0,s1);
  if ketqua==1 || ketqua==2
      rzt=[0,0,0,0];
  else
  rzt=[hs0,hs1,hs2,hs3];
  end
end

end