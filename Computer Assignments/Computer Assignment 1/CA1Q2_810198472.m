%In this part we shall calculate the Error as defined in the question.
clear all
clc
%In this part I have defined the needed variables and taken inputs from the
%user
syms x n ;
T=pi;
i = 1;
X_axis=[];
Y_axis=[];
N = input("Enter N:");
beta = input("Enter power of polynomial part: ");
alpha = input("Enter power of exponential part: ");
%Here we ask the user to enter 1 or 2 to see the error or plot accordingly.
Choice = input("Enter 1 to calculate Error or Enter 2 to see plot:");
%Here we define the function and calculate a0 and an and bn
f(x) = (x^beta)*exp(alpha*x);
a0= int(f(x),x,-T/2,T/2) * 1/T;
an=int(f(x)*cos((2*n*pi)/T * x),x,-T/2,T/2) * 2/T ;
bn=int(f(x)*sin((2*n*pi)/T * x),x,-T/2,T/2) * 2/T;  
An = an*cos((2*n*pi)/T * x);
Bn = bn*sin((2*n*pi)/T * x);
if Choice==1
    %Here we calculate the error integral(The version which Dr.Mohammadpour
    %used in class which yields the same result with less computations in
    %matlab.
    A_E=symsum(an^2,n,1,N);
    B_E=symsum(bn^2,n,1,N);
    E = int(f(x)^2,x,-T/2,T/2)*1/T -a0^2 -1/2*(A_E+B_E);
    disp(vpa(E));
elseif Choice==2
    %Here we plot the Error as asked from us in the question.
    while i<=N
        A_E=symsum(an^2,n,1,i);
        B_E=symsum(bn^2,n,1,i);
        X_axis(i)=i;
        Y_axis(i) = log(vpa(int(f(x)^2,x,-T/2,T/2)*1/T -a0^2 -1/2*(A_E+B_E)));
        i=i+1;
    end
    hold on
    plot(X_axis,Y_axis)
end