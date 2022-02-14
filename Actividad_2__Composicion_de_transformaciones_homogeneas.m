clear
close all
clc

% Matriz de rotacion con trigonometria
Rx = @(theta) [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
Ry = @(theta) [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
Rz = @(theta) [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];

% Marco de referencia (Matriz de transformacion) Tab. B vista desde A
Rab = Rz(-pi/2);
tab = [0.2 0.2 0.2]';
Tab = [[Rab tab]; 0 0 0 1];

% Marco de referencia (Matriz de transformacion) Tad. D vista desde A
Rad = Rz(-pi/2);
tad = [0.6 -0.6 0.3]';
Tad = [[Rad tad]; 0 0 0 1];

% Marco de referencia (Matriz de transformacion) Tbc. C vista desde B
%  Tac = Tab
Rbc = Rx(pi/2);
tbc = [0.2 0.2 -0.1]';
Tbc = [[Rbc tbc]; 0 0 0 1];

% Obtener Tac
Tac = Tab*Tbc

% Obtener Tcd
Tcd = inv(Tbc)*inv(Tab)*Tad

% Punto visto desde el marco de referecia B
pb = [0 -0.2 0 1.0]';
% Obtener Pa
pa = Tab*pb
% Obtener Pc
pc = inv(Tbc)*pb
% Obtener Pd
%pd = inv(Tcd)*pb
pd = inv(Tad)*pa

figure
Dibujar_Sistema_Referencia_3D(eye(4,4),'a')
Dibujar_Sistema_Referencia_3D(Tab,'b')
Dibujar_Sistema_Referencia_3D(Tad,'d')
Dibujar_Sistema_Referencia_3D(Tac,'c')
Dibujar_Punto_3D(pa)



