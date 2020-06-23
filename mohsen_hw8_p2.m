%--------Homework#8-----Problem 2-----

clear all
clc

A=[-2 2 0 0 0;1 -2 1 0 0; 0 2 -2 0 0;0 0 3 -2 -1;0 0 0 4 -2];
b=[2 0 -2 -4 4]';
x=A\b

% We will not get an answer as the one part of Theorem 8.3 is not satisfied