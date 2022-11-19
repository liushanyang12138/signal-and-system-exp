clear 
b=[0,1,2];
a=[1,1,2];
t=0:0.01:5;
sys=tf(b,a);
x=(exp(-t)+exp(-2*t)).*u(t);
o1=lsim(sys,x,t);
subplot(2,1,1);
plot(t,o1);
axis([0,5,-0.5,2]);
xlabel('t');
ylabel('y(t)');
legend('method of lsim');
title('𝑦’’(𝑡) + 𝑦’(𝑡) + 2𝑦(𝑡) = 𝑥’(𝑡) + 2𝑥(𝑡) with 𝑥(𝑡) = (𝑒^{-t}+e^{-2t})𝑢(𝑡)');
hold on;

subplot(2,1,2);
h=impulse(sys,t);
o2=conv(x,h)*0.01;
plot(t,o2(1:length(t)));
axis([0,5,-0.5,2]);
xlabel('t');
ylabel('y(t)');
legend('method of x(t)*h(t)')