clc
clear all
Choice=input("Mapping(1),Capacitance plot(2)");
if Choice==1
    %r_n=linspace(1,2,5000);
    r_n=[1,2];
    theta_n=linspace(0,2*pi,5000);
    [r,theta]=meshgrid(r_n,theta_n);
    x=r.*cos(theta);
    y=r.*sin(theta);
    z=r.*exp(1j.*theta);
    w=log(z);
    subplot(121);
    plot(x,y,'b')
    subplot(122);
    plot(real(w),imag(w),'r')
    xlim([-0.2,1]);
elseif Choice==2
    syms coef
    epsilon=9*10^-12;
    h=2;%You may enter a different number
    %Coef=r2/r1(just to make it easier)
    f=(2*pi*epsilon*h)/log(coef);
    ezplot(f,[0.1,100])
    xlabel('r2/r1')
    title('Capacitance')
end