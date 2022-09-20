%% TINH HOC ROBOT 
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
                    0,                               0,                        0,                    1];
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
T02=T01*T12;
T03=T02*T23;
T04=T03*T34;
% Cac ma tran CoSin chi phuong so voi khau 0
  %  Khau 1 so voi khau 0
  R01=[T01(1,1),T01(1,2),T01(1,3)
       T01(2,1),T01(2,2),T01(2,3)
       T01(3,1),T01(3,2),T01(3,3)]
  % Khau 2 so voi khau 0
  R02=[T02(1,1),T02(1,2),T02(1,3)
       T02(2,1),T02(2,2),T02(2,3)
       T02(3,1),T02(3,2),T02(3,3)]
  % Khau 3 so voi khau 0
  R03=[T03(1,1),T03(1,2),T03(1,3)
       T03(2,1),T03(2,2),T03(2,3)
       T03(3,1),T03(3,2),T03(3,3)]
     % Khau 3 so voi khau 0
  R04=[T04(1,1),T04(1,2),T04(1,3)
       T04(2,1),T04(2,2),T04(2,3)
       T04(3,1),T04(3,2),T04(3,3)]

    % Du lieu dau vao
      % Luc tac dong  khau 4: F54
      % Momem tac dong khau 4: M54
      % Khoi luong cac khau 
       m1=714.350; m2=678.240; m3=363.732; m4=26.144;
      % gia toc trong truong
       g=9.81;
       
    % Du lieu dau ra 
      % Luc dan dong tu khau 4,3,2,1 :F43 ,F32 ,F21 ,F10
      % Momem dan dong tu khau 4,3,2,1 : M43 ,M32 ,M21 ,M10
% Do robot phun so coi phan luc tu phoi tac dung len khau 4 =0
   % Luc va momen tu khau 4 len doi tuong cong nghe chieu len khau 0
   F54=[0;0;0]
   M54=[0;0;0]
   % Cac ma tran trong luc chieu len khau 0          % can sua lai theoDH
   P01=[0;m1*g;0];
   P02=[0;m2*g;0];
   P03=[0;m3*g;0];
   P04=[0;m4*g;0];
% Tinh Toan khau 4 chieu len he 0
  % Luc tac dung tu khau 3 len khau 4
  F43=F54-P04
  % Momen tac dung 3 len 4 
     % MaTran song goc tai O4 mut tai O3
         % Vi tri cua O3 tren he 4 
          r43=[-250;0;-50]
         % VecTo O3 chieu len he 0
         r03=R04*r43
      rO3song=[0        ,-r03(3,1),r03(2,1)
               r03(3,1) ,0        ,-r03(1,1)
               -r03(2,1),r03(1,1),0        ]
      % Ma Tran song goc tai O4 mut tai C4
          % Vi tri C4 chieu len he 4
          rC44=[-250;0;0]
          % Vi tri C4 chieu len he 0
          rC04=R04*rC44;
       rC4song=[0        ,-rC04(3,1),rC04(2,1)
               rC04(3,1) ,0        ,-rC04(1,1)
               -rC04(2,1),rC04(1,1),0        ];
  M43=M54-rO3song*F43-rC4song*P04
  
 % Tinh Toan khau 3 chieu len he 0
  % Luc tac dung tu khau 2 len khau 3
  F32=F43-P03
  % Momen tac dung 2 len 3 
     % MaTran song goc tai O3 mut tai O2
         % Vi tri cua O2 tren he 3 
          r32=[0;0;-q3]
         % VecTo O3 chieu len he 0
         r02=R03*r32
      rO2song=[0        ,-r02(3,1),r02(2,1)
               r02(3,1) ,0        ,-r02(1,1)
               -r02(2,1),r02(1,1),0        ]
      % Ma Tran song goc tai O3 mut tai C3
          % Vi tri C3 chieu len he 3
          rC33=[-q3/2;0;0]
          % Vi tri C3 chieu len he 0
          rC03=R03*rC33
       rC3song=[0        ,-rC03(3,1),rC03(2,1)
               rC03(3,1) ,0        ,-rC03(1,1)
               -rC03(2,1),rC03(1,1),0        ]
  M32=M43-rO2song*F32-rC3song*P03
  
   % Tinh Toan khau 2 chieu len he 0
  % Luc tac dung tu khau 1 len khau 2
  F21=F32-P02
  % Momen tac dung 1 len 2 
     % MaTran song goc tai O2 mut tai O1
         % Vi tri cua O1 tren he 2 
          r21=[0;-q2;990]
         % VecTo O2 chieu len he 0
         r01=R02*r21
      rO1song=[0        ,-r01(3,1),r01(2,1)
               r01(3,1) ,0        ,-r01(1,1)
               -r01(2,1),r01(1,1),0        ]
      % Ma Tran song goc tai O2 mut tai C2
          % Vi tri C2 chieu len he 2
          rC22=[0;0;990]
          % Vi tri C2 chieu len he 0
          rC02=R02*rC22
       rC2song=[0        ,-rC02(3,1),rC02(2,1)
               rC02(3,1) ,0        ,-rC02(1,1)
               -rC02(2,1),rC02(1,1),0        ]
  M21=M32-rO1song*F21-rC2song*P02
  
     % Tinh Toan khau 1 chieu len he 0
  % Luc tac dung tu khau 0 len khau 1
  F10=F21-P01
  % Momen tac dung 0 len 1 
     % MaTran song goc tai O1 mut tai O0
         % Vi tri cua O0 tren he 1 
          r10=[-100;q1;0]
         % VecTo O1 chieu len he 0
         r00=R01*r10
      rO0song=[0        ,-r00(3,1),r00(2,1)
               r00(3,1) ,0        ,-r00(1,1)
               -r00(2,1),r00(1,1),0        ]
      % Ma Tran song goc tai O1mut tai C1
          % Vi tri C1 chieu len he 1
          rC11=[0;0;1150]
          % Vi tri C1 chieu len he 0
          rC01=R01*rC11
       rC1song=[0        ,-rC01(3,1),rC01(2,1)
               rC01(3,1) ,0        ,-rC01(1,1)
               -rC01(2,1),rC01(1,1),0        ]
  M10=M21-rO0song*F10-rC1song*P01
  
  
          
      
   