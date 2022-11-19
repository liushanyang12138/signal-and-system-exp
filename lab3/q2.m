clear
dt=0.001;
t=0:dt:4;
y=(4*t-2).*(u(t)-u(t-1))+(-t+3).*(u(t-1)-u(t-4));   %求出g(t)的函数值
y(max(size(y)))=-1;
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
subplot(212);
stem(x,angle(ak));

%f=zeros(1,max(size(t)));
%for z=-k:k
%    f=f+ak(z+k+1)*exp(1i*z*w0*t);
%end
%plot(t,f);