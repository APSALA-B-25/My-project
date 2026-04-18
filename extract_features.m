function features = extract_features(distance, signal)
    % EXTRACT_FEATURES - compute numeric features from OTDR trace
    distance = distance(:);
    signal = signal(:);

    % Statistical features
    features.Mean = mean(signal);
    features.StdDev = std(signal);
    features.Min = min(signal);
    features.Max = max(signal);
    features.Range = range(signal);
    features.Variance = var(signal);

    % Gradient-based features
    grads = diff(signal) ./ diff(distance);
    features.AvgSlope = mean(grads);
    features.MaxSlope = max(abs(grads));

    % Shape-based features
    features.Skewness = skewness(signal);
    features.Kurtosis = kurtosis(signal);

    % Fault location (minimum signal point)
    [~, idxMin] = min(signal);
    features.FaultLocationKM = distance(idxMin);
end
