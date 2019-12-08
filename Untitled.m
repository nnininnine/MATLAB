close all;
t = [0:0.0001:1];
A = 1*cos(2*pi*2*t);  %Graph cos
C = cos(2*pi*8*t);
M = (A+1).*C; % 100
subplot(3,1,1);
plot(t,A+2,t,-(A+2))
subplot(3,1,2);
plot(t,C,t,A+1,t,-(A+1))
subplot(3,1,3);
plot(t,M,t,A+1,t,-(A+1))