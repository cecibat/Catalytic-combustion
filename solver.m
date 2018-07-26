function [res] = solver(saveplot, saveprofile)

global xs xw ymax Dg Ds k beta1 beta2 c0 umax M name
%% Discretization

       % Discretization of  x-axis for gas region
hx = xs/(M-1);      % Space step
N = (xw-xs)/hx + M;   % Discretization of x-axis for solid region
hy = 0.1;   % Choose according to stability results


if abs(round(N) - N) > 10^-10 %because of float-point precision sometimes N is supposed to be an integer but it isnt
     ['xs and xw have to be multiples of hx']
     return
end
N = floor(N+10^-10); %if N is almost an integer, but we need it to be an integer

%% Matrix Setup
uf = @(i) umax*(1 - 4*((i-1)*hx/xs-1/2).^2);
u = uf(linspace(2,M-1, M-2));

Atemp1 = gallery('tridiag',M ,1, -2, 1);
Atemp1 = Atemp1*(-hy)*Dg/hx^2;
Atemp1 = (Atemp1'./[1,u,1])'; %we simply put 1's here, because those lines of Atemp1 will be ignored anyways.
Atemp1 = Atemp1 + speye(M);
Atemp2 = gallery('tridiag',N-M+1,1, -2-k*hx^2/Ds, 1);  
A = [-1,1,sparse(1,N-2); 
    Atemp1(2:M-1,:), sparse(M-2,N-M); 
    sparse(1,M-2), -beta1, beta1 + beta2, -beta2, sparse(1,N-M-1);
    sparse(N-M-1,M-1), Atemp2(2:N-M,:);
    sparse(1,N-2),-1,1];

% Initial condition
C = [ones(M,1)*c0; zeros(N-M,1)];

% Solution implemenation

for i = 2:floor(ymax/hy)
    C(:,i) = A\[0;C(2:M-1,i-1);zeros(N-M+1,1)];
end

if saveplot == 1
    view(50,30);
    mesh(linspace(0,ymax,floor(ymax/hy)),linspace(0,xw,N),C)
    
    view(50,30);
    title('Concentration behavior in both gas and solid regions')
    xlabel('Length of ceramic pipe')
    ylabel('Heigth of ceramic pipe')
    zlabel('Exhaust gas concentration')
    fname = strcat('images/fig_', name, '.eps');
    print(fname, '-depsc' )
end

if saveprofile == 1
    D = linspace(0, floor(ymax/hy)-1, 15);
    a = (floor(ymax/hy)-1)/15*hy;
    D = floor(D)+1;
    plot(linspace(0,xw,N)', C(:,D))
    title(strcat('Concentration behavior, plotted roughly every  ', num2str(a), ' units in y'))
    xlabel('Length of ceramic pipe')
    ylabel('Exhaust gas concentration')

end

end