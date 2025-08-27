% Load data
clearvars
n3 = load('variaS_th0.000_T2.0_m0.5_latt.dat');
t3 = load('kc1kd1tau3.dat');
i3= load('variaS_th0.000_T2.0_m0.5_sf.dat');

% Transform data for plots
n3(:,1) = (n3(:, 1) - 0.5) / 0.5;
i3(:,1)= (i3(:, 1) - 0.5) / 0.5;

% Plot main data
plot(n3(:,1),n3(:,3),'o')
hold on
plot(t3(:,1),t3(:,2),'k-', 'LineWidth', 1, 'DisplayName', 'Theory');

% Main plot formatting
xlim([-4, 1]);
%ylim([-0.005, max([main_y; theory_y])]);
xlabel('$\sigma$', 'Interpreter', 'latex');
ylabel('$p$', 'Interpreter', 'latex');
title('$\tau=3$', 'Interpreter', 'latex', 'FontSize', 12);
legend('Location', 'north', 'Orientation', 'horizontal', 'Box', 'off', 'FontSize', 10);

% Inset plot
inset3=axes('Position', [0.23, 0.27, 0.47, 0.55]); % Adjust position and size
hold on;

% Plot inset data
plot(i3(:,1), i3(:,3), 'LineWidth', 2, 'Color', [0, 0.5, 0], 'DisplayName', 'Simulation');

% Inset plot formatting
ylim([-0.001, 0.07]);
xlabel('');
ylabel('');
set(gca, 'FontSize', 10); % Adjust font size for inset
legend('show', 'FontSize', 10, 'Location', 'northeast', 'Box', 'off');

