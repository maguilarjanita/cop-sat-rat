% Figure 3
clear all
close all


rgb=[    0.4660 0.6740 0.1880
    0.8500 0.3250 0.0980
    0 0.4470 0.7410   
    0.4940 0.1840 0.5560
    ];

hf=figure(1);

% Top plot
data1= load('top/variaT_th0.000_S-0.5_m0.5_latt.dat');
data2= load('top/kc-1kd-1sig-2.txt');
data3= load('top/variaT_th0.000_S-0.5_m0.5_sf.dat');
s(1)=subplot(2,2,1)
x=(data1(:,2)-0.5)/0.5;
hp(1)=plot(x, data1(:,3),'s','color',[rgb(1,:)],'MarkerFaceColor',[rgb(1,:)],'MarkerSize',5);
hold(s(1),'on');
hp(2)=plot(s(1),data2(:,1), data2(:,2), 'kx-');
axis(s(1),[min(x) max(x)*1.01 0 0.6]);
hleg(1)=legend(s(1),hp,{['Simulation' newline '(2D lattice)'];'Theory'},'location','northeast','box','off')
clear hp;

s(2)=subplot(2,2,2)
x=(data3(:,2)-0.5)/0.5;
hp=plot(s(2), x,data3(:,3),'+','color',[rgb(1,:)],'MarkerSize',2)%,'linewidth',1.5);
s(2).Position=[0.17 0.65 0.12 0.15]
axis(s(2),[min(x) max(x)*1.02 0.2 0.6]);
s(2).XTick=[-4:2:6];
s(2).XTickLabel=[-4:2:6];

hleg(2)=legend(s(2),hp,'Simulation (SF)','location','northeast','box','off')
clear hp;
%%
% Bottom plot
data1 = load('bottom/variaS_th0.000_T-0.5_m0.5_latt.dat');
data2 = load('bottom/kc-1kd-1tau-2.txt');
data3 = load('bottom/variaS_th0.000_T-0.5_m0.5_sf.dat');

s(3)=subplot(2,2,3)
x=(data1(:,1)-0.5)/0.5;
hp(1)=plot(s(3),x, data1(:,3),'s','color',[rgb(1,:)],'MarkerFaceColor',[rgb(1,:)],'MarkerSize',5);
hold(s(3),'on');
hp(2)=plot(s(3),data2(:,1), data2(:,2), 'kx-');
axis(s(3),[-2 1 0.3 0.6])
hleg(3)=legend(s(3),hp,{['Simulation' newline '(2D lattice)'];'Theory'},'location','southeast','box','off')
clear hp;

s(4)=subplot(2,2,4)
x=(data3(:,1)-0.5)/0.5;
hp=plot(s(4),x, data3(:,3),'+','color',[rgb(1,:)],'MarkerSize',2);
s(4).Position=[0.18 0.5 0.12 0.15]
axis(s(4),[-2 1 0.47 0.6]);
s(4).XTick=[-5:1:1];
s(4).XTickLabel=[-5:1:1];

hleg(4)=legend(s(4),hp,'Simulation (SF)','location','northwest','box','off')
clear hp;

xlab={'$\tau$';'$\tau$';'$\sigma$';'$\sigma$'};
tit={'(a)';'';'(b)';''}
posx=[-4.5 0 -1.9 0];
posy=[0.56 0 0.58 0];
for i=1:4
    % if(i==1 || i==3)
    % s(i).Title.String=tit{i};
    % s(i).Title.FontSize=18;
    % end
    s(i).FontName='Times';
    if(i==1 || i==3)
    s(i).FontSize=16;
    ht=text(s(i),posx(i),posy(i),tit{i});
    ht.FontSize=18;
    ht.FontName='Times'
    
    else
       s(i).FontSize=12; 
    end
    s(i).YLabel.String='$p$';
    s(i).XLabel.String=xlab{i};
    s(i).YLabel.Interpreter='latex';
    s(i).XLabel.Interpreter='latex'

end

pos=s(3).Position
pos(2)=0.15;
s(3).Position=pos;
pos=s(4).Position;
pos(2)=0.21;
s(4).Position=pos;
hf.Position=[1 1 950 600];

fileout=sprintf("fig3.pdf");
exportgraphics(hf,fileout,'Resolution',150);