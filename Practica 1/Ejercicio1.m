%% Operaciones entre arrays

%% Sean x = [8 3 7 1]' e y = [4 3 5 1]' (vectores columna). Calcula

%% a) la suma de los elementos de x con los de y
%% b) eleva cada elemento de x a la potencia de cada elemento de y
%% c) divide cada elemento de y entre cada elemento de x
%% d) almacena en z la suma de los productos de x e y elemento a elemento
%% e) calcula x'*y y comparalo con z
%% f) calcula x*y'

x = [8 3 7 1]';
y = [4 3 5 1]';

% Apartado A:
x+y

% Apartado B:
x.^y

% Apartado C:
y./x

% Apartado D:
z = sum(x.*y)

% Apartado E:
x'*y

% Apartado F:
x*y'