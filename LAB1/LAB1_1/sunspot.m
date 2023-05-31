% CNS Lab 1 Bonus-track
%
% Author: Luca Moroni
%
% This file contains the code needed to load the dataset,
% to search over parameters of the Liquid State Machine through a
% grid-search, and plot code.

% --- Load Dataset

load solar_dataset

solarTargets = cell2mat(solarTargets);

input_dataset = solarTargets(:, 1:end-1);
target_dataset = solarTargets(:, 2:end);

% --- Model Selection

% Grid search parameters
hidden_dims = [10, 50, 100]; % Dimension of the hidden layer, number of neurons
exc_percs = [0.80, 0.60, 0.40]; % Percentage of excitable neurons in the liquid
wInExcs = [2, 5, 7]; % Input scaling coefficients for excitable neurons
wInInhs = [1, 2, 3]; % Input scaling coefficients for inhibitory neurons
wRecExcs = [0.1, 0.5, 1]; % Recurrent scaling coefficients for excitable neurons
wRecInhs = [0.5, 1, 2]; % Recurrent scaling coefficients for inhibitory neurons

% create all the possible combinations
combinations = combvec(hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInhs);

best_valid_loss = inf;
best_valid_train_loss = NaN;
best_parameters = NaN;

disp("Starting Grid Search ...");

% model selection, train the liquid model over all the possible
% combinations
for c=1:size(combinations, 2)
    
    clc;
    fprintf("Model Selection Running %d|100 ... \n", (int8(c/size(combinations, 2)*100)));
    
    % get the actual combination
    hidden_dims = combinations(1, c);
    exc_percs = combinations(2, c);
    wInExcs = combinations(3, c);
    wInInhs = combinations(4, c);
    wRecExcs = combinations(5, c);
    wRecInh = combinations(6, c);
    
    % learn the liquid state machine
    results = learn_lsm(input_dataset, target_dataset, hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh, 0);
    
    % get the results
    mae_train = results(1);
    mae_valid = results(2); 
    
    if mae_valid < best_valid_loss
        best_valid_loss = mae_valid;
        best_valid_train_loss = mae_train;
        best_parameters = [hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh];
    end
end

disp("... Done!");

% --- Retrain over the best model

% TODO : save the best_parameters

hidden_dims = best_parameters(1);
exc_percs = best_parameters(2);
wInExcs = best_parameters(3);
wInInhs = best_parameters(4);
wRecExcs = best_parameters(5);
wRecInh = best_parameters(6);

fprintf("Best Parameters\nhidden_dims %d exc_percs %d wInExcs %d wInInhs %d wRecExcs %d wRecInh %d\n", hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh);
disp("Results of the model selection training...");
disp("Train MAE:");
disp(best_valid_train_loss);
disp("Valid MAE:");
disp(best_valid_loss);

results = learn_lsm(input_dataset, target_dataset, hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh, 1);

mae_train = results(1);
mae_valid = results(2); 
mae_test = results(3);

disp("Results of the final retraining...");
disp("Train MAE:");
disp(mae_train);
disp("Valid MAE:");
disp(mae_valid);
disp("Test MAE:");
disp(mae_test);

save("mae_train", "mae_train")
save("mae_valid", "mae_valid")
save("mae_test", "mae_test")

function results = learn_lsm(input_dataset, target_dataset, hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh, final_training)
    % Function that get an (input, target) dataset and a set of parameters
    % to learn a liquid state machine.
    
    input_states = liquidStateMachine(input_dataset, hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh);
    
    % train test split
    train_states = input_states(:, 1:int16(2398*0.7));
    train_target = target_dataset(:, 1:int16(2398*0.7));
    valid_states = input_states(:, int16(2398*0.7):2398);
    valid_target = target_dataset(:, int16(2398*0.7):2398);
    test_states = input_states(:, 2398:end);
    test_target = target_dataset(:, 2398:end);

    % learn the read-out layer
    Wout = train_target * pinv(train_states);

    results = [];
    
    train_output = Wout * train_states;
    results(end+1) = mae(train_output-train_target);
    
    valid_output = Wout * valid_states;
    results(end+1) = mae(valid_output-valid_target);
    
    if final_training
        test_output = Wout * test_states;
        results(end+1) = mae(test_output-test_target);
        
        % --- In the final retraining plot the figures
        
        plot(1:size(train_target, 2), train_target);
        hold on
        plot(1:size(train_output, 2), train_output);
        title("Train Predictions");
        hold off
        % pause();
        f = gcf;
        exportgraphics(f, 'images_lsm/Train_Predictions.png', 'Resolution', 500);

        plot(1:size(valid_target, 2), valid_target);
        hold on
        plot(1:size(valid_output, 2), valid_output);
        title("Valid Predictions");
        hold off
        % pause();
        f = gcf;
        exportgraphics(f, 'images_lsm/Valid_Predictions.png', 'Resolution', 500);

        plot(1:size(test_target, 2), test_target);
        hold on
        plot(1:size(test_output, 2), test_output);
        title("Test Predictions");
        hold off
        % pause();
        f = gcf;
        exportgraphics(f, 'images_lsm/Test_Predictions.png', 'Resolution', 500);
    end
end


