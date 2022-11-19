%x1(t)的傅里叶变换，使用了两种方法
clear all
syms t
x1_t = exp(-2*abs(t)) .* sin(4*t);
X1 = fourier(x1_t);
w=[-10,10];
hold on;
subplot(2,2,1);
fplot (abs(X1),w);
title('幅度谱');
xlabel('\omega');grid
ylim([0, 0.5])

subplot(2,2,2);
fplot (angle(X1),w);
title('相位谱');
xlabel('\omega');grid
ylim([-2, 2])


dt = 0.01;
dw = 0.1;
t = -10: dt: 10;
w = -10:dw:10;
x1_t =  exp(-2*abs(t)) .* sin(4*t);
X1 = x1_t * exp(-1j * t.' * w) * dt;
X1(1,101)=0;
%因为在101时本该为0，不是0，即使偏差一点，相位差也很大
subplot(2,2,3);
plot (w,abs(X1));
title('幅度谱');
xlabel('\omega');
grid;
ylim([0, 0.5]);
subplot(2,2,4);
plot (w,angle(X1));
title('相位谱');
xlabel('\omega');
grid;
ylim([-2, 2]);