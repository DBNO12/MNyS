function [x, f, conv] = newtfun(fh, dfh, x0)
% FUNCIÓN NEWTFUN: Usa el método de Newton para resolver la
% ecuación f(x) = 0.
% PARÁMETROS DE ENTRADA
% fh: función anónima que contiene f(x)
% dfh: función anónima que contiene f’(x).
% x0: valor inicial de x que suponemos que está cerca de la solución
% PARÁMETROS DE SALIDA
% x: solución de f(x) = 0
% f(x): valor de f en la solución que hemos encontrado.
% Debe ser próximo a cero si hemos encontrado con éxito la solución
% conv: indica si el método de Newton a convergido a una solución
% (1 = convergencia, 0 = sin convergencia)
% -----------------------------------------------
% Esta función está copiada del apartado 10.3 del
% Essential Matlab for Engineers and Scientists. Brian Hahn, 
% Daniel T. Valentine
% ----------------------------------------------
Max_steps = 20; % Máximo número de iteraciones
steps = 0; % cuenta las iteraciones
x = x0;
re = 1e-8; % error relativo en la solución
myrel = 1;
disp('     x         f(x)');    % cabecera de la tabla
while myrel > re && (steps < Max_steps)
    xold = x;
    x = x - fh(x)/dfh(x);
    steps = steps + 1;
    disp( [x fh(x)] );      % muestra las etapas intermedias
    myrel = abs((x-xold)/x);    % calculamos cúanto cambia la
    % estimación de la solución
end
if myrel <= re
    conv = 1;
else
    conv = 0;
end;
f = fh(x);
end