%% DONG HOC NGHICH
syms q1 q2 q3 q4 n a b X Y Z
a=0;
b=0;
d1=q1; d2=q2; d3=q3; d4=50;
 
phi1=-pi/2; phi2=-pi/2; phi3=-pi/2; phi4=q4;
 
 a1=100; a2=0; a3=0; a4=250;
 
 anpha1=-pi/2; anpha2=pi/2; anpha3=0; anpha4=0;

 % du lieu dau vao
DH=[phi1 d1 a1 anpha1
    phi2 d2 a2 anpha2
    phi3 d3 a3 anpha3
    phi4 d4 a4 anpha4];
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
  % Ma Tran xac dinh huong va vi tri theo 3 goc cardan
  T04E=[cos(b)*cos(n)                      ,-cos(b)*sin(n)                     ,sin(b)        ,X
        sin(a)*sin(b)*cos(n)+cos(a)*sin(n) ,-sin(a)*sin(b)*sin(n)+cos(a)*cos(n),-sin(a)*cos(b),Y
        -cos(a)*sin(b)*cos(n)+sin(a)*sin(n),cos(a)*sin(b)*sin(n)+sin(a)*cos(n) ,cos(a)*cos(b) ,Z
        0                                  ,0                                  ,0             ,1 ];
  % Tinh toan cac gia tri bien khop q theo vi tri va huong 
    % 3 phuong trinh xac dinh vi tri
     f1=T04E(1,4)-T04(1,4);
     f2=T04E(2,4)-T04(2,4);
     f3=T04E(3,4)-T04(3,4);
    % 3 phuong trinh xac dinh huong
     f4=T04E(1,1)-T04(1,1);
     f5=T04E(2,2)-T04(2,2);
     f6=T04E(3,3)-T04(3,3);
     q4=n;
    % Giai he 4 phuong trinh 4 an q1 q2 q3 q4  
     [q1,q2,q3]=solve(f1,f2,f3)
     q4=n
     