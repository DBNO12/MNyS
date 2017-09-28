% Script Fibonacci.m
% Este script genera la sucesi�n de Fibonacci hasta el quinto t�rmino
% y la guarda en el array Fib
% Inicializacion de variables
% Damos valores iniciales a la s variables que necesitamos
clear;
clc;
N = 5;  % N�mero de t�rminos
Fib = zeros(1,N);
%%
% Calculo
% Calculo la sucesi�n de Fibonacci hasta el quinto t�rmino
Fib(1)=1;
Fib(2)=1;
Fib(3)=Fib(2)+Fib(1);
Fib(4)=Fib(3)+Fib(2);
Fib(5)=Fib(4)+Fib(3);
