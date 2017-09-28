% ---------------------------------------------------------------------
% SCRIPT NEWTGEN. Emplea el método de Newton para buscar la solución
% de la ecuación f(x)=0.
% Este script está tomado de la seccion 10.1.2 del Essential Matlab for 
% Engineers and Scientists. Brian Hahn, Daniel T. Valentine 
% ---------------------------------------------------------------------
clear;  % Borramos Workspace
clc;    % Borramos Command Window
Max_steps = 20; % Máximo número de iteraciones
steps = 0;                      % cuenta las iteraciones
x = input( 'Primera estimacion: '); % primera estimación de la solución
re = 1e-8;                      % error relativo en la solución
myrel = 1;
disp('     x         f(x)');    % cabecera de la tabla
while myrel > re && (steps < Max_steps)
    xold = x;
    x = x - f(x)/df(x);
    steps = steps + 1;
    disp( [x f(x)] ); % muestra las etapas intermedias
    myrel = abs((x-xold)/x); % calculamos cúanto cambia la
    % estimación de la solución
end;
if myrel <= re
    disp( 'La solución es' )
    disp( x )
else
    disp( 'SOLUCION NO ENCONTRADA' )
end;
