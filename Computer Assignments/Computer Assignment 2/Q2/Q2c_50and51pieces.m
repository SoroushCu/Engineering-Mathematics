%Here we draw the 2D heat diagram for the 1m pole(50 and 51 pieces,less effective and more pixelated outcome).
m = 0;
x=linspace(0,1,50);
t=linspace(0,10,51);
sol=pdepe(m,@Equation,@Init,@BC,x,t);
u=sol(:,:,:);
colormap hot%or default
imagesc(x,t,u)
title('2D temperature with respect to time and distance')
xlabel('x(Distance)')
ylabel('t(Time)')