function [y]=vocal(c)
% Esta funci�n determina si el car�cter c es una vocal
% devuelve true si lo es y false en caso contrario
switch c
    case {'A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u'}
    y=true;
    otherwise
    y=false;
end
end