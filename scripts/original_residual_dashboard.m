% Load the CSV file
data = readtable('PC_RADAR_OBS.csv');

% Extract the required variables from the table
azimuthResidual = data.(data.Properties.VariableNames{8});
elevationResidual = data.(data.Properties.VariableNames{9});
rangeResidual = data.(data.Properties.VariableNames{10});
rangeRateResidual = data.(data.Properties.VariableNames{11}) * 1000;  % Convert km/sec to m/sec

% Calculate bias, sigma, and RMS for azimuth using residual data points
azimuthResidualBias = mean(azimuthResidual);
azimuthResidualSigma = std(azimuthResidual);
azimuthResidualRMS = sqrt(mean(azimuthResidual.^2));

% Calculate bias, sigma, and RMS for elevation using residual data points
elevationResidualBias = mean(elevationResidual);
elevationResidualSigma = std(elevationResidual);
elevationResidualRMS = sqrt(mean(elevationResidual.^2));

% Calculate bias, sigma, and RMS for range using residual data points
rangeResidualBias = mean(rangeResidual);
rangeResidualSigma = std(rangeResidual);
rangeResidualRMS = sqrt(mean(rangeResidual.^2));

% Calculate bias, sigma, and RMS for range rate using residual data points
rangeRateResidualBias = mean(rangeRateResidual);
rangeRateResidualSigma = std(rangeRateResidual);
rangeRateResidualRMS = sqrt(mean(rangeRateResidual.^2));

% Create figures for azimuth, elevation, range, and range rate accuracy using residual data points
figure;

% Azimuth Accuracy
subplot(2, 2, 1);
histogram(azimuthResidual);
hold on;
title('Azimuth Accuracy - (SENID = 393)');
xlabel('Azimuth (deg)');
ylabel('Count');
legend('Azimuth Data', 'Location', 'NorthEast');
text(0.1, 0.9, ['\mu = ', num2str(azimuthResidualBias, '%.6f')], 'Units', 'normalized');
text(0.1, 0.85, ['\sigma = ', num2str(azimuthResidualSigma, '%.6f')], 'Units', 'normalized');
text(0.1, 0.8, ['rms = ', num2str(azimuthResidualRMS, '%.6f')], 'Units', 'normalized');
withinThreshold = sum(abs(azimuthResidual) <= 0.04);
totalDataPoints = numel(azimuthResidual);
percentageWithinThreshold = (withinThreshold / totalDataPoints) * 100;
text(0.1, 0.75, ['Within 0.04 deg: ', num2str(percentageWithinThreshold, '%.2f'), '%'], 'Units', 'normalized');

% Elevation Accuracy
subplot(2, 2, 2);
histogram(elevationResidual);
hold on;
title('Elevation Accuracy - (SENID = 393)');
xlabel('Elevation (deg)');
ylabel('Count');
legend('Elevation Data', 'Location', 'NorthEast');
text(0.1, 0.9, ['\mu = ', num2str(elevationResidualBias, '%.6f')], 'Units', 'normalized');
text(0.1, 0.85, ['\sigma = ', num2str(elevationResidualSigma, '%.6f')], 'Units', 'normalized');
text(0.1, 0.8, ['rms = ', num2str(elevationResidualRMS, '%.6f')], 'Units', 'normalized');
withinThreshold = sum(abs(elevationResidual) <= 0.04);
totalDataPoints = numel(elevationResidual);
percentageWithinThreshold = (withinThreshold / totalDataPoints) * 100;
text(0.1, 0.75, ['Within 0.04 deg: ', num2str(percentageWithinThreshold, '%.2f'), '%'], 'Units', 'normalized');

% Range Accuracy
subplot(2, 2, 3);
histogram(rangeResidual);
hold on;
title('Range Accuracy - (SENID = 393)');
xlabel('Range (km)');
ylabel('Count');
legend('Range Data', 'Location', 'NorthEast');
text(0.1, 0.9, ['\mu = ', num2str(rangeResidualBias, '%.6f')], 'Units', 'normalized');
text(0.1, 0.85, ['\sigma = ', num2str(rangeResidualSigma, '%.6f')], 'Units', 'normalized');
text(0.1, 0.8, ['rms = ', num2str(rangeResidualRMS, '%.6f')], 'Units', 'normalized');
withinThreshold = sum(abs(rangeResidual) <= 0.03);
totalDataPoints = numel(rangeResidual);
percentageWithinThreshold = (withinThreshold / totalDataPoints) * 100;
text(0.1, 0.75, ['Within 0.03 km: ', num2str(percentageWithinThreshold, '%.2f'), '%'], 'Units', 'normalized');

% Range Rate Accuracy
subplot(2, 2, 4);
histogram(rangeRateResidual);
hold on;
title('Range Rate Accuracy - (SENID = 393)');
xlabel('Range Rate (m/sec)');
ylabel('Count');
legend('Range Rate Data', 'Location', 'NorthEast');
text(0.1, 0.9, ['\mu = ', num2str(rangeRateResidualBias, '%.9f')], 'Units', 'normalized');
text(0.1, 0.85, ['\sigma = ', num2str(rangeRateResidualSigma, '%.9f')], 'Units', 'normalized');
text(0.1, 0.8, ['rms = ', num2str(rangeRateResidualRMS, '%.9f')], 'Units', 'normalized');
withinThreshold = sum(abs(rangeRateResidual) <= 2);
totalDataPoints = numel(rangeRateResidual);
percentageWithinThreshold = (withinThreshold / totalDataPoints) * 100;
text(0.1, 0.75, ['Within 2 m/sec: ', num2str(percentageWithinThreshold, '%.2f'), '%'], 'Units', 'normalized');

% Adjust the figure layout
set(gcf, 'Position', [100, 100, 1200, 800]);
subplot(2, 2, 1);
ylim([0, max(histcounts(azimuthResidual))]);
subplot(2, 2, 2);
ylim([0, max(histcounts(elevationResidual))]);
subplot(2, 2, 3);
ylim([0, max(histcounts(rangeResidual))]);
subplot(2, 2, 4);
ylim([0, max(histcounts(rangeRateResidual))]);
