close all
clear
%只需要将t 改成n，间隔为1，其他思路一样
dw = 0.1;
n = -100: 100;
w = -10:dw:10;
x_n = (0.5).^(abs(n));
X = x_n * exp(-1j * n.' * w) ;
figure
subplot(2,1,1);
plot (w,abs(X));
title('幅度谱');
xlabel('\omega');grid
subplot(2,1,2);
plot (w,angle(X));
title('相位谱');
xlabel('\omega');grid
ylim([-2, 2])
