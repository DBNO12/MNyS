% Vamos a resolver el problema 3 del Tema 1.

ejemplo_fscanf; % Funcion ya proporcionada que nos importa los datos
% necesarios de manera autom�tica. Guarda un vector fila I con las
% intensidad y una matriz V donde cada columna recoge las distintas medidas
% de voltaje para cada I.

Vm = mean(V); % Vector fila con la media de voltajes para cada intensidad.
Vstd = std(V); % Vector fila de errores de las medias.

nexp = size(V); nexp = nexp(1); % N�mero de medidas de V para cada I.

incV = Vstd/sqrt(nexp); % Incertidumbre de cada medida de V.

errorbar(I,Vm,incV,'.k'); % Representaci�n de V = V(I) con barras de error.
hold on
axis([0 2 0 30]) % Ajuste de los ejes.
xlabel('Intensidad (A)') % Titulamos le eje X.
ylabel('d.d.p. (micro-V)') % Titulamos el eje Y.
title('Ley de Ohm') % Titulamos el gr�fico.

[p,S] = polyfit(I,Vm,1); % Calculamos el ajuste lineal.
plot(0:0.1:2,polyval(p,0:0.1:2),'r') % Pintamos el ajuste lineal.
% Podr�amos hacerlo con refcurve(p). (FORMA RECOMENDADA)
legend('Datos Experimentales','Recta de ajuste')

sigmay = mean(incV); % Tomamos sigmay como incetidumbre del experimento.
r = corrcoef(I,Vm); % C�lculo de el coeficiente de correlaci�n.
norma = S.normr; % Norma de los residuos.
inc = norma/S.df; % -- �sqrt?
inc2 = norma/sqrt(S.df);
invR = inv(S.R);
C = invR*invR'; % C�lculo de la matriz de covarianzas.
MCovarianza = sigmay^2*C

sigmaa_1 = sigmay*sqrt(MCovarianza(1,1)); % C�lculo de la incertidumbre del t�rmino indep. 
sigmaa_2 = sigmay*sqrt(MCovarianza(2,2)); % �dem del t�rmino de pendiente.



