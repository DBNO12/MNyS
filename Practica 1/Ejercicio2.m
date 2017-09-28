% El operador :
% 
% Nota: Este ejercicio está tomado del capítulo 3 del Aprenda Matlab 7.0
% como si estuviera en primero, de Javier García de Jalón, José Ignacio
% Rodríguez, Jesús Vidal. Si el ejercicio te resulta muy difícil, puedes
% encontrar las soluciones allí.
% 
% Para empezar, defínase un vector x con el siguiente comando:
% 
% x=1:10
% 
% y compruebe que se obtienen los números enteros entre el 1 y el 10.
% Por defecto el incremento es 1, pero este operador puede también
% utilizarse con otros valores enteros y reales, positivos o negativos.
% En este caso el incremento va entre el valor inferior y el superior.
% Pruebe estos ejemplos:
% 
% a) x=1:2:10
% 
% b) x=1:1.5:10
% 
% c)	x=10:-1:1
% 
% Por defecto, este operador produce vectores fila. Si se desea obtener un
% vector columna basta trasponer el resultado.
% 
% 2) Defina una matriz A de tamaño 6×6 tecleando:
% 
% A=magic(6)

A = magic(6)

% Mediante el operador :
% 
% a) extraiga los 4 primeros elementos de la 6ª fila.

A(6,1:4)

% b) extraiga todos los elementos de la 3ª fila:

A(3,:)

% c) Para acceder a la última fila o columna puede utilizarse la palabra
% clave end, en lugar del número correspondiente. Por ejemplo, compruebe
% que para extraer la sexta fila (la última) de la matriz se puede hacer
% >> A(end, :)

A(end, :)

% d) Extraiga todos los elementos de las filas 3, 4 y 5.

A(3:5,:)

% e) Se pueden extraer conjuntos disjuntos de filas utilizando corchetes
% [ ]. Por ejemplo, compruebe que el siguiente comando extrae las filas 1,
% 2 y 5: >> A([1 2 5],:)
% 
% Todo lo que se dice para filas vale para columnas y viceversa: basta
% cambiar el orden de los índices.
% 
% f) El operador dos puntos (:) puede utilizarse en ambos lados del
% operador (=). Por ejemplo, a continuación defina una matriz identidad B
% de tamaño 6×6 y reemplace las filas 2, 4 y 5 de B por las filas 1, 2 y 3
% de A, usando la secuencia de comandos:
% 
% >> B=eye(size(A));
% 
% >> B([2 4 5],:)=A(1:3,:)
% 
% g) Se pueden realizar operaciones aún más complicadas, tales como la
% siguiente:
% 
% >> B=eye(size(A));
% 
% >> B(1:2,:)=[0 1; 1 0]*B(1:2,:)
% 
% ¿Puede describir la operación que se ha hecho?
% 
% h) Como nuevo ejemplo, se va a ver la forma de invertir el orden de los
% elementos de un vector:
% 
% Defina un vector fila w=rand(1,5). Compruebe que la instrucción
% w=w(5:-1:1) invierte el orden de los elementos dentro del vector.
% 
% i) Generalice lo que ha aprendido en el último punto para invertir el
% orden de las columnas de la matriz:
% 
% >> A=magic(3)
% Nota: existe una función llamada fliplr(A) hace el mismo cometido.

A = magic(3)
A = A(:,end:-1:1)

% j) Compruebe que A(:) representa un vector columna con las columnas de A
% una detrás de otra.

A(:)