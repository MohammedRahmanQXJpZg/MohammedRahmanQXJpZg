clear all
close all
clc
format short

rng(98765); %seed

means=[2 3]; %Means in matrix form

sigmas=[350 300; 300 800]; %Sigma in matrix form 

pairs=mvnrnd(means,sigmas,100); %Multivariate pairs 100x2

Q3=cov(pairs(:,1),pairs(:,2)); %Generate Varaince-Covariance Matrix 

disp(Q3);