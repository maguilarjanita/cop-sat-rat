%%% Figure 4 

t = load('raster_top.dat'); % Assuming 'raster.dat' contains a 2D array
b = load('raster_bot.dat'); % Assuming 'raster.dat' contains a 2D array

for i=1:length(r)
T(r(i,1)+1,r(i,2)+1)=t(i,3);
B(r(i,1)+1,r(i,2)+1)=b(i,3);
end

fs=12;
hf=figure(4);

s(1)=subplot(121)
s(1).Position=[0.1600 0.1100 0.3 0.8]
imagesc(T')
xlabel('index', 'Interpreter', 'latex', 'FontSize', fs,'FontName','Times');
ylabel('$t$', 'Interpreter', 'latex', 'FontSize', fs,'FontName','Times');
set(s(1),'YTick',[1 1000 2000],'YTickLabel',[0 1000 2000],'FontSize',fs,'FontName','Times');
title('(a)', 'Interpreter', 'latex', 'FontSize', fs,'FontName','Times');

s(2)=subplot(122)
s(2).Position=[0.5 0.1100 0.3 0.8]
imagesc(B')
xlabel('index', 'Interpreter', 'latex', 'FontSize', fs,'FontName','Times');
set(s(2),'YTick',[],'FontSize',fs,'FontName','Times');
title('(b)', 'Interpreter', 'latex', 'FontSize', fs,'FontName','Times');


colormap(parula(2))
cb=colorbar;
cb.Position=[0.83 0.1100 0.02 0.79]
cb.Ticks=[0.05 0.95];
cb.TickLabels=[0 1]
set(cb,'FontSize',fs,'FontName','Times')

%%

fileout=sprintf("fig4.pdf");
exportgraphics(hf,fileout,'Resolution',150);
