function f=func_catenaria(T0)  % Substituir variavel pelo o que for 
                               % o que for necessario
global g rho L L1 L2 f1 f2 h s

%f = alpha + 1 - cosh(alpha/2);

% T0 em função de L, f1 e f2
f = L - T0/rho.*acosh(rho*f1./T0 + 1)-T0/rho.*acosh(rho*f2./T0 + 1);
