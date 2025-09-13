function run_demo()
close all; clc;
if ~exist('data','dir'), mkdir data; end
if ~exist('results','dir'), mkdir results; end
% Your script expects PC_RADAR_OBS.csv in CWD
run('scripts/original_residual_dashboard.m');
saveas(gcf, fullfile('results','residual_accuracy_dashboard.png'));
disp('Saved results/residual_accuracy_dashboard.png');
end
