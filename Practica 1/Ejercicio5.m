% Funciones
% 
% A) Crea un vector x cuyo elemento n-esimo valga (-1)^(n+1)/(2*n-1). Suma
% los cien primeros elementos de la serie resultante. Intenta hacerlo sin
% usar ningún bucle. La función sum(A) suma todos los elementos de un
% vector A.

n = 1:100;
x = (-1).^(n+1)./(2*n-1)
sum(x)

% B) Cuando hayas conseguido esto, construye una función que pida un valor
% prec, sume todos los elementos del vector x que sean mayores que prec en
% valor absoluto y devuelva el resultado. Intenta hacerlo sin usar ningún
% if.

% Resuelto en FEjercicio5B