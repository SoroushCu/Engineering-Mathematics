clc
clear all

syms z t;
Choice1=input('Integrate on unit circle or with residue theorem? (1:On circle,2:Residue) : ');
Choice2=input("Which Function do you want to integrate?(1:i,2:ii,3:iii): ");
if Choice1==1
    z=exp(1i*t);
    if Choice2==1
        f=z^3+2*z^2+1;
        Ans=int(1j*exp(1j*t)*f,t,0,2*pi);
        disp("The integral is equal to :")
        disp(Ans)
    elseif Choice2==2
        f=1/(z-1j/9)^3;
        Ans=int(1j*exp(1j*t)*f,t,0,2*pi);
        disp("The integral is equal to :")
        disp(Ans)
    elseif Choice2==3
        f=1/(z^2+0.25);
        Ans=int(1j*exp(1j*t)*f,t,0,2*pi);
        disp("The integral is equal to :")
        disp(Ans)
    end
elseif Choice1==2
    if Choice2==1
        f=z^3+2*z^2+1;
        Poles=poles(f,z);
        if isempty(Poles)==1
            disp('No Poles')
        else
            disp(poles)
        end
        a=[1,2,1];
        b=1;
        [Residue,Roots,k]=residue(a,b);
        if isempty(Residue)==1
            disp('No Residues')
        else
            disp(Residue)
        end
        disp('Since there are no residues the integral equals 0');
    elseif Choice2==2
        f=1/(z^3-z^2*1j/3-z/27+1j/729);
        Poles=poles(f,z);
        if isempty(Poles)==1
            disp('No Poles')
        else
            disp("The pole is : ")
            disp(Poles)
        end
        a=1;
        b=[1,-1j/3,-1/27,1j/729];
        [Residue,Roots,k]=residue(a,b);
        if isempty(Residue)==1
            disp('No Residues')
        else
            disp("The residue is : ")
            disp(Residue(1))
        end
         Ans=2*pi*1j*(Residue(1));
        disp("The integral is equal to :")
        disp(Ans)
    elseif Choice2==3
        f=1/(z^2+0.25);
        Poles=poles(f,z);
        if isempty(Poles)==1
            disp('No Poles')
        else
            disp("The poles are : ")
            disp(Poles)
        end
        b=[1,0,0.25];
        a=1;
        [Residue,Roots,k]=residue(a,b);
        if isempty(Residue)==1
            disp('No Residues')
        else
            disp("The residues are : ")
            disp(Residue)
        end
        Ans=2*pi*1j*(Residue(1)+Residue(2));
        disp("The integral is equal to :")
        disp(Ans)
    end
end