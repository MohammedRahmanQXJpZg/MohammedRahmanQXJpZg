clear all
close all
clc
format short

rng(98765); %Seed

A = rand(20,3)*5; %Uniform Dsn

w = normrnd(0,1,[3,1]); %Normal Dsn

[Q5a Q5b] = prodfunc(A,w); %Set function output

function [Q5a Q5b] = prodfunc(A,w) %Define FUnction
        Q5a = A*w 
        Q5b = [size(A), size(w), size(Q5a)] %Arrange dimensions into matrix 
end
