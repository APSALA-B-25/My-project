function [distance, signal, faultLocation, isFaultDetected] = generate_traces(faultType)
% GENERATE_TRACES - Simulate OTDR signal for various fiber fault types
% Inputs:
%   faultType: 'Normal', 'Cut', 'Bend', or 'Splice'
%
% Outputs:
%   distance - distance vector (km)
%   signal   - simulated backscattered power (dB)
%   faultLocation - index of fault (for plotting)
%   isFaultDetected - true if a fault was simulated

    % Parameters
    distance = linspace(0, 10, 1000);  % 10 km fiber
    baseSignal = -0.2 * distance;      % normal attenuation (dB/km)
    noise = 0.05 * randn(size(distance));
    signal = baseSignal + noise;       % baseline with noise

    % Default values
    faultLocation = [];
    isFaultDetected = false;

    % Introduce fault based on type
    switch lower(faultType)
        case 'normal'
            % No fault in this case
            isFaultDetected = false;

        case 'cut'
            faultLocation = randi([200 900]);
            signal(faultLocation:end) = signal(faultLocation) - 10; % sudden drop
            isFaultDetected = true;

        case 'bend'
            faultLocation = randi([200 900]);
            rangeEnd = min(faultLocation + 20, length(signal));
            signal(faultLocation:rangeEnd) = signal(faultLocation:rangeEnd) - 3;
            isFaultDetected = true;

        case 'splice'
            faultLocation = randi([200 900]);
            rangeEnd = min(faultLocation + 10, length(signal));
            signal(faultLocation:rangeEnd) = signal(faultLocation:rangeEnd) - 1.5;
            isFaultDetected = true;

        otherwise
            error('Unknown fault type. Use Normal, Cut, Bend, or Splice.');
    end
end
