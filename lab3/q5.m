%得到f(t)的ak
clear;
dt=0.001;
t=0:dt:4;
y=(0.5)*(u(t)-u(t-2))-(0.5)*(u(t-2)-u(t-4));   %求出g(t)的函数值
k=10;
w0=pi/2;
ak=zeros(1,2*k+1);
for x=-k:k            %这里求ak，使用土味求积分得出
    temp=y.*exp(-1i*x*w0*t);
    ak(x+k+1)=sum(temp)*dt./4;
end 
x=-k:k;
subplot(211);
hold on;
stem(x,abs(ak));