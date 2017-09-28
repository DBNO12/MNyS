function [y]=vocal(c)
% Esta función determina si el carácter c es una vocal
% devuelve true si lo es y false en caso contrario
switch c
    case {'A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u'}
    y=true;
    otherwise
    y=false;
end
end