%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vehicle Control Engineering Homework 1 Exercise 3
% Author: kangan Qian (2020310535)
% Date: 2023-10-13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% clean
clc;clear;close all
%% Known Parameters
Ms = 1250; %kg
Ks = 44000; %N/m
Cs = 4000; %kg/s
Mu = 200; %kg
Ku = 400000; %N/m
Cu = 50; %kg/s

figure(1)
bode_fig(Ms,Ks,Cs,Mu,Ku,Cu,'Ms')
bode_fig(1.1*Ms,Ks,Cs,Mu,Ku,Cu,'Ms')
bode_fig(0.9*Ms,Ks,Cs,Mu,Ku,Cu,'Ms')

figure(2)
bode_fig(Ms,Ks,Cs,Mu,Ku,Cu,'Ks')
bode_fig(Ms,1.1*Ks,Cs,Mu,Ku,Cu,'Ks')
bode_fig(Ms,0.9*Ks,Cs,Mu,Ku,Cu,'Ks')

figure(3)
bode_fig(Ms,Ks,Cs,Mu,Ku,Cu,'Cs')
bode_fig(Ms,Ks,1.1*Cs,Mu,Ku,Cu,'Cs')
bode_fig(Ms,Ks,0.9*Cs,Mu,Ku,Cu,'Cs')

function bode_fig(Ms,Ks,Cs,Mu,Ku,Cu,filename)
% Known parameter
% Ms=1250;
% Ks=44000;
% Cs=4000;
% Mu=200;
% Ku=400000;
% Cu=50;

num=[Cu*Cs,Cs*Ku+Cu*Ks,Ku*Ks];
den=[Mu*Ms,Ms*(Cu+Cs)+Mu*Cs,Ms*(Ku+Ks)+Cu*Cs+Ks*Mu,Cs*Ku+Cu*Ks,Ku*Ks];
H=tf(num,den);


hold on;

bode(H)
legend([filename],['1.1*',filename],['0.9*',filename])

end
