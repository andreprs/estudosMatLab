clear
close all
clc
format ShortG

% Assumindo a = 3
a = 3;
Ix = 252757.333333333;
Iy = 1752789.33333333;
Ixy = 471040;

theta = 2 * (-45);  % Ângulo de rotação dos eixos

% Orientação dos eixos principais
theta_principal = -atand((2*Ixy) / (Ix - Iy)) / 2

Iave = (Ix + Iy) / 2
R = sqrt((0.5*(Ix - Iy))^2 + Ixy^2)  % Raio do círculo

% Momentos de inércia máximos e mínimos nos eixos principais
Imax = Iave + R
Imin = Iave - R

% Usar quando a rotação levar em conta os eixos principais
%theta = theta + 2 * theta_principal
%Ix_linha = Iave + R * cosd(theta)
%Iy_linha = Iave - R * cosd(theta)
%Ixy_linha = R * (-sind(theta))  % Seno pode ser negativo

% Usar quando for uma rotação qualquer
Ix_linha = 0.5*(Ix + Iy) + 0.5*(Ix - Iy)*cosd(theta) - Ixy*sind(theta)
Iy_linha = 0.5*(Ix + Iy) - 0.5*(Ix - Iy)*cosd(theta) + Ixy*sind(theta)
Ixy_linha = 0.5*(Ix - Iy)*sind(theta) + Ixy*cosd(theta)