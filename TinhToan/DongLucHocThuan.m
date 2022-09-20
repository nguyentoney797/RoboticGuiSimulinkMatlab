syms q1 q2 q3 q4 dq1 dq2 dq3 dq4 ddq1 ddq2 ddq3 ddq4 % gan gia tri bien
% cac gia tri bang DH
 d1=q1; d2=q2; d3=q3; d4=50;
 
 phi1=-pi/2; phi2=-pi/2; phi3=-pi/2; phi4=q4;
 
 a1=100; a2=0; a3=0; a4=250;
 
 anpha1=-pi/2; anpha2=pi/2; anpha3=0; anpha4=0;

 % du lieu dau vao
DH=[phi1 d1 a1 anpha1
    phi2 d2 a2 anpha2
    phi3 d3 a3 anpha3
    phi4 d4 a4 anpha4]
% Cac gia tri cho truoc
   % khoi luong
   m0=3777.939;m1=714.350; m2=678.240 ; m3=363.732 ; m4=26.144;
   % Gia tri tenxo quan tinh
   I0xx=48497302419250;I0yy=57270568123977;I0zz=1818378669;
   I1xx=1546875208333 ;I1yy=1484114458333 ;I1zz=6944633333;
   I2xx=835407048000  ;I2yy=814722298000  ;I2zz=35960850000;
   I3xx=377200882720  ;I3yy=377200882720  ;I3zz=3300435771;
   I4xx=1711793263    ;I4yy=122086897     ;I4zz=1791577717;
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
%% MA TRAN KHOI LUONG M(q) 
  % Cac Ma tran jacobi
     % Ma tran jacobi tinh tien
          % Khau 1
          JT1=[diff(T01(1,4),q1),diff(T01(1,4),q2),diff(T01(1,4),q3),diff(T01(1,4),q4)
               diff(T01(2,4),q1),diff(T01(2,4),q2),diff(T01(2,4),q3),diff(T01(2,4),q4)
               diff(T01(3,4),q1),diff(T01(3,4),q2),diff(T01(3,4),q3),diff(T01(3,4),q4)];
          % Khau 2
          JT2=[diff(T02(1,4),q1),diff(T02(1,4),q2),diff(T02(1,4),q3),diff(T02(1,4),q4)
               diff(T02(2,4),q1),diff(T02(2,4),q2),diff(T02(2,4),q3),diff(T02(2,4),q4)
               diff(T02(3,4),q1),diff(T02(3,4),q2),diff(T02(3,4),q3),diff(T02(3,4),q4)];
          % Khau 3
          JT3=[diff(T03(1,4),q1),diff(T03(1,4),q2),diff(T03(1,4),q3),diff(T03(1,4),q4)
               diff(T03(2,4),q1),diff(T03(2,4),q2),diff(T03(2,4),q3),diff(T03(2,4),q4)
               diff(T03(3,4),q1),diff(T03(3,4),q2),diff(T03(3,4),q3),diff(T03(3,4),q4)];
          % Khau 4
          JT4=[diff(T04(1,4),q1),diff(T04(1,4),q2),diff(T04(1,4),q3),diff(T04(1,4),q4)
               diff(T04(2,4),q1),diff(T04(2,4),q2),diff(T04(2,4),q3),diff(T04(2,4),q4)
               diff(T04(3,4),q1),diff(T04(3,4),q2),diff(T04(3,4),q3),diff(T04(3,4),q4)];
      % Ma tran chuyen vi ma tran jacobi tinh tien
          % Khau 1
          JtT1=[JT1(1,1),JT1(2,1),JT1(3,1)
                JT1(1,2),JT1(2,2),JT1(3,2)
                JT1(1,3),JT1(2,3),JT1(3,3)
                JT1(1,4),JT1(2,4),JT1(3,4)];
          % Khau 2
          JtT2=[JT2(1,1),JT2(2,1),JT2(3,1)
                JT2(1,2),JT2(2,2),JT2(3,2)
                JT2(1,3),JT2(2,3),JT2(3,3)
                JT2(1,4),JT2(2,4),JT2(3,4)];
          % Khau 3
          JtT3=[JT3(1,1),JT3(2,1),JT3(3,1)
                JT3(1,2),JT3(2,2),JT3(3,2)
                JT3(1,3),JT3(2,3),JT3(3,3)
                JT3(1,4),JT3(2,4),JT3(3,4)];
          % Khau 4
          JtT4=[JT4(1,1),JT4(2,1),JT4(3,1)
                JT4(1,2),JT4(2,2),JT4(3,2)
                JT4(1,3),JT4(2,3),JT4(3,3)
                JT4(1,4),JT4(2,4),JT4(3,4)];
    % Ma Tran jacobi quay tung khau
       %( Dung phuong phap chieu)
          % Khau 1
          JR1=[0,0,0,0    
               0,0,0,0
               0,0,0,0];
          % Khau 2
          JR2=JR1;
          % Khau 3
          JR3=JR1;
          % Khau 4
          JR4=[0,0,0,0
               0,0,0,1
               0,0,0,0];
    % Ma tran chuyen vi ma tran jacobi quay
          % Khau 1
          JtR1=[0,0,0
                0,0,0
                0,0,0
                0,0,0];
          % Khau 2
          JtR2=JtR1;
          % Khau 3
          JtR3=JtR1;
          % Khau 4
          JtR4=[0,0,0
                0,0,0
                0,0,0
                0,1,0];
    %Cac ma tran ten xo quan tinh (coi cac khau la cac thanh dong chat)
      g=9.81; 
      Ic1=[I1xx, 0,0
           0,I1yy,0
           0, 0,I1zz]
      Ic2=[I2xx,0 ,0
           0 ,I2yy,0
           0 ,0 ,I2zz]
      Ic3=[I3xx, 0,0
           0,I3yy ,0
           0, 0 ,I3zz]
      Ic4=[I4xx,0 ,0
           0,I4yy,0
           0,0 ,I4zz]
