% Load data
main_data = load('variaT_th0.000_S-1.0_m0.5_latt.dat');
theory_data = load('kc1kd1sig-3.dat');
inset_data = load('variaT_th0.000_S-1.0_m0.5_sf.dat');

% Transform data for the plots
main_x = (main_data(:, 2) - 0.5) / 0.5;
main_y = main_data(:, 3);
theory_x = theory_data(:, 1);
theory_y = theory_data(:, 2);

inset_x = (inset_data(:, 2) - 0.5) / 0.5;
inset_y = inset_data(:, 3);

% Set up the main figure
h1=figure(1)
hold on

% Plot main data
plot(main_x, main_y,'o-')
plot(theory_x, theory_y,'-')

% Set axis properties
xlim([min(main_x), max(main_x)]);


% Adjust margins (similar to gnuplot's tmargin, bmargin, etc.)
set(gca, 'Position', [0.12, 0.1, 0.75, 0.85]); % Adjusted for gnuplot margins

% Create the inset
axes('Position', [0.4, 0.3, 0.47, 0.55]); % [left, bottom, width, height]
hold on;

% Plot inset data
plot(inset_x, inset_y, 'LineWidth', 2, 'Color', [0, 0.5, 0], ...
    'DisplayName', 'Simulation');

% Adjust inset properties
xlim([min(inset_x), max(inset_x)]);
ylim([min(inset_y), max(inset_y)]);
set(gca, 'FontSize', 10); % Match the font size for the inset
legend('show', 'FontSize', 10, 'Location', 'northeast');
set(gca, 'Box', 'on'); % Add box around the inset
xticks([]); % Remove x-tick labels
yticks([]); % Remove y-tick labels
xlabel('');
ylabel('');

% Finalize the figure
hold off;