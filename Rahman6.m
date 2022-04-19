clear all
close all
clc
format short

rng(98765); %Seed

normat = normrnd(2,5, [250 1]); %normally ditributed matrix
unimat = -10+(10+10)*rand(250,1); %uniform distrubtion 

figure("Color","yellow");  %Set figure and colour 
scatter(unimat,normat,"black",'filled'); %Scatter plot
title('Scatter plot of X/Y'); 
xlabel('uniform distribution');
ylabel('normal distribution');
h1 = lsline();  %Fit line of best fit
h1.Color = 'r'; %Colour Line of best fit
