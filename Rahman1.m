clear all
close all
clc
format short

rng(98765); %seed

normat = normrnd(5,3,[15 15]); %normally distrubited matrix 

seq= 5:5:75; %sequence of 5-75

mq1=diag(normat).*seq; %diagonal multiplication 

Q1=sum(mq1(:)); %Scalar sum of matrix 

disp(Q1);