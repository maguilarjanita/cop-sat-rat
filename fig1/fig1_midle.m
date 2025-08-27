% Load data files
%s(2)=subplot(1,3,2)

n = load('variaS_th0.000_T0.0_m0.5.dat');
i1 = load('evol_th0.000_m0.50_S0.8_T0.0_redux.dat');
i2= load('evol_th0.000_m0.50_S-1.2_T0.0_redux.dat');

% Main data transformation
n(:,1) = (n(:, 1) - 0.5) / 0.5;
hold on;

% Plot main data
plot(n(:,1),n(:,3), 'LineWidth', 2, 'Color', [0, 0.5, 0], 'DisplayName', 'Simulation');

% Main plot formatting
ylim([0.97, 1.002]);
xlabel('$\sigma$', 'Interpreter', 'latex');
ylabel('$p$', 'Interpreter', 'latex');
title('$\tau=-1$', 'Interpreter', 'latex', 'FontSize', 12);
legend('Location', 'northeast', 'Box', 'off', 'FontSize', 10);


%Inset 1
in2(1)=axes('Position', [0.2, 0.4, 0.15, 0.25]); % Adjust position and size
hold on;

% Plot inset 2 data
plot(i2(:, 1), in2(:, 2), 'LineWidth', 2, 'Color', [0, 0.5, 0]);

% Inset 2 formatting
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$p$', 'Interpreter', 'latex', 'Position', [-40, 0.94]); % Offset to match gnuplot
title('$\sigma=-3.4$', 'Interpreter', 'latex', 'FontSize', 10);
xlim([0, 400]);
ylim([0.930, 1.001]);
set(gca, 'XTick', 0:200:400, 'YTick', 0.05:0.05:1.001, 'FontSize', 8);


% Inset 1
in2(2)=axes('Position', [0.7 0.45 0.15 0.25]);
hold on;

plot(in1(:, 1), in1(:, 2), 'LineWidth', 2, 'Color', [0, 0.5, 0]);

xlabel('$t$', 'Interpreter', 'latex');
ylabel('$p$', 'Interpreter', 'latex', 'Position', [-40, 0.92]); % Offset to match gnuplot
title('$\sigma=0.6$', 'Interpreter', 'latex', 'FontSize', 10);
set(gca, 'YTick', 0.01:0.01:0.04, 'FontSize', 8);
