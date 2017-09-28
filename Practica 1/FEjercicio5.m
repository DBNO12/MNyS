function suma = FEjercicio5(prec)

% B) Cuando hayas conseguido esto, construye una función que pida un valor
% prec, sume todos los elementos del vector x que sean mayores que prec en
% valor absoluto y devuelva el resultado. Intenta hacerlo sin usar ningún
% if.

n = 1:100;
x = (-1).^(n+1)./(2*n-1);
suma = sum(x(abs(x)>prec));

end

