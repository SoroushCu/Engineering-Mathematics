clc
clear all
Choice=input("Choose mapping(enter number) (1:i,2:ii,3:iii)");
r_n=linspace(0,1,5000);
theta_n=linspace(0,pi/2,5000);
[r,theta]=meshgrid(r_n,theta_n);
x=r.*cos(theta);
y=r.*sin(theta);
z=complex(x,y);
if Choice==1
    w=sin(z);
    figure
    plot(real(w),imag(w),'r')
    title('w=sinz')
elseif Choice==2
    w=z^2+z;
    figure
    plot(real(w),imag(w),'r')
    title('w=z^2+z')
elseif Choice==3
    w=log(z)+z/2;
    figure
    plot(real(w),imag(w),'r')
    title('w=ln(z)+z/2')
end