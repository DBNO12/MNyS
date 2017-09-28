function [y]=Fibonacci(N)
Nmax = 20;  % El máximo número de elementos de la suceciós de Fibonacci
            % que estamos dispuestos a calcular
texto1 = 'Sólo calculo hasta ';
texto2 = num2str(Nmax);
texto3 = ' elementos';
MensajeError = [texto1  texto2  texto3];
if (N>Nmax)
    disp(MensajeError);
    return;
else
    y=zeros(1,N);
    y(1)=1;
    y(2)=1;
    for j=3:1:N
 %       y(j)=y(j-1)+y(j-2);
            y(j)=suma(y(j-1),y(j-2));
    end
end
end

function [s]=suma(a,b)
s = a+b;
end