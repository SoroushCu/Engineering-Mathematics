clear all
clc
%In this part I have defined the needed variables and taken inputs from the
%user
syms x n ;
T=pi;
i = 1;
X_axis=[];
Y_axis=[];
beta = input("Enter power of polynomial part: ");
alpha = input("Enter power of exponential part: ");
Max = input("Enter Max Error:");
%Here we define the function and calculate a0 and an and bn
f(x) = (x^beta)*exp(alpha*x);
a0= int(f(x),x,-T/2,T/2) * 1/T;
an=int(f(x)*cos((2*n*pi)/T * x),x,-T/2,T/2) * 2/T ;
bn=int(f(x)*sin((2*n*pi)/T * x),x,-T/2,T/2) * 2/T;  
An = an*cos((2*n*pi)/T * x);
Bn = bn*sin((2*n*pi)/T * x);
%In the following loop we calculate the error integral until the point
%which our max entry gets larger than E,Then we shall stop and display i.
while 1==1
    A_E=symsum(an^2,n,1,i);
    B_E=symsum(bn^2,n,1,i);
    E = int(f(x)^2,x,-T/2,T/2)*1/T -a0^2 -1/2*(A_E+B_E);
    if Max<E
        i=i+1;
        continue
    else
        break
    end
end
fprintf('Minimum Number of Elements needed(without considering a0) is : %d\n',i);
