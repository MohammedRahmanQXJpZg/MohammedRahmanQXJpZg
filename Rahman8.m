clear all
close all
clc
format short

data=xlsread('dataQ8.xlsx','Sheet1','C6:ABX250'); %Read data

Missdata=standardizeMissing(data,999999); %Insert Missing Values

Q8a=nanmean(Missdata(:,75)); %Average ignoring NaN

Filldata=fillmissing(Missdata,"constant",-888888); %Fill all missing values
Q8b=mean(Filldata(:,100)); %Mean of filled data

disp(Q8a);
disp(Q8b);