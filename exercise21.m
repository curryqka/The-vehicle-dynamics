 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vehicle Control Engineering Homework 1 Exercise 1
% Author: Kangan Qian (2020310535)
% Date: 2023-10-13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% clean
clear;clc;close all
%% DATA LOAD
load('./Data/data_A2B_test1.mat')
load('./Data/data_A2B_test2.mat')
load('./Data/data_A2B_test3.mat')
load('./Data/data_A2B_test4.mat')
load('./Data/data_B2A_test1.mat')
load('./Data/data_B2A_test2.mat')
load('./Data/data_B2A_test3.mat')
load('./Data/data_B2A_test4.mat')

%% fit and figure
%upward A->B
u=data_A2B_test1(:,2);
a=data_A2B_test1(:,3);
pn1=polyfit(a,u.^2,1)


figure(1)
fit_vis(a,u,pn1,'A2B_1')


u=data_A2B_test2(:,2);
a=data_A2B_test2(:,3);
pn2=polyfit(a,u.^2,1)

figure(2)
fit_vis(a,u,pn2,'A2B_2')


u=data_A2B_test3(:,2);
a=data_A2B_test3(:,3);
pn3=polyfit(a,u.^2,1)

figure(3)
fit_vis(a,u,pn3,'A2B_3')


u=data_A2B_test4(:,2);
a=data_A2B_test4(:,3);
pn4=polyfit(a,u.^2,1)

figure(4)
fit_vis(a,u,pn4,'A2B_4')

%downward B->A

u=data_B2A_test1(:,2);
a=data_B2A_test1(:,3);
pn5=polyfit(a,u.^2,1)

figure(5)
fit_vis(a,u,pn5,'B2A_1')

u=data_B2A_test2(:,2);
a=data_B2A_test2(:,3);
pn6=polyfit(a,u.^2,1)

figure(6)
fit_vis(a,u,pn6,'B2A_2')

u=data_B2A_test3(:,2);
a=data_B2A_test3(:,3);
pn7=polyfit(a,u.^2,1)

figure(7)
fit_vis(a,u,pn7,'B2A_3')

u=data_B2A_test4(:,2);
a=data_B2A_test4(:,3);
pn8=polyfit(a,u.^2,1)

figure(8)
fit_vis(a,u,pn8,'B2A_4')

%% plot fit function
function fit_vis(x,y,pn,filename)

% figure parameter
% h = figure;
lw = 2;
h = figure
purple_m = [0.49 0.18 0.56];
blue_m = [0 0.45 0.74];
red_m = [0.85 0.33 0.1];
green_m = [124 187 0]/255;

y_1 = [x ones(length(y),1)];
plot(x, y.^2, 'o', 'MarkerFaceColor', green_m,'MarkerEdgeColor', green_m, 'MarkerSize',2)
hold on
plot(x, y_1*pn', 'color', red_m, linewidth = lw)
grid on
set(gca,'gridlinestyle','--','Gridalpha',0.1);

% 返回坐标轴
ax = gca ;
ax.LineWidth = 1.5;
ax.FontSize = 13;
xlabel ('a(m/s^2)')
ylabel ('u^2(m^2/s^2)')

saveas(h,['.\figures\fig',filename ...
    ,'.png'])

end