function [hs0,hs1,hs2,hs3,ketqua]=GiaiHe4Pt(t0,t1,v0,v1,s0,s1)
a=[1,t0,t0*t0,t0*t0*t0,s0
   0,1 ,2*t0,3*t0*t0,v0
   1,t1,t1*t1,t1*t1*t1,s1
   0,1 ,2*t1,3*t1*t1,v1];
%a=[a11,a12,a13,a14,a15
   %a21,a22,a23,a24,a25
   %a31,a32,a33,a34,a35
   %a41,a42,a43,a44,a45];
   
l=[a(:,1),a(:,2),a(:,3),a(:,4)];
%so sanh rank cua ma tran 4x4 và 4x5 de bien luan nghiem
BacMaTran45=rank(a);
BacMaTran44=rank(l);

if BacMaTran44~=BacMaTran45
  ketqua=1;
  hs0=0;
  hs1=0;
  hs2=0;
  hs3=0;
    
else if BacMaTran44<4
         ketqua=2;
         hs0=0;
         hs1=0;
         hs2=0;
         hs3=0;
      
    else
        % he so 1 nghiem
        ketqua=3;
     
    
%kiem tra a11 =0 thi doi vi tri hang sao cho a11 khac 0
if a(1,1)==0
 
   if a(2,1)==0
	if a(3,1)==0
		if a(4,1)~=0
		  temp=a(1,:);
	          a(1,:)=a(4,:);
              a(4,:)=temp;
		end 
	else temp=a(1,:);
	     a(1,:)=a(3,:);
         a(3,:)=temp;
	end	
   else temp=a(1,:);
	a(1,:)=a(2,:);
        a(2,:)=temp;
   end
   
 
end

% khu phan tu cot 1 tu a21 a31 a41
for j=2:1:4
  
    a(j,:)=a(j,:)-a(j,1)*a(1,:)/a(1,1);
    
end

% kiem tra a22 =0 hay khong
if a(2,2)==0
	if a(3,2)==0
		if a(4,2)~=0
		  temp=a(2,:);
	          a(2,:)=a(4,:);
                  a(4,:)=temp;
		end 
	else temp=a(2,:);
	     a(2,:)=a(3,:);
             a(3,:)=temp;
	end	
   
end
% khu phan tu a32 a42

a(3,:)=a(3,:)-a(3,2)*a(2,:)/a(2,2);
a(4,:)=a(4,:)-a(4,2)*a(2,:)/a(2,2);

% kiem tra phan tu a33
if a(3,3)==0
	if a(4,3)~=0
	   temp=a(3,:);
       a(3,:)=a(4,:);
       a(4,:)=temp;
	end 
end	
% khu phan tu cot thu 3 a43


a(4,:)=a(4,:)-a(4,3)*a(3,:)/a(3,3);
% >> duoc ma tran bac thang


% tinh nghiem theo ma tran bac thang
%ketquatt='He phuong trinh co nghiem la:';

hs3=a(4,5)/a(4,4);
hs2=(a(3,5)-hs3*a(3,4))/a(3,3);
hs1=(a(2,5)-hs3*a(2,4)-hs2*a(2,3))/(a(2,2));
hs0=(a(1,5)-hs3*a(1,4)-hs2*a(1,3)-hs1*a(1,2))/a(1,1);
    end
end
end