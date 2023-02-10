%Here we draw the 2D heat diagram for the 1m pole(100 and 101 pieces,more effective and less pixelated outcome).
m = 0;
x=linspace(0,1,100);
t=linspace(0,10,101);
sol=pdepe(m,@Equation,@Init,@BC,x,t);
u=sol(:,:,:);
colormap hot%or default
imagesc(x,t,u)
title('2D temperature with respect to time and distance')
xlabel('x(Distance)')
ylabel('t(Time)')