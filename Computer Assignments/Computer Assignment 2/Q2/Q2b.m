%In this part we plot the heat of 1m pole for t=0,5,10 respectively.
m = 0;
x=linspace(0,1,100);
t=linspace(0,10,101);
sol=pdepe(m,@Equation,@Init,@BC,x,t);
u=sol(:,:,:);
hold on
plot(x,u(1,:));
plot(x,u(51,:));
plot(x,u(end,:));
legend('u(x,0)','u(x,5)','u(x,10)')
title('Temperature with respect to distance')
xlabel('x(Distance)')
ylabel('u(Temperature)')