% Parameters
numCells = 10;              % Number of base stations
numUEs = 200;                % Number of user equipment (UE) per cell
numSubcarriers = 64;       % Number of subcarriers
massiveMIMONumAntennas = 64; % Number of antennas for Massive MIMO (base station)
numReceiveAntennas = 4;    % Number of antennas at the user equipment
nrSampleRate = 30.72e6;    % Sample rate for 5G NR
snrNR = 25;                % Signal-to-Noise Ratio for 5G NR (in dB)
speedHigh = 120;           % User speed for high mobility (in km/h)
fc = 3.5e9;                % Carrier frequency (3.5 GHz for 5G NR)

% Calculate Doppler shift for high-speed mobility
c = physconst('lightspeed'); % Speed of light in m/s
maxDopplerShiftHigh = (speedHigh * 1000 / 3600) / c * fc; % Doppler shift in Hz

% Initialize data storage
multi_cell_csi = cell(numCells, numUEs); % CSI storage for all cells and UEs

% Function to add AWGN to the CSI
addNoise = @(csi, snr) awgn(csi, snr, 'measured');

fprintf('Processing progress:\n');
totalIterations = numCells * numUEs;
iterationCounter = 0; % Counter to track progress
startTime = datetime('now'); % Start time

%% Massive MIMO Scenarios
for cellIdx = 1:numCells
    for ueIdx = 1:numUEs
        % Update progress
        iterationCounter = iterationCounter + 1;
        elapsedTime = seconds(datetime('now') - startTime);
        itemsPerSecond = iterationCounter / elapsedTime;

        % Display progress with timestamp and items per second
        fprintf('\r[%s] Progress: %.2f%% (%d/%d) | %.2f items/sec', ...
            datestr(datetime('now')), ...
            (iterationCounter / totalIterations) * 100, ...
            iterationCounter, ...
            totalIterations, ...
            itemsPerSecond);

        % Define Massive MIMO channel model for different scenarios

        % Scenario 1: Stationary UE with standard TDL-A
        channel_stationary = nrTDLChannel(...
            'DelayProfile', 'TDL-A', ...
            'DelaySpread', 100e-9, ...
            'NumTransmitAntennas', massiveMIMONumAntennas, ...
            'NumReceiveAntennas', numReceiveAntennas, ...
            'SampleRate', nrSampleRate);

        % Scenario 2: High-speed UE (e.g., car moving at high speed)
        channel_high_speed = nrTDLChannel(...
            'DelayProfile', 'TDL-C', ...
            'DelaySpread', 300e-9, ...
            'MaximumDopplerShift', maxDopplerShiftHigh, ... % Simulate high-speed mobility
            'NumTransmitAntennas', massiveMIMONumAntennas, ...
            'NumReceiveAntennas', numReceiveAntennas, ...
            'SampleRate', nrSampleRate);

        % Scenario 3: Urban Macrocell with longer delay spread
        channel_urban_macro = nrTDLChannel(...
            'DelayProfile', 'TDL-D', ...
            'DelaySpread', 500e-9, ...
            'NumTransmitAntennas', massiveMIMONumAntennas, ...
            'NumReceiveAntennas', numReceiveAntennas, ...
            'SampleRate', nrSampleRate);

        % Generate CSI for each subcarrier in each scenario
        scenarios = {channel_stationary, channel_high_speed, channel_urban_macro};
        csi_scenarios = cell(1, numel(scenarios)); % Store CSI for all scenarios

        for scenarioIdx = 1:numel(scenarios)
            channel = scenarios{scenarioIdx};
            csi = zeros(numSubcarriers, massiveMIMONumAntennas, numReceiveAntennas); % Subcarrier x Tx x Rx
            dummySignal = complex(eye(massiveMIMONumAntennas)); % Identity matrix to simulate MIMO transmission

            % Generate path gains for each subcarrier
            for subcarrierIdx = 1:numSubcarriers
                [pathGains, ~] = channel(dummySignal); % Output: [numTransmitAntennas x numReceiveAntennas]
                reshapedPathGains = pathGains; % Direct assignment as pathGains matches [Tx x Rx]
                csi(subcarrierIdx, :, :) = reshapedPathGains; % Assign to CSI matrix
            end

            % Add noise to the channel
            noisyCsi = addNoise(csi, snrNR);

            % Store noisy CSI for the scenario
            csi_scenarios{scenarioIdx} = noisyCsi;
        end

        % Store all scenarios for the given cell and UE
        multi_cell_csi{cellIdx, ueIdx} = csi_scenarios;
    end
end

%% Save All Data to a Single MAT File
save('foundation_model_data/csi_data_massive_mimo.mat', ...
    'multi_cell_csi');



