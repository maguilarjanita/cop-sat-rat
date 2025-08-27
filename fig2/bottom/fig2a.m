% Configuración de la figura
figure;
set(gcf, 'PaperPosition', [0 0 7.2 5]); % tamaño de la figura
set(gcf, 'Color', 'w'); % color de fondo blanco

% Configuración de los márgenes
set(gca, 'Position', [0.12 0.12 0.83 0.83]); % márgenes

% Configuración de los ejes
ylim([0.5 1.05]);
ylabel('\Large{$p$}', 'Interpreter', 'latex');
xlabel('\Large{$\sigma$}', 'Interpreter', 'latex');
title('$\tau=-1$', 'Interpreter', 'latex', 'Position', [0.5, 0.5, 0]);

% Primer gráfico
hold on;
data1 = load('variaS_th0.000_T0.0_m0.5_latt.dat');
plot((data1(:,1)-0.5)/0.5, data1(:,3), 'p', 'MarkerSize', 10, 'Color', [0 0.5 0], 'DisplayName', 'Simulation');

data2 = load('kc1kd-1tau-1.txt');
plot(data2(:,1), data2(:,2), '-k', 'LineWidth', 1, 'DisplayName', 'Theory');

legend('Location', 'best');
hold off;

% Segundo gráfico (inset)
axes('Position', [0.23 0.27 0.47 0.55]);
hold on;
data3 = load('variaS_th0.000_T0.0_m0.5_sf.dat');
plot((data3(:,1)-0.5)/0.5, data3(:,3), 'p', 'LineWidth', 4, 'Color', [0 0.5 0], 'DisplayName', '$\tau=-1$');
legend('FontSize', 10, 'Location', 'best');
hold off;
