clear all
close all
clc
format short

rng(98765); %seed

X = rand(500,2)*10; %uniform distribution over interval 

A = X'*X; % Transpose A

ReA = reshape(A,[4 1]); % Reshape matrix to specified size

Q4 = ceil(ReA); % FLoor function for each element in ReA

disp(Q4);