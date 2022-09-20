%% Do thi X Y Z theo t
 figure(2);
for t=0:0.05:1
          RE =[2000*(t^3+t^2+t) - 250*cos(360*(t^3+t^2+t));1600*(t^3+t^2+t) - 50;4700*(t^3+t^2+t) + 250*sin(360*(t^3+t^2+t))]; % toa do diem cuoi
          %ve do thi XYZ
          plot(t,RE(1,1), 'k*','color','r');
          plot(t,RE(2,1), 'k*','color','g'); 
          plot(t,RE(3,1), 'k*','color','b'); 
          title('Do thi X-Y-Z theo t');
          xlabel('T');                                              
          hold on;
end
grid on