A0 = [ 250; -120; 460];
A1 = [250; -120; 760];
A2 = [250; -450; 760];
A3 = [45; -450; 760];
A4 = [45; -450; 160];
A31 = [40; -450; 760];
A41 = [40; -450; 160];
A32 = [35; -450; 760];
A42 = [35; -450; 160];
A5 = [ 250; -450; 160];
A6 = [250; -120; 160];
S = 100; 
Vmax = 10; 
T = [ 5; 5; 7; 80; 7; 10; 7;  80; 7; 10; 7; 80; 7; 5; 5];
T1 = T(1);
T2 = T1 + T(2);
T3 = T2 + T(3);
T4 = T3 + T(4);
T5 = T4 + T(5);
T6 = T5 + T(6);
T7 = T6 + T(7);
T8 = T7 + T(8);
T9 = T8 + T(9);
T10 = T9 + T(10);
T11 = T10 + T(11);
T12 = T11 + T(12);
T13 = T12 + T(13);
T14 = T13 + T(14);
T15 = T14 + T(15);
E = [0; 0; 0; 0; 0; 0; 0; 0; 0];
s=[0 250 -120 460 0 0 0 0 0 0]
% chu trinh 1
 for t=0:0.2:T1
      E=quydaobac3_z(A0,A1,0,T1,t);
      s=[s; t E];
  end
 for t=T1:0.2:T2
       E=quydaobac3_y(A1,A2,T1,T2,t);
         s=[s; t E];
   end
  for t=T2:0.2:T3
     E=quydaobac3_x(A2,A3,T2,T3,t);
       s=[s; t E];
  end
  for t=T3:1:T4
      E=quydaothang(A3,A4,S, Vmax, T3,T4,t);
        s=[s; t E]
  end
  for t=T4:T5
      E=quydaobac3_x(A4,A5,T4,T5,t);
        s=[s; t E];
  end
% chu trinh 2
 for t=T5:0.2:T6;
     E=quydaobac3_z(A5,A2,T5,T6,t);
       s=[s; t E];
 end
 for t=T6:0.2:T7
     E=quydaobac3_x(A2,A31,T6,T7,t);
       s=[s; t E];
 end
 for t=T7:0.2:T8
      E=quydaothang(A31,A41,S, Vmax, T7,T8,t);
        s=[s; t E]
  end
 for t=T8:0.2:T9
     E=quydaobac3_x(A41,A5,T8,T9,t);
       s=[s; t E];
 end
% %chu trinh 3
 for t=T9:0.2:T10
     E=quydaobac3_z(A5,A2,T9,T10,t);
       s=[s; t E];
 end
 for t=T10:0.2:T11
     E=quydaobac3_x(A2,A32,T10,T11,t);
       s=[s; t E];
 end
 for t=T11:1:T12
     E=quydaothang(A32,A42,S,Vmax,T11,T12,t);
       s=[s; t E];
 end
 for t=T12:0.2:T13
     E=quydaobac3_x(A42,A5,T12,T13,t);
       s=[s; t E];
 end
 for t=T13:0.2:T14;
     E=quydaobac3_y(A5,A6,T13,T14,t);
       s=[s; t E];
 end