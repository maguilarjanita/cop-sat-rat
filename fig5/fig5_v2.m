% Figure 5
clear all
close all
addpath ~/Dropbox/irene/bin/matlab


rgb=[0.4940 0.1840 0.5560     
    0.4660 0.6740 0.1880
    0.3010 0.7450 0.9330
     0.9290 0.6940 0.1250
    ];
sym='+x*s';
lin={':';'--';'-';'-.'};
titles={'(a)' '(b)' '(c)' '(d)';'(e)' '(f)' '(g)' '(h)'};
fs=10;
mks=3;

hf=figure(1);
hf.Position=[1 1500 1400 750];

s(1)=subplot(2,3,1)
t=[0 0.02 0.1 0.5];
for i=1:length(t)
    filename=sprintf('varia_rho_ini/Lattice/varia_rhoi_s-2t-2_t%s.dat',num2str(t(i)));
    dum=importdata(filename);
    data=dum.data;
 
    
hp(i)=plot(data(:,1), data(:,2),sym(i),'color',[rgb(i,:)],'markersize',mks);
hold(s(1),'on');
end
for i=5:8
      filename=sprintf('varia_rho_ini/Lattice/kc1kd1sig-2tau-2th%s.txt',num2str(t(i-4)));    
    dateor=load(filename);
    hp(i)=plot(s(1),dateor(:,1),dateor(:,2),'linestyle',lin{i-4},'color',[rgb(i-4,:)],'linewidth',1.5)
end

