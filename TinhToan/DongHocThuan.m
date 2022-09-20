% RoBot 4 bac tu do

%% DONG HOC THUAN
      % Ma Tran DH khau 4,3,2,1 so voi khau 0  : T04,T03,T02,T01
      % Ma Tran cosin chi huong khau 4,3,2,1 so voi khau 0: R04,R03,R02,R01
      % Ma Tran vi tri diem cuoi: RE
      % Ma Tran xac dinh vi tri va huong: T04E
      % Van toc diem tac dong cuoi: VE
      % Gia toc diem tac dong cuoi:  aE
      % Van toc goc khau cuoi (4) : W4
      % Gia toc goc khau cuoi (4) : a4
%  Bang DH

syms q1 q2 q3 q4

 d1=q1; d2=q2; d3=q3; d4=50;
 
 phi1=-pi/2; phi2=-pi/2; phi3=-pi/2; phi4=q4;
 
 a1=100; a2=0; a3=0; a4=250;
 
 anpha1=-pi/2; anpha2=pi/2; anpha3=0; anpha4=0;

 % du lieu dau vao
DH=[phi1 d1 a1 anpha1
    phi2 d2 a2 anpha2
    phi3 d3 a3 anpha3
    phi4 d4 a4 anpha4]
% Cac ma tran DH
  % Khau 1 so voi khau 0
  T01= [ cos(DH(1,1)),-cos(DH(1, 4))*sin(DH(1, 1)) ,sin(DH(1, 4))*sin(DH(1, 1)) ,DH(1, 3)*cos(DH(1, 1))
        sin(DH(1, 1)), cos(DH(1, 4))*cos(DH(1, 1)) ,-sin(DH(1, 4))*cos(DH(1, 1)),DH(1, 3)*sin(DH(1, 1))
                    0,                sin(DH(1, 4)),               cos(DH(1, 4)),              DH(1, 2)
                    0,                               0,                        0,                    1]
  % Khau 2 so voi khau 1             
  T12= [ cos(DH(2,1)),-cos(DH(2, 4))*sin(DH(2, 1)) ,sin(DH(2, 4))*sin(DH(2, 1)) ,DH(2, 3)*cos(DH(2, 1))
        sin(DH(2, 1)), cos(DH(2, 4))*cos(DH(2, 1)) ,-sin(DH(2, 4))*cos(DH(2, 1)),DH(2, 3)*sin(DH(2, 1))
                    0,                sin(DH(2, 4)),               cos(DH(2, 4)),              DH(2, 2)
                    0,                               0,                        0,                    1];
  % Khau 3 so voi khau 2
  T23= [ cos(DH(3,1)),-cos(DH(3, 4))*sin(DH(3, 1)) ,sin(DH(3, 4))*sin(DH(3, 1)) ,DH(3, 3)*cos(DH(3, 1))
        sin(DH(3, 1)), cos(DH(3, 4))*cos(DH(3, 1)) ,-sin(DH(3, 4))*cos(DH(3, 1)),DH(3, 3)*sin(DH(3, 1))
                    0,                sin(DH(3, 4)),               cos(DH(3, 4)),              DH(3, 2)
                    0,                               0,                        0,                    1];
  % Khau 4 so voi khau 3
  T34= [ cos(DH(4,1)),-cos(DH(4, 4))*sin(DH(4, 1)) ,sin(DH(4, 4))*sin(DH(4, 1)) ,DH(4, 3)*cos(DH(4, 1))
        sin(DH(4, 1)), cos(DH(4, 4))*cos(DH(4, 1)) ,-sin(DH(4, 4))*cos(DH(4, 1)),DH(4, 3)*sin(DH(4, 1))
                    0,                sin(DH(4, 4)),               cos(DH(4, 4)),              DH(4, 2)
                    0,                               0,                        0,                    1];
% Cac Ma Tran bien doi DH
T02=T01*T12
T03=T02*T23
T04=T03*T34
% Cac ma tran CoSin chi phuong so voi khau 0
  %  Khau 1 so voi khau 0
  R01=[T01(1,1),T01(1,2),T01(1,3)
       T01(2,1),T01(2,2),T01(2,3)
       T01(3,1),T01(3,2),T01(3,3)];
  % Khau 2 so voi khau 0
  R02=[T02(1,1),T02(1,2),T02(1,3)
       T02(2,1),T02(2,2),T02(2,3)
       T02(3,1),T02(3,2),T02(3,3)];
  % Khau 3 so voi khau 0
  R03=[T03(1,1),T03(1,2),T03(1,3)
       T03(2,1),T03(2,2),T03(2,3)
       T03(3,1),T03(3,2),T03(3,3)];
  % Khau 4 so voi khau 0
  R04=[T04(1,1),T04(1,2),T04(1,3)
       T04(2,1),T04(2,2),T04(2,3)
       T04(3,1),T04(3,2),T04(3,3)];
  
% Toa do diem cuoi so voi khau 0 theo bien q
  % Toa do vi tri diem cuoi
   Xe0=T04(1,4);
   Ye0=T04(2,4);
   Ze0=T04(3,4);
   RE=[Xe0;Ye0;Ze0]
   % Ma tran jacobi tinh tien diem cuoi
      % Dao ham cac bien q
    JTE1=diff(RE,q1);
    JTE2=diff(RE,q2);
    JTE3=diff(RE,q3);
    JTE4=diff(RE,q4);
    JTE=[JTE1,JTE2,JTE3,JTE4]
   % Ma Tran jacobi quay khau cuoi
      % Dung phuong phap chieu ta co
      JRE=[0,0,0, 0
           0,0,0, 1
           0,0,0, 0]
  % Van toc diem tac dong cuoi
   % Dat cac gia tri bien theo t ta co
   syms t
   q1=4700*(t^3+t^2+t);
   q2=2000*(t^3+t^2+t);
   q3=1600*(t^3+t^2+t);
   q4=360*(t^3+t^2+t);
   q=[q1;q2;q3;q4];
   % Dao ham lan1 cac bien q
   dq=diff(q,t);
   VE=JTE*dq

  %VEx=diff(Xe0,t);
  %VEy=diff(Ye0,t);
  %VEz=diff(Ze0,t);
  %VE=[VEx;VEy;VEz]
  % Gia toc diem tac dong cuoi
   aE=diff(VE,t)
  % Van toc goc khau cuoi
    % Dao Ham ma tran cosin chi huong R04cham
    %R04cham=diff(R04,t);
    % Ma tran chuyen vi cua ma tran cosin chi huong RT04
    %RT04=[R04(1,1),R04(2,1),R04(3,1)
    %      R04(1,2),R04(2,2),R04(3,2)
    %      R04(1,3),R04(2,3),R04(3,3)];
   % Ma Tran song van toc goc khau 4
   %W4song=R04cham*RT04;
   % Van toc goc khau cuoi
   %W4x=W4song(3,2);
   %W4y=W4song(1,3);
   %W4z=W4song(2,1);
   %W4=[W4x;W4y;W4z]
   % Dung pp chieu ta co van toc goc khau 4
   W4=[0;diff(q4,t);0]
   % Gia Toc goc khau cuoi
   a4=diff(W4,t)