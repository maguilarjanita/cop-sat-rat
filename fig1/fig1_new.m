% Figure 1: To be continued...

clear all
close all
addpath ~/Dropbox/bin/
%plotting_stuff;
tit={'(a)';'(b)';'(c)'};


hf=figure(6);
hf.Position=[1 1500 1100 700];

%%%% LEFT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s(1)=subplot(1,3,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=load('variaT_th0.000_S-1.0_m0.5_latt.dat');
t1=load('kc1kd1sig-3.dat');
in=load('variaT_th0.000_S-1.0_m0.5_sf.dat');

% Transform data for the plots
n(:,2) = (n(:, 2) - 0.5) / 0.5;
in(:,2)=(in(:, 2) - 0.5) / 0.5;

hp(1)=plot(n(:,2),n(:,3),'o','linewidth',2,'MarkerSize',4);
hold on
hp(2)=plot(t1(:,1),t1(:,2),'k-','linewidth',2);
ylim([-0.05 1.05]);
xlim([-5 7]);
t(1)=text(5.75,0.98,tit{1});

xlabel('$\tau$', 'Interpreter', 'latex');
ylabel('$p$', 'Interpreter', 'latex');
l(1)=legend('Simulation','Theory','Box','off','Location','north');

% % The inset %%%%%%%%%%%%%%%%%%%
ins(1)=axes('Position', [0.21 0.5 0.12 0.1]);
plot(in(:,2), in(:,3),'.','Color', [0, 0.5, 0],'MarkerSize',8)
li(1)=legend('Simulation SF','Box','off','Location','north','FontSize',12);
xlabel('$\tau$', 'Interpreter', 'latex','FontSize',15);
ylabel('$p$', 'Interpreter', 'latex','FontSize',15);
ylim([-0.05 1.05]);

%%% Middle %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s(2)=subplot(1,3,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = load('variaS_th0.000_T0.0_m0.5.dat');
in1= load('evol_th0.000_m0.50_S-1.2_T0.0_redux.dat');
in2 = load('evol_th0.000_m0.50_S0.8_T0.0_redux.dat');

% Main data transformation
n(:,1) = (n(:, 1) - 0.5) / 0.5;

% Plot main data-0.05
hp(2)=plot(n(:,1),n(:,3),'o','linewidth',2,'MarkerSize',4);
xlim([-4 1]);
ylim([0.930, 1.005]);
xlabel('$\sigma$', 'Interpreter', 'latex', 'FontSize', 12);
t(2)=text(0.5,0.995,tit{2});
set(s(2),'YTick',[0.94 1]);
%Inset 2
ins(2)=axes('Position', [0.45 0.5 0.08 0.09]); % Adjust position and size
plot(in1(:, 1), in1(:, 2),'.','Color', [0, 0.5, 0],'MarkerSize',4);
set(ins(2),'YTick',[0.94 1],'XTick',[0 400]);
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$p$', 'Interpreter', 'latex'); % Offset to match gnuplot

xlim([0, 400]);
ylim([0.930, 1.005]);

title('$\sigma$=-3.4','Interpreter', 'latex')


% % Inset 3
ins(3)=axes('Position', [0.57 0.5 0.08 0.09]);
plot(in2(:, 1), in2(:, 2),'.','Color', [0, 0.5, 0],'MarkerSize',6)
set(ins(3),'YTick',[0.99 1],'XTick',[0 1000]);
xlabel('$t$', 'Interpreter', 'latex');
title('$\sigma$=0.6','Interpreter', 'latex')
ylim([0.989, 1.001]);

%%%% Right %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s(3)=subplot(1,3,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n3 = load('variaS_th0.000_T2.0_m0.5_latt.dat');
t3 = load('kc1kd1tau3.dat');
i3= load('variaS_th0.000_T2.0_m0.5_sf.dat');

% Transform data for plots
n3(:,1) = (n3(:, 1) - 0.5) / 0.5;
i3(:,1)= (i3(:, 1) - 0.5) / 0.5;

% Plot main data
hp(3)=plot(n3(:,1),n3(:,3),'o','linewidth',2,'MarkerSize',4);
hold on
hp(4)=plot(t3(:,1),t3(:,2),'k-', 'LineWidth', 2);
xlim([-4, 1]);
ylim([-0.05 1.05]);
t(3)=text(0.5,0.95,tit{3});

% Main plot formatting
xlabel('$\sigma$', 'Interpreter', 'latex');
l(3)=legend('Simulation','Theory');
set(l(3),'Location','northwest')

%Inset4 
ins(4)=axes('Position', [0.75 0.5 0.12 0.1]); % Adjust position and size
plot(i3(:,1), i3(:,3),'.','Color', [0, 0.5, 0],'MarkerSize',6)
ylim([-0.005, 0.065]);
set(ins(4),'YTick',[0 0.06]);
li(4)=legend('Simulation SF','Box','off','Location','northwest','FontSize',12);
xlabel('$\tau$', 'Interpreter', 'latex','FontSize',14);
ylabel('$p$', 'Interpreter', 'latex','FontSize',14);


% % Panels edition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:3
s(i).FontSize=14;
s(i).FontName='Times';
s(i).PlotBoxAspectRatio=[1 0.7 1];
t(i).FontSize=14;
t(i).FontName='Times';
end

 l(1).IconColumnWidth=8;
 l(1).Box='off';
 l(1).FontSize=12;


 l(3).IconColumnWidth=8;
 l(3).Box='off';
 l(3).FontSize=12;


for i=1:4
ins(i).FontSize=12;
ins(i).FontName='Times';
end



s(1).Position=[0.12 0.11 0.25 0.9];
s(2).Position=[0.41 0.11 0.25 0.9];
s(3).Position=[0.70 0.11 0.25 0.9];

hf.Position=[1 1500 1100 700];

%%

fileout=sprintf("fig1.pdf");
%exportgraphics(hf,fileout,'Resolution',150);
