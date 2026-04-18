function predict_fault(selectedFault)
    % PREDICT_FAULT - Simulate and classify a fiber fault using trained model

    if nargin < 1 || isempty(selectedFault)
        error('Fault type must be provided.');
    end

    if ~isfile('trainedModel.mat')
        error('trainedModel.mat not found. Run train_model first.');
    end

    % Load model
    S = load('trainedModel.mat', 'model');
    model = S.model;

    % Use selected fault directly
    testFault = selectedFault;
    fprintf('Selected Fault Type: %s\n', testFault);

    % Generate trace and extract features
    [distance, signal] = generate_traces(testFault);
    feats = extract_features(distance, signal);
    featTable = struct2table(feats);

    % Align predictors
    predictorNames = model.PredictorNames;
    featTable = featTable(:, predictorNames);

    % Predict
    predictedLabel = predict(model, featTable);
    fprintf('Predicted Fault Type: %s\n', string(predictedLabel));

    % Plot OTDR result
    figure('Name','OTDR Prediction','NumberTitle','off');
    plot(distance, signal, 'b', 'LineWidth', 1.5);
    hold on;
    [~, idxMin] = min(signal);
    fk = distance(idxMin);
    plot(fk, signal(idxMin), 'ro', 'MarkerFaceColor','r', 'MarkerSize', 8);
    xlabel('Distance (km)');
    ylabel('Signal (dB)');
    title(sprintf('True: %s  |  Predicted: %s  |  Fault @ %.2f km', ...
                   testFault, string(predictedLabel), fk));
    grid on;
    hold off;
end
