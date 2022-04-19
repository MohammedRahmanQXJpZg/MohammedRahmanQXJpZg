clear all
close all
clc
format short

rng(98765); %seed 

mq2=normrnd(2,4,[100,1]); %normally dist matrix of size 100X1

zq2=zeros(100,1); %create vector of zeroes to append

for i=1:1:100 % iterae i from 1 to 100
    if mq2(i,1)>6 %cond statement
       zq2(i,1)=i %cond statement output 
    end
end

Q2=sum(zq2); %sum column vector 

disp(Q2);
