% Ejercicio 6.
%% Importamos datos.

D = importdata('GuiaOndas.txt');
s = D.data(:,1);
E = D.data(:,2);

%% Representamos E frente a s (y preparamos el dibujo para los residuos próximos).

figure(1)
subplot(2,1,1)
plot(s,E,'.k','MarkerSize',10)
hold on
title('Datos experimentales y ajuste generalizado')
xlabel('Posición, s (mm)')
ylabel('Módulo de campo eléctrico, |E| (N/C)')

%% Calculamos el ajuste generalizado.

% Ajustaremos por E(s) = A + E_0*cos[4pi*(s-s_0)/L]
% donde los parámetros de ajuste son A, E_0, s_0.

% Para adaptar esto al método QR, desarollamos ese 'coseno de la
% diferencia', y expresamos f(x) = A + B*cos(4pi*s/L)+D*sin(4pi*s/L).
% Para ello, hemos definido B = E_0*cos(4pi*s_0/L) y D =
% E_0*sin(4pi*s_0/L).
% Aclaración: L es una constante conocida en el problema.

L = 36.58; % mm
f = @(x) 1;
g = @(x) cos(4*pi.*x/L);
h = @(x) sin(4*pi.*x/L);

% Construimos la matriz de ajuste:
% V = [f(s) g(s) h(s)]; Reporta un error porque f([..]) = 1 (sin carácter
% matricial/vectorial).
V = [ones(length(s),1) g(s) h(s)];

% Y ahora, basta aplicar el método de cálculo de A,B,D:
[Q,R] = qr(V,0);
coefs = R\Q'*E;
A = coefs(1); B = coefs(2); D = coefs(3);

%% Cálculo de los errores de las constantes de ajuste.

% Como no conocemos los errores de la variable dependiente E (sigma_y),
% vamos a estimarla gracias a la norma de los residuos y los grados de
% libertad.

P = @(x) A + B*g(x) + D*h(x);
Norma2 = sum((P(s)-E).^2);
sigma_y = sqrt(Norma2/(length(s)-3)); % sigma_y ~ sqrt(Norma2/(Puntos-Parámetros))

invR = inv(R);
MCov = sigma_y^2*R\invR';

dA = MCov(1,1);
dB = MCov(2,2);
dD = MCov(3,3);

% Devolvemos los parámetros de ajuste.

fprintf('A = %f +- %f\n',A,dA)
fprintf('B = %f +- %f\n',B,dB)
fprintf('D = %f +- %f\n\n',D,dD)

% Y basta, ahora, hacer los cálculos para E_0.

E_0 = sqrt(B^2+D^2);
dE_0 = B*dB/E_0+D*dD/E_0;

% Resta devolver los parámetros del ajuste y terminar la gráfica.

fprintf('La amplitud de onda buscada es E_0 = %f +- %f\n',E_0,dE_0)

plot(s,P(s),'b')

subplot(2,1,2)
bar(s,E-P(s),'r')
title('Residuos del ajuste')