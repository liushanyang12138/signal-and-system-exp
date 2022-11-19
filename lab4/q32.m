%验证卷积性质
dt = 0.01;
dw = 0.001;
t = -10: dt: 10;
w = -10:dw:10;
x1_t = exp(-2*abs(t)) .* sin(4*t);
x2_t = heaviside(t+3)-heaviside(t-1);
x3_t= conv(x1_t,x2_t)*dt;
t = -20: dt: 20;
X3 = x3_t * exp(-1j * t.' * w) * dt;
subplot(2,2,1);
plot (w,abs(X3));
title('直接卷积再傅里叶变换的幅度谱');
xlabel('\omega');
grid;

subplot(2,2,2);
plot (w,angle(X3));
title('直接卷积再傅里叶变换的相位谱');
xlabel('\omega');
grid;



dt = 0.01;
dw = 0.001;
t = -10: dt: 10;
w = -10:dw:10;
x1_t = exp(-2*abs(t)) .* sin(4*t);
X1 = x1_t * exp(-1j * t.' * w) * dt;
x2_t = heaviside(t+3)-heaviside(t-1);
X2 = x2_t * exp(-1j * t.' * w) * dt;
X2(1,101)=0;
X3=X1.*X2;
subplot(2,2,3);
plot (w,abs(X3));
title('两个傅里叶变换相乘得到幅度谱(性质)');
xlabel('\omega');
grid;
subplot(2,2,4);
plot (w,angle(X3));
title('两个傅里叶变换相乘得到相位谱(性质)');
xlabel('\omega');
grid;