leg=strcat({'$\theta='},num2str(t'),'$');
leg=cellstr(leg);
theor={'Theory';'  ';'  ';'  '};
leg=[leg;theor];
hleg{1}=legend(s(1),hp,leg,'interpreter','latex','NumColumns',2);
s(1).YLim=[-0.05 1.05]


s(2)=subplot(2,3,4)
for i=1:length(t)
    filename=sprintf('varia_rho_ini/SF/varia_rhoi_s-2t-2_t%s.dat',num2str(t(i)));
    dum=importdata(filename);
    data=dum.data;
   
hp(i)=plot(data(:,1), data(:,2),sym(i),'color',[rgb(i,:)],'markersize',mks);
hold(s(2),'on');
end
clear dum;

leg=strcat({'$\theta='},num2str(t'),'$');
leg=cellstr(leg);
hleg{2}=legend(s(2),hp,leg,'interpreter','latex')
s(2).YLim=[-0.05 1.05]

%%% Sigma variation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
s(3)=subplot(2,3,2)
t=[0. 0.02 0.1 0.5];
for i=1:length(t)
    filename=sprintf('varia_sigma/Lattice/variaS_th%1.3f_T1.5_m0.5.dat',t(i));
    data=importdata(filename);
    data(:,1)=(data(:,1)-0.5)/0.5;
  
       
%hp(i)=plot(data(:,1), data(:,3),sym(i),'color',[rgb(i,:)],'markersize',3);
sh(i)=shadedErrorBar(data(:,1),data(:,3),data(:,4),'transparent',true,'patchSaturation',0.4); 
%sh(i).mainLine.LineWidth = 0.1;
sh(i).mainLine.LineStyle='none';
sh(i).mainLine.Color = rgb(i,:);
sh(i).mainLine.Marker = sym(i)
sh(i).mainLine.MarkerSize=mks;
sh(i).patch.FaceColor = rgb(i,:); 
sh(i).edge(1).LineStyle="none"
sh(i).edge(2).LineStyle="none"


 hold(s(3),'on');

end

for i=5:8
       filename=sprintf('varia_sigma/Lattice/kc1kd-1tau2th%sp0.1.txt',num2str(t(i-4)));
    dateor=load(filename);
        hp(i)=plot(s(3),dateor(:,1),dateor(:,2),'linestyle',lin{i-4},'color',[rgb(i-4,:)],'linewidth',1)

end


%leg={'$\sigma=2\tau=0.5$';'$\sigma=2\tau=-0.5$';'$\sigma=-2\tau=-2$';'$\sigma=-2\tau=2$'};
hleg{3}=legend(s(3),hp,leg,'interpreter','latex')

leg=strcat({'$\theta='},num2str(t'),'$');
leg=cellstr(leg);
theor={'Theory';'  ';'   ';'   '};
leg=[leg;theor];
hleg{3}=legend(s(3),hp,leg,'interpreter','latex','NumColumns',2);
s(3).YLim=[0.25 0.95];
s(3).Box='on';
s(3).XLim=[-2.9 2.9];




s(4)=subplot(2,3,5)
for i=1:length(t)
    filename=sprintf('varia_sigma/SF/variaS_th%1.3f_T1.5_m0.5.dat',t(i));
    data=importdata(filename);
    data(:,1)=(data(:,1)-0.5)/0.5;
    
%hp(i)=plot(data(:,1), data(:,3),sym(i),'color',[rgb(i,:)],'markersize',3);
sh(i)=shadedErrorBar(data(:,1),data(:,3),data(:,4),'transparent',true,'patchSaturation',0.4); 
%sh(i).mainLine.LineWidth = 0.1;
sh(i).mainLine.LineStyle='none';
sh(i).mainLine.Color = rgb(i,:);
sh(i).mainLine.Marker = sym(i)
sh(i).mainLine.MarkerSize=mks;
sh(i).patch.FaceColor = rgb(i,:); 
sh(i).edge(1).LineStyle="none"
sh(i).edge(2).LineStyle="none"

hold(s(4),'on');
  plot(dateor(:,1),dateor(:,2),'-','color',[rgb(i,:)],'linewidth',1.5)
    % pause

end
leg=strcat({'$\theta='},num2str(t'),'$');
leg=cellstr(leg);
hleg{4}=legend(s(4),hp,leg,'interpreter','latex')
s(4).XLim=[-3 3];
s(4).YLim=[0.25 0.95];
s(4).Box='on'
%%% Theta variation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s(5)=subplot(2,3,3)
par={'2t0.5';'2t-0.5';'-2t-2';'-2t2'};
parr={'sig2tau0.5';'sig2tau-0.5';'sig-2tau-2';'sig-2tau2'};
k=1;
for i=1:length(par)
    filename=sprintf('varia_theta/Lattice/varia_theta_s%s.dat',par{i});
    dum=importdata(filename);
    data=dum.data;
     

hp(i)=plot(data(:,1), data(:,2),sym(i),'color',[rgb(i,:)],'markersize',mks);
hold(s(5),'on');
end
for i=5:8
     filename=sprintf('varia_theta/Lattice/kc1kd1%sp0.1.txt',parr{i-4});
    dateor=load(filename);
    hp(i)=plot(s(5),dateor(:,1),dateor(:,2),'linestyle',lin{i-4},'color',[rgb(i-4,:)],'linewidth',1)
end
leg={'$\sigma=2, \tau=0.5$';'$\sigma=2, \tau=-0.5$';'$\sigma=-2, \tau=-2$';'$\sigma=-2, \tau=2$';'Theory';'  ';'  ';'  '};
leg=cellstr(leg);
hleg{5}=legend(s(5),hp,leg,'interpreter','latex','NumColumns',2);
s(5).YLim=[-0.05 1.05];

s(6)=subplot(2,3,6)
for i=1:length(t)
    filename=sprintf('varia_theta/SF/varia_theta_s%s.dat',par{i});
    dum=importdata(filename);
    data=dum.data;    
hp(i)=plot(data(:,1), data(:,2),sym(i),'color',[rgb(i,:)],'markersize',mks);

hold(s(6),'on');
end
leg={'$\sigma=2, \tau=0.5$';'$\sigma=2, \tau=-0.5$';'$\sigma=-2, \tau=-2$';'$\sigma=-2, \tau=2$'};
hleg{6}=legend(s(6),hp,leg,'interpreter','latex')
s(6).YLim=[-0.05 1.05];


% Formatting
xlab={'$p_0$';'$p_0$';'$\sigma$';'$\sigma$';'$\theta$';'$\theta$'};
tit={'(a)';'(b)';'(c)';'(d)';'(e)';'(f)'};
posx=[0.88 0.88 2.3 2.3 0.89 0.89];
posy=[0.045 0.045 0.31 0.31 0.045 0.045];


for i=1:6
    s(i).FontSize=18;
    s(i).FontName='Times';
    s(i).XLabel.String=xlab{i};
    s(i).XLabel.Interpreter='latex';
     s(i).YLabel.String='$p$';
        s(i).YLabel.Interpreter='latex';
    hleg{i}.Box='off';
    hleg{i}.FontSize=12;
    hleg{i}.IconColumnWidth =20;
    ht=text(s(i),posx(i),posy(i),tit{i});
    ht.FontSize=16;
    ht.FontName='Times';
    

    if(i==1|| i==2)
        hleg{i}.Box='on';
        hleg{i}.EdgeColor='w';       
    end
    if(i==5||i==6)
    hleg{i}.Location='northeast';
    else
    hleg{i}.Location='northwest';    
    end
    if(i==2|| i==4||i==6)
        pos=s(i).Position;
        pos(2)=0.21;
        s(i).Position=pos;
    end
    if(i==3|| i==4)
       pos=s(i).Position;
       pos(1)=0.39;
       s(i).Position=pos;
    end
    if(i==5|| i==6)
        pos=s(i).Position;
       pos(1)=0.65;
       s(i).Position=pos;
    end
    hleg{i}.FontSize=14;

end

 % hleg{3}.FontSize=12;
 % hleg{5}.FontSize=12;

for i=[1 3 5]
s(i).XTick='';
s(i).XLabel.String='';
end

for i=[3:6]
s(i).YLabel.String='';
end

for i=[5:6]
s(i).YTick=[0 0.5 1];
end

for i=[3:4]
s(i).YTick=[0.3 0.5 0.7 0.9];
end

% for i=1:6
%     s(i).FontSize=14;
%     s(i).FontName='Times';
%     s(i).XLabel.String=xlab{i};
%     s(i).XLabel.Interpreter='latex';
%      s(i).YLabel.String='$p$';


%fileout=sprintf("fig5_c5.pdf");
fileout=sprintf("fig5new.pdf");
exportgraphics(hf,fileout,'Resolution',150);