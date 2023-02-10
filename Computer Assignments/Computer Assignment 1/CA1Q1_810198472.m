%In this part we calculate the fourier series of a function and plot it and
%the function accordingly as the user of this program wishes
clear all
clc
%In this part I have defined the needed variables and taken inputs from the
%user
syms x n;
T=pi;
N = input("Enter N: ");
k = input("Enter k: ");
m = input("Enter m: ");
beta = input("Enter power of polynomial part: ");
alpha = input("Enter power of exponential part: ");
%Here we ask the user to enter 1 or 2 to see the fourier series or
%the plot accordingly.
Choice = input("Enter 1 to see Fourier Series or Enter 2 to see the plot: ");
%Here we define the function and calculate a0 and an and bn
f(x) = (x^beta)*exp(alpha*x);
a0= vpa(int(f(x),x,-T/2,T/2) * 1/T);
an=vpa(int(f(x)*cos(2*n*x),x,-T/2,T/2) * 2/T) ;
bn=vpa(int(f(x)*sin(2*n*x),x,-T/2,T/2) * 2/T);  
An = an*cos(2*n*x);
Bn = bn*sin(2*n*x);
if Choice==1
    %Here we create the fourier series for the given amount k
    fourier_k = a0+symsum(An,n,1,k)+symsum(Bn,n,1,k);
    disp(vpa(fourier_k,3));
elseif Choice==2
    %Here we create the fourier series for the given amount N and plot it.
        fourier_n = a0+symsum(An,n,1,N)+symsum(Bn,n,1,N);
    hold on
    for i=0:m
    x1 = -T/2+i*T:0.1:T/2+i*T;
    plotf = ((x1+T/2-(2*i+1)*T/2).^beta).*exp(alpha*(x1+T/2-(2*i+1)*T/2));
    plot(x1,plotf,'r');
    end
    fplot(fourier_n,'b')
    % Set Y axis -50 50 for xe^(2x) and -5 5 for xe^(-0.5x) to get the
    % desired shapes.
    axis([-pi/2,(2*m-1)*pi/2,-50,50])
end