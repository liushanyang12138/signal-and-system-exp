clear all
a=[1,5,3];
b=[0,0,1];
w=linspace(-2*pi,2*pi,500);
h=freqs(b,a,w);
subplot(2,2,1);
hold on;
plot(w/pi,abs(h));
grid;
xlabel('\omega/\pi');
title('幅频响应');

subplot(2,2,2);
hold on;
plot(w/pi,angle(h));
grid;
xlabel('\omega/\pi');
title('相频响应');


subplot(2,2,3);
hold on;
plot(w/pi,real(h));
grid;
xlabel('\omega/\pi');
title('频率响应的实部');


subplot(2,2,4);
hold on;
grid
plot(w/pi,imag(h));
xlabel('\omega/\pi');
title('频率响应的虚部');
