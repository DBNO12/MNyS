%% NOMBRE: Fran Cruz
%% Resumen del ejercicio


%% Importamos los datos
% Se puede usar el comando importada y luego organizar los datos en variables  

D = importdata('galaxia.txt');

r = D.data(:,1); % Distancia al centro de la galaxia.
Vc = D.data(:,2); % Velocidad alrededor del centro.
Ndatos = D.data(:,3); % Número de medidas para estimar el valor de Vc (que es una media).
sigma = D.data(:,4); % Desviación estándar de los datos.
sigma_y = D.data(:,5); 


%% Ajuste por un polinomio de tercer grado.
% Hay que representar la figura usando el comando errorbar para incluir las
% barras de incertidumbre en el valor de Vc.

errorbar(r,Vc,sigma_y,'.k')
hold on
title('Curva de rotación de NGC 7531')
xlabel('r (seg. de arco)')
ylabel('V_c (km/s)')

%% Cálculo de la incertidumbre en los parámetros del ajuste
% Valores de los coeficientes del ajuste
%
% y = p(1) x^3 + p(2) x^2 + p(3)* x + p(4)
%
% * p(1) =    +/- 
% * p(2) =    +/- 
% * p(3) =    +/- 
% * p(4) =    +/- 

[p,S] = polyfit(r,Vc,3);
refcurve(p)
r_aux = 0:r(end);
plot(r_aux,polyval(p,r_aux))

ave_sigma = mean(sigma_y);
aprox_sigma = S.normr/sqrt(S.df);

invR = inv(S.R);
MCov = ave_sigma^2*invR*invR';

s_p = sqrt(diag(MCov));

fprintf('p(1) = %f +- %f\n',p(1),s_p(1))
fprintf('p(2) = %f +- %f\n',p(2),s_p(2))
fprintf('p(3) = %f +- %f\n',p(3),s_p(3))
fprintf('p(4) = %f +- %f\n',p(4),s_p(4))
