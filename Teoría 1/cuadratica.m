function [x1,x2]=cuadratica(a,b,c)
% Esta función resuelve ecuaciones cuadráticas de la forma
% 0=ax^2+bx+c
D = b^2-4*a*c;
if D>0
    x1=(-b+sqrt(D))/(2*a);
    x2=(-b-sqrt(D))/(2*a);
elseif abs(D)<eps
    x1=-b/(2*a);
    x2=x1;
else
    error('Sin solucion real');
end
end