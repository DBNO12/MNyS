function [y]=numero_par(x)
% Esta función determina si el número x es par
% devuelve true si lo es y false en caso contrario
z = round(x/2);
if 2*z==x
    y=true;
    return;
end
y = false;
end