m = 0;
x=linspace(0,1,100);
t=linspace(0,10,101);
sol=pdepe(m,@Equation,@Init,@BC,x,t);
u=sol(:,:,:);
surf(x,t,u);
title('Heat Equation Solution')
xlabel('x(Distance)')
ylabel('t(Time)')
zlabel('u(x,t)')