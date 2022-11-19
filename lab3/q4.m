clear;
n=200; %参数，越大越准确
ak=zeros(1,2*n+1);
k=n;
for x=-n:n              %求解f(t)的系数ak
    if( mod(x,2)==1)
        ak(x+k+1)=-1i/(x*pi);
    end 
end

dt=0.001;
t=0:dt:4;
y=(4*t-2).*(u(t)-u(t-1))+(-t+3).*(u(t-1)-u(t-4));
y(max(size(y)))=-1;
k=n;
w0=pi/2;
bk=zeros(1,2*k+1);
for x=-k:k              %求解g(x)系数bk
    temp=y.*exp(-1i*x*w0*t);
    bk(x+k+1)=sum(temp)*dt./4;
end 


ck=conv(ak,bk);
k=-2*n:2*n;
hold on;
subplot(311);
stem(k,abs(ck));
xlabel('\omega/\omega_0');
ylabel('ck 的频谱图');
axis([-10,10,0,0.3]);

subplot(312);
stem(k,angle(ck));
xlabel('\omega/\omega_0');
ylabel('ck 的相位图');
axis([-10,10,-2.5,2.5]);

k=2*n;
t=-10:dt:10;
f=zeros(1,max(size(t)));
for z=-k:k              %用ck画出函数值 h(t)=f(t)g(t)
    f=f+ck(z+k+1)*exp(1i*z*w0*t);
end
subplot(313);
plot(t,f);
xlabel('t');
ylabel('h(t)=f(t)*g(t)');