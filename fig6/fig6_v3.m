clear all

fs=16
hf=figure(6)
clf
hf.Position=[680 1538 450 280]

rgb=[0 0 0
    0.8500 0.3250 0.0980
    0 0.4470 0.7410
    0.4660 0.6740 0.1880
     0.9290 0.6940 0.1250
     0.3010 0.7450 0.9330
    0.6350 0.0780 0.1840   
    0.4940 0.1840 0.5560  
    ];
sym={'.';'s';'*'}

% Load the data
net1={'MF';'k4';'k10'};
net2={'MF';'SF \langlek\rangle=4';'SF \langlek\rangle=10'};
steor={'varia_theta_MF_ri';'kc1kd1sig-2tau-2p';'k10kc1kd1sig-2tau-2p'};
p0s={'0';'0.5';'1'};
p0=[0 0.5 1];
lin={'--';':';'-'};
for i=1:length(net1)
    for j=1:length(p0)
filename=sprintf('varia_theta_%s_ri%s.dat',net1{i},p0s{j})
data=load(filename);
if i==1
 h(i)=plot(data(:,1),data(:,2),sym{i},'linestyle',lin{j},'color',rgb(i,:),'linewidth',1.),hold on
else
h(i)=plot(data(:,1),data(:,2),sym{i},'color',rgb(i,:),'linewidth',1.),hold on
end
leg{i}=sprintf('%s',net2{i});
end
end

for i=2:3
for j=1:length(p0)
    filename=sprintf('%s%s.txt',steor{i},p0s{j});
    teor=load(filename);    
    % if i==1
    %     y=smooth(teor(:,2));
    % else
        y=teor(:,2);
    %end
    h(i+2)=plot(teor(:,1),y,'linestyle',lin{j},'color',rgb(i,:),'linewidth',1),hold on
    leg{i+2}=sprintf('%s theory',net2{i});
end
end

xlim([0 0.25]);
ylim([-0.05 1.05]);
% Set the axis labels
xlabel('$\theta$', 'Interpreter', 'latex','FontSize',fs);
ylabel('$p$', 'Interpreter', 'latex','FontSize',fs);
lg=legend(h,leg,'NumColumns',1);
lg.Box='off';
lg.IconColumnWidth =22;
lg.FontSize=12;
set(gca,'FontName','Times','FontSize',14)
 
% %%
% 
fileout=sprintf("fig6v3_theory.pdf");
exportgraphics(hf,fileout,'Resolution',150);
