% ---------------------------------------------------------------------
% SCRIPT NEWTGEN. Emplea el m�todo de Newton para buscar la soluci�n
% de la ecuaci�n f(x)=0.
% Este script est� tomado de la seccion 10.1.2 del Essential Matlab for 
% Engineers and Scientists. Brian Hahn, Daniel T. Valentine 
% ---------------------------------------------------------------------
clear;  % Borramos Workspace
clc;    % Borramos Command Window
Max_steps = 20; % M�ximo n�mero de iteraciones
steps = 0;                      % cuenta las iteraciones
x = input( 'Primera estimacion: '); % primera estimaci�n de la soluci�n
re = 1e-8;                      % error relativo en la soluci�n
myrel = 1;
disp('     x         f(x)');    % cabecera de la tabla
while myrel > re && (steps < Max_steps)
    xold = x;
    x = x - f(x)/df(x);
    steps = steps + 1;
    disp( [x f(x)] ); % muestra las etapas intermedias
    myrel = abs((x-xold)/x); % calculamos c�anto cambia la
    % estimaci�n de la soluci�n
end;
if myrel <= re
    disp( 'La soluci�n es' )
    disp( x )
else
    disp( 'SOLUCION NO ENCONTRADA' )
end;
