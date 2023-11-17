 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vehicle Control Engineering Homework 1 Exercise 2
% Author: Kangan Qian (2020310535)
% Date: 2023-10-13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% clean
clc;clear;close all

%% (1)Draw the step response of lateral speed and yaw rate
u = 20;
[t,U,Y] = cal_model(u);
figure(1)
plot_sr(t,U,Y)

u = 50;
[t,U,Y] = cal_model(u);
figure(2)
plot_sr(t,U,Y)

%% (2) Derive the natural frequence and damping rate
% Known Paremeters
m = 1818; %kg
u = 20;
Izz = 3885; %kgm^2
a = 1.463; %m
b = 1.585; %m
k1 = -62618; %N/rad
k2 = -110185; %N/rad

%syms k1 k2 m u a b Izz;
%syms Izz;

% fig u
figure(3)
u_temp = 2:0.1:100;
cal_nf_and_dr(m,u_temp,Izz,a,b,k1,k2,'u')

figure(4)
Izz_temp = 2000:0.1:5000;
cal_nf_and_dr(m,u,Izz_temp,a,b,k1,k2,'Izz')

figure(5)
k1_temp = -80000:0.1:-50000;
cal_nf_and_dr(m,u,Izz,a,b,k1_temp,k2,'k1')
%% Cal model
function [t,U,Y] = cal_model(u)
%% Known Parameters
m = 1818; %kg
Izz = 3885; %kgm^2
a = 1.463; %m
b = 1.585; %m
k1 = -62618; %N/rad
k2 = -110185; %N/rad

A = [(k1+k2)/(m*u), (a*k1-b*k2)/(m*u)-u;
      (a*k1-b*k2)/(Izz*u), (a^2*k1+b^2*k2)/(Izz*u)];
B = [k1/m;k1*a/Izz];
C_lat = [1 0]; D_lat = 0;
C_yaw = [0 1]; D_yaw = 0;

C = [C_lat;C_yaw]; D = [D_lat;D_yaw];

t0 = 20;dt = 0.01;
front_wheel_angle = 10; %deg
t = [0:dt:t0];
U = [zeros(1,t0/dt/4),ones(1,3*t0/dt/4+1)]/180*pi*front_wheel_angle;
Y = lsim(A,B,C,D,U,t);
end

%% plot step response
function plot_sr(t,U,Y)
subplot(3,1,1)
plot(t,U*180/pi,'LineWidth',1.5)
% axis([0,10,-0.2,1.2])
% axis([0 15 -2 front_wheel_angle+2])
ax = gca;
ax.LineWidth = 1.5;
ax.FontSize = 13;
ylabel('Steering angle(deg)')
grid on

subplot(3,1,2)
plot(t,Y(:,1),'LineWidth',1.5)
% axis([0,10,-2,6])
% axis([0 15 -0.4 1])
ax = gca;
ax.LineWidth = 1.5;
ax.FontSize = 13;
ylabel('Lat. speed(m/s)')
grid on

subplot(3,1,3)
plot(t,Y(:,2)*180/pi,'LineWidth',1.5)
% axis([0,10,-4,0.5])
% axis([0 15 -40 5])
ax = gca;
ax.LineWidth = 1.5;
ax.FontSize = 13;
xlabel('time/s')
ylabel('Yaw rate(deg/s)')
grid on

end

function cal_nf_and_dr(m,u,Izz,a,b,k1,k2,x)
% m = 1818; %kg
% Izz = 3885; %kgm^2
% a = 1.463; %m
% b = 1.585; %m
% k1 = -62618; %N/rad
% k2 = -110185; %N/rad

M = m*u*Izz;
h = -(m*(a^2*k1 + b^2*k2) + Izz*(k1+k2));

c = m*u*(a*k1 - b*k2)-(a*k1-b*k2).^2./u + (k1 + k2).*(a^2*k1 + b^2*k2)./u;
natural_frequency = sqrt(c./M);
damping_rate = h./(2*natural_frequency.*M);

lw = 2;
yyaxis left
plot(eval(x),natural_frequency,'LineWidth',lw)
ylabel('Natural Frequency(Hz)(\omega_0)');

yyaxis right
plot(eval(x),damping_rate,'LineWidth',lw)
ylabel('Damping Rate(\zeta)');

if x == 'u'
    unit = '(m/s)';
elseif strcmp(x,'Izz')
    unit = '(kg/m^2)';
elseif strcmp(x,'k1')
    unit = '(N/rad)';
else
end

xlabel([x ,unit])
ax = gca;
ax.LineWidth = 1.5;
ax.FontSize = 13;

grid on 
set(gca,'gridlinestyle','--','Gridalpha',0.1);
legend('Natural Frequency(Hz)(\omega_0)','Damping Rate(\zeta)')
end

