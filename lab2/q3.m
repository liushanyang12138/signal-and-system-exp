clear
b=[0,1];
a=[1,2];
t=0:0.01:5;
sys=tf(b,a);
impulse(sys,t);
hold on;
step(b,a);
legend('单位冲激响应','单位跃迁响应');
title('equation: y’(t)+2y(t)=x(t)');