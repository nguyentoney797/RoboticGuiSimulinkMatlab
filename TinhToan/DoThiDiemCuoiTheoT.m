%% Do thi 3D diem cuoi theo t
figure(3);
for t=0:0.1:1
         RE =[2000*(t^3+t^2+t) - 250*cos(360*(t^3+t^2+t));1600*(t^3+t^2+t) - 50;4700*(t^3+t^2+t) + 250*sin(360*(t^3+t^2+t))];
          %ve do thi XYZ
          plot3(RE(1,1),RE(2,1), RE(3,1), 'k*','color','r'); 
          title('Do thi vi tri diem cuoi theo T');
          xlabel(' X ');   
          ylabel(' Y ');
          zlabel(' Z ');
          hold on;
end
grid on