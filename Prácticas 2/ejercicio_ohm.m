%% NOMBRE:
%% Resistencia de una barra de cobre
% En este script se analiza la dependencia de la ca�da de potencial V frente
% a la intensidad I que circula por una barra de cobre. V es la variable
% dependiente, porque en el experimento controlamos la intensidad I y medimos
% la diferencia de potencial V. Sin embargo, imponiendo la misma intensidad
% I no siempre se mide la misma diferencia de potencial V. En los datos que
% se nos proporcionan hay 34 series experimentales diferentes. Us�ndolas
% queremos saber si se cumple la leyr de Ohm V=IR y cu�l es el valor
% de la resistencia R de la barra de cobre con su error.
clear;
clc;
%% Importamos los datos
% AYUDA: Para importar los datos puede usar el script 'ejemplo_fscanf' que 
% encontrar� en la p�gina web de la asignatura.


%% C�lculo el valor medio de la d.d.p para cada intensidad
% Tambi�n hay que calcular la desviaci�n est�ndar de las medidas de la ddp 
% para cada intensidad 

%% Gr�fica con barras de error
% Para hacer las gr�ficas con las barras de error hay que usar el 
% comando errorbar(X,Y,L)

%% C�lculo de los coeficientes del ajuste usando la funci�n polyfit
% Conocida la recta de mejor ajuste hay que pintarla en la figura anterior


%% Tabla con indices de la calidad del ajuste
% Los valores que presentamos son la indeterminaci�n de la variable 
% independiente sigmay, la norma de los residuos y el coeficiente de correlaci�n
%
% * norma de los residuos =
% * sigma_y  =
% * norma_residuos / grados_libertad = 
% * coef. de correlaci�n = 



%% C�lculo de la matriz de covarianzas
% Mostramos en pantalla la matriz de covarianzas calculada a partir de los
% datos devueltos por la funci�n polyfit.



%% Calculamos la indeterminaci�n de los par�metros de ajuste
% Presentamos los coeficientes del ajuste con su incertidumbre 
%
% * Y = p(1)*x+p(2)
% * p(1) =      +/-
% * p(2) =      +/-
