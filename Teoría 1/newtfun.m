function [x, f, conv] = newtfun(fh, dfh, x0)
% FUNCI�N NEWTFUN: Usa el m�todo de Newton para resolver la
% ecuaci�n f(x) = 0.
% PAR�METROS DE ENTRADA
% fh: funci�n an�nima que contiene f(x)
% dfh: funci�n an�nima que contiene f�(x).
% x0: valor inicial de x que suponemos que est� cerca de la soluci�n
% PAR�METROS DE SALIDA
% x: soluci�n de f(x) = 0
% f(x): valor de f en la soluci�n que hemos encontrado.
% Debe ser pr�ximo a cero si hemos encontrado con �xito la soluci�n
% conv: indica si el m�todo de Newton a convergido a una soluci�n
% (1 = convergencia, 0 = sin convergencia)
% -----------------------------------------------
% Esta funci�n est� copiada del apartado 10.3 del
% Essential Matlab for Engineers and Scientists. Brian Hahn, 
% Daniel T. Valentine
% ----------------------------------------------
Max_steps = 20; % M�ximo n�mero de iteraciones
steps = 0; % cuenta las iteraciones
x = x0;
re = 1e-8; % error relativo en la soluci�n
myrel = 1;
disp('     x         f(x)');    % cabecera de la tabla
while myrel > re && (steps < Max_steps)
    xold = x;
    x = x - fh(x)/dfh(x);
    steps = steps + 1;
    disp( [x fh(x)] );      % muestra las etapas intermedias
    myrel = abs((x-xold)/x);    % calculamos c�anto cambia la
    % estimaci�n de la soluci�n
end
if myrel <= re
    conv = 1;
else
    conv = 0;
end;
f = fh(x);
end