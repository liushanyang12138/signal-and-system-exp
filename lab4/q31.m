%验证线性性质
clear all
syms t
x1_t = 5*exp(-2*abs(t)) .* sin(4*t)+heaviside(t+3)-heaviside(t-1);
X1 = fourier(x1_t);
w=[-10,10];
hold on;
subplot(2,2,1);
fplot (abs(X1),w);
title('直接计算幅度谱');
xlabel('\omega');grid
ylim([0, 4.2])

subplot(2,2,2);
fplot (angle(X1),w);
title('直接计算相位谱');
xlabel('\omega');grid
ylim([-2, 2])

dt = 0.01;
dw = 0.1;
t = -10: dt: 10;
w = -10:dw:10;
x1_t = exp(-2*abs(t)) .* sin(4*t);
X1 = x1_t * exp(-1j * t.' * w) * dt;
x2_t = heaviside(t+3)-heaviside(t-1);
X2 = x2_t * exp(-1j * t.' * w) * dt;
X3=X1*5+X2;
subplot(2,2,3);
plot (w,abs(X3));
title('傅里叶变换相加幅度谱');
xlabel('\omega');
grid;
ylim([0, 4.2]);
subplot(2,2,4);
plot (w,angle(X3));
title('傅里叶变换相加相位谱');
xlabel('\omega');
grid;
ylim([-2, 2]);