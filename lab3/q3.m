clear
dt=0.001;
t=-10:dt:10;
y=(4*t-2).*(u(t)-u(t-1))+(-t+3).*(u(t-1)-u(t-4));
y(max(size(y)))=-1;
k=100;   %调节的参数
w0=pi/2;
ak=zeros(1,2*k+1);
for x=-k:k              %用上一次求解的步骤来求值
    temp=y.*exp(-1i*x*w0*t);
    ak(x+k+1)=sum(temp)*dt./4;
end 
bk=zeros(1,2*k+1);
for x=-k:k          % 得到g(1-t)的傅里叶系数
    bk(x+k+1)=ak(k+1-x)*exp(-1i*x*w0);
end
x=-k:k;
hold on;
subplot(311);
stem(x,abs(bk));
axis([-10,10,0,0.8]);
xlabel('\omega/\omega_0');
ylabel('bk 的幅度谱') ;

subplot(312);
stem(x,angle(bk));
axis([-10,10,-3,3]);
xlabel('\omega/\omega_0');
ylabel('bk 的相位谱'); 

f=zeros(1,max(size(t)));
for z=-k:k
    f=f+bk(z+k+1)*exp(1i*z*w0*t);
end
subplot(313);
plot(t,f);
xlabel('t');
ylabel('g(1-t)'); 