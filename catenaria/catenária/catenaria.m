clear
close all
clc

% Variaveis
global g rho L L1 L2 f1 f2 h s
g = 9.81;           % [m/s²]
rho = 0.65 * g;     % [Kg/m]
L = 120;            % [m]
%L1 = 5;            % [m]
%L2 = 0;            % [m]
f1 = 30;            % [m]
f2 = 30;            % [m]
%s1 = 0;            % [m]
%s2 = 0;            % [m]
%h = 0;             % [m]
%s = 0;             % [m]


T0 = 0:0.01:500;
plot(T0, func_catenaria(T0))
hold on
grid

[Xinput, Yinput] = ginput(1);
x = fzero('func_catenaria', Xinput);
plot(x, 0, 's', 'MarkerSize', 10, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r')
y = [Xinput Yinput; x 0]

% Tensão inicial
T0 = x

% Equação geral catenária
y = T0/rho.*(cosh(rho*x./T0) - 1); % X -> L necessário

% Distância horizontal do vértice até um dos apoios
L1 = T0/rho.*acosh(rho*f1./T0 + 1);
L2 = T0/rho.*acosh(rho*f2./T0 + 1);

% Comprimento do cabo
s1 = T0/rho.*(sinh(rho*L1./T0));
s2 = T0/rho.*(sinh(rho*L1./T0));

% Comprimento total do cabo
s = s1 + s2;

% Tensão em um dos apoios
T = T0 + rho*f1; % tensão do apoio f1
%T = T0 + rho*f2; % tensão do apoio f2

% Ângulo formado pela tensão
theta = atand(rho*s1./T0); % s1 -> comprimento necessário
Tx = T*cosd(theta); % componentes
Ty = T*sind(theta);
W = rho*(s1 + s2); % Peso total do cabo [N]