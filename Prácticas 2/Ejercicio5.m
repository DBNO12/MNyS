%% NOMBRE: Fran Cruz
%% Apantallamiento de un campo magn�tico
% En este script analizamos los datos del archivo Apantallamiento.txt
% que contiene los valores del factor apantallamiento magn�tico nu de un cilindro
% de cobre en funci�n de la frecuencia f del campo. El factor de apantallamiento
% no tiene dimensiones y la frecuencia f viene dada en Hz
%
% La f�rmula te�rica por la que se nos pide ajustar es
%
% 1/(1-nu^2) = 1+A*f^2+B*f^4
%
% No hay una funci�n que haga directamente este ajuste en Matlab.
% El ejercicio est� dividido en varios apartados de mayor a menor
% complicaci�n. Se empieza por ajustes sencillos pero que no se
% corresponden con la expresi�n te�rica y se acaba por hacer el ajuste que
% se corresponde con ella.
%% Importamos los datos

datos = importdata('Apantallamiento.txt','\t');
f = datos.data(:,1);
y = datos.data(:,2); % y = 1/(1-\mu)^2

%% Resultados de un ajuste por un polinomio de segundo grado
% Polinomio: y = p1*f^2+p2*f+p3*1
%
% Los coeficientes del ajuste obtenidos con el men� Basic Fitting se apuntan 
% a mano en esta tabla
%
% Coeficiente 	 T�rmino 	 Valor 
%
% p1            f^2 	 	 
%
% p2            f 	 	  
%
% p3            1 	 	  
%
% Norma de los residuos = 

figure(1)
subplot (2,3,1)
semilogy(f,y,'.k','MarkerSize',10)
hold on
[p2,S2] = polyfit(f,y,2); % Polinomio de interpolación de 2do grado.
y_fit2 = polyval(p2,f);
plot(f,y_fit2,'b')
title('Ajuste cuadrático')
hold on

subplot(2,3,4)
res_2 = y - y_fit2; % Cálculo de residuos.
bar(f,res_2,'r')
title('Residuos del ajuste cuadrático')

%% Ajuste por un polinomio de cuarto grado
% Probamos primero con un polinomio mal condicionado y luego con un
% polinonio bien condicinado.
%
% Los coeficientes del ajuste obtenidos con el men� Basic Fitting se apuntan 
% a mano en esta tabla
%
% Polinomio mal condicionado: y = p1*f^4+p2*f^3+p3*f^2+p4*f+p5
%
% Coeficiente 	 T�rmino 	 Valor  
%
% p1            f^4
%
% p2            f^3
%
% p3            f^2
%
% p4            f
%
% p5            1
%
% Norma de los residuos = 
%
% ----------------------------------------------------------------
%
% Polinomio bien condicionado y = p1*z^4+p2*z^3+p3*z^2+p4*z+p5
%
% z=(f-mu)/sigma
%
% mu =
%
% sigma = 
%
% Coeficiente 	 T�rmino 	 Valor  
%
% p1            z^4
%
% p2            z^3
%
% p3            z^2
%
% p4            z
%
% p5            1
%
% Norma de los residuos = 

subplot (2,3,2)
semilogy(f,y,'.k','MarkerSize',10)
hold on
[p4,S4] = polyfit(f,y,4); % Polinomio de interpolación de 4o grado.
y_fit4 = polyval(p4,f);
plot(f,y_fit4,'b')
title('Ajuste cuártico')
hold on

subplot(2,3,5)
res_4 = y - y_fit4; % Cálculo de residuos.
bar(f,res_4,'r')
title('Residuos del ajuste cuártico')


%% Ajuste sin usar polyfit
% Tenemos que definir una nueva variable yn = y-1.
% Ajustamos por:
%
% y_n = A*f^2+B*f^4
%
% * A =   +/
% * B =   +/-

y_n = y-1;
f2 = f.^2;
f4 = f.^4;
[Q,R] = qr([f2 f4],0);

pf = [R\(Q'*y_n);1]';
subplot(2,3,3)
semilogy(f,y,'.k','MarkerSize',10)
hold on
y_fite = polyval(pf,f);
plot(f,y_fite,'b')
title('Ajuste especial')

subplot(2,3,6)
res_e = y - y_fite;
bar(f,res_e,'r')
title('Residuos del ajuste especial')