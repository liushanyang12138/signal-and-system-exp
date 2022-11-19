clear 
%思路是手动求出傅里叶级数ak，计算通过循环逐项计算ak*e^(jkw0t);
%m = input('m = '); %键盘输入傅里叶级数展开的项数
m=3;
t = -4:0.01:4; %时域波形的时间范围-2π~2π，采样间隔 0.01 
n = round(length(t)/4); %根据周期方波信号的周期，计算 1/2 周期的数据点数
f = [ones(n,1);-1*ones(n,1);ones(n,1);-1*ones(n+1,1)]; %构造周期方波信号
f=f*0.5;
y = zeros(2,max(size(t))); 
y(2,:) = f'; 
figure(1); 
x = zeros(size(t)); 
for k=1:2:2*m-1 %循环显示谐波叠加图形
 %pause; 
 x = x+2*sin( (k*pi/2).*t)./(k*pi);
 y(1,:) = x; %计算各次谐波叠加和 
% kk = strcat(kk,',',num2str(k+2)); 
end 
subplot(2,2,1);
 plot(t,y(2,:)); 
 hold on; 
 plot(t,y(1,:)); %绘制谐波叠加信号
 hold off; 
 grid; 
 axis([-4 4 -0.6 0.6]); 
 title(strcat('前',num2str(m),'次谐波叠加')); 
 xlabel('单位 t','Fontsize', 8);

 m=9;
for k=7:2:2*m-1 %循环显示谐波叠加图形
 %pause; 
 x = x+2*sin( (k*pi/2).*t)./(k*pi);
 y(1,:) = x; %计算各次谐波叠加和 
% kk = strcat(kk,',',num2str(k+2)); 
end 
subplot(2,2,2);
 plot(t,y(2,:)); 
 hold on; 
 plot(t,y(1,:)); %绘制谐波叠加信号
 hold off; 
 grid; 
 axis([-4 4 -0.6 0.6]); 
 title(strcat('前',num2str(m),'次谐波叠加')); 
 xlabel('单位 t','Fontsize', 8);

 m=33;
for k=19:2:2*m-1 %循环显示谐波叠加图形
 %pause; 
 x = x+2*sin( (k*pi/2).*t)./(k*pi);
 y(1,:) = x; %计算各次谐波叠加和 
% kk = strcat(kk,',',num2str(k+2)); 
end 
subplot(2,2,3);
 plot(t,y(2,:)); 
 hold on; 
 plot(t,y(1,:)); %绘制谐波叠加信号
 hold off; 
 grid; 
 axis([-4 4 -0.6 0.6]); 
 title(strcat('前',num2str(m),'次谐波叠加')); 
 xlabel('单位 t','Fontsize', 8);

 m=99;
for k=67:2:2*m-1 %循环显示谐波叠加图形
 %pause; 
 x = x+2*sin( (k*pi/2).*t)./(k*pi);
 y(1,:) = x; %计算各次谐波叠加和 
% kk = strcat(kk,',',num2str(k+2)); 
end 
subplot(2,2,4);
 plot(t,y(2,:)); 
 hold on; 
 plot(t,y(1,:)); %绘制谐波叠加信号
 hold off; 
 grid; 
 axis([-4 4 -0.6 0.6]); 
 title(strcat('前',num2str(m),'次谐波叠加')); 
 xlabel('t','Fontsize', 8);