% Ma Tran Khoi luong
Mq=(JtT1*m1*JT1+JtR1*Ic1*JR1)+(JtT2*m2*JT2+JtR2*Ic2*JR2)+(JtT3*m3*JT3+JtR3*Ic3*JR3)+(JtT4*m4*JT4+JtR4*Ic4*JR4)
%Tinh M(q)*q2 cham
dq=[dq1;dq2;dq3;dq4]
ddq=[ddq1;ddq2;ddq3;ddq4]
Mqq=Mq*ddq

%% LUC QUAN TINH CORIOLIS
% khoi tao gia tri ban dau cua ma tra c(q,q11)*q11
c1=0;
c2=0;
c3=0;
c4=0;
for j=1:1:4
    for l=1:1:4
        for k=1:1:4
            if (k==1)
                qk=q1;
                qkk=dq1; %qkk dao dam cap 1 cua qk
            end
            if (k==2)
                qk=q2;
                qkk=dq2;
            end
            if (k==3)
                qk=q3;
                qkk=dq3;
            end
            if (k==4)
                qk=q4;
                qkk=dq4;
            end
            if (l==1)
                ql=q1;
                qll=dq1;
            end
            if (l==2)
                ql=q2;
                qll=dq2;
            end
            if (l==3)
                ql=q3;
                qll=dq3;
            end
            if (l==4)
                ql=q4;
                qll=dq4;
            end
            if (j==1)
                qj=q1;
                c=[k,l,j];%ma tran ten luc quan tinh coriolis
                ct1=diff(Mq(k,j),ql)+diff(Mq(l,j),qk)-diff(Mq(k,l),qj);
                cmt1=(ct1/2)*qkk*qll; % tinh (k,l;1)*qkcham*qlcham
                c1=c1+cmt1 ;
            end
            if (j==2)
                qj=q2;
                c=[k,l,j];%ma tran ten luc quan tinh coriolis
                ct2=diff(Mq(k,j),ql)+diff(Mq(l,j),qk)-diff(Mq(k,l),qj);
                cmt2=(ct2/2)*qkk*qll; % tinh (k,l;3)*qkcham*qlcham
                c2=c2+cmt2 ;
            end
            if (j==3)
                qj=q3;
                c=[k,l,j];%ma tran ten luc quan tinh coriolis
                ct3=diff(Mq(k,j),ql)+diff(Mq(l,j),qk)-diff(Mq(k,l),qj);
                cmt3=(ct3/2)*qkk*qll; % tinh (k,l;3)*qkcham*qlcham
                c3=c3+cmt3 ;
            end
            if (j==4)
                qj=q4;
                c=[k,l,j];%ma tran ten luc quan tinh coriolis
                ct4=diff(Mq(k,j),ql)+diff(Mq(l,j),qk)-diff(Mq(k,l),qj);
                cmt4=(ct4/2)*qkk*qll; % tinh (k,l;4)*qkcham*qlcham
                c4=c4+cmt4 ;
            end
            
         end
        
    end
    
end
%ma tran coriolis
 cqq=[c1;c2;c3;c4]

%% TINH MA TRAN G(q)
     %Tinh the nang tinh theo pp hinh hoc ta co
     TN=m1*g*a1+m2*g*a1+m3*g*100-m4*g*(760+q3);
     G1=diff(TN,q1);
     G2=diff(TN,q2);
     G3=diff(TN,q3);
     G4=diff(TN,q4);
     %ma tran G(q) la
     Gq=[G1;G2;G3;G4]
%% TINH LUC SUY RONG KHONG THE Q
%luc tac dung len khau 4 chieu tren he 0 
  %dung pp chieu ta co do robot phun son nen ta co
   F0E=[0
        0
        0 ];
    M0E=[0;0;0];
  % Ma tran jacobi tinh tien
  Jt1T4=JtT4(1,:); %lay hang 1 cua ma tran JtT4
  Jt2T4=JtT4(2,:); %lay hang 2 cua ma tran JtT4
  Jt3T4=JtT4(3,:); %lay hang 3 cua ma tran JtT4
  Jt4T4=JtT4(4,:); %lay hang 4 cua ma tran JtT4
  % Ma tran jacobi quay
  Jt1R4=JtR4(1,:); %lay hang 1 cua ma tran jacobi chuyen vi quay JtR4
  Jt2R4=JtR4(2,:); %lay hang 2 cua ma tran jacobi chuyen vi quay JtR4
  Jt3R4=JtR4(3,:); %lay hang 3 cua ma tran jacobi chuyen vi quay JtR4
  Jt4R4=JtR4(4,:); %lay hang 4 cua ma tran jacobi chuyen vi quay JtR4
  
  %tinh luc suy rong
  Q1=Jt1T4*F0E+Jt1R4*M0E;
  Q2=Jt2T4*F0E+Jt2R4*M0E;
  Q3=Jt3T4*F0E+Jt3R4*M0E;
  Q4=Jt4T4*F0E+Jt4R4*M0E;
  % Luc suy rong
  Q=[Q1;Q2;Q3;Q4]
 %% PHUONG TRINH VI PHAN CHUYEN DONG CUA ROBOT
 U=Mqq+cqq+Gq+Q
