load solar_dataset

solarTargets = cell2mat(solarTargets);

input_dataset = solarTargets(:, 1:end-1);
target_dataset = solarTargets(:, 2:end);

% Grid search parameters
hidden_dims = [10, 50, 100];
exc_percs = [0.80, 0.60, 0.40];
wInExcs = [2, 5, 7];
wInInhs = [1, 2, 3];
wRecExcs = [0.1, 0.5, 1];
wRecInhs = [0.5, 1, 2];

combinations = combvec(hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInhs);

% model selection
for c=1:size(combinations, 2)
    
    hidden_dims = combinations(1, c);
    exc_percs = combinations(2, c);
    wInExcs = combinations(3, c);
    wInInhs = combinations(4, c);
    wRecExcs = combinations(5, c);
    wRecInh = combinations(6, c);
        
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

    train_output = Wout * train_states;
    valid_output = Wout * valid_states;
    test_output = Wout * test_states;
    
    fprintf("hidden_dims %d exc_percs %d wInExcs %d wInInhs %d wRecExcs %d wRecInh %d\n", hidden_dims, exc_percs, wInExcs, wInInhs, wRecExcs, wRecInh);

    disp(mae(train_output-train_target));
    disp(mae(valid_output-valid_target));
    disp(mae(test_output-test_target));
    
    disp("----");

end

plot(1:size(train_target, 2), train_target);
hold on
plot(1:size(train_output, 2), train_output);
hold off

pause();

plot(1:size(valid_target, 2), valid_target);
hold on
plot(1:size(valid_output, 2), valid_output);
hold off

pause();

plot(1:size(test_target, 2), test_target);
hold on
plot(1:size(test_output, 2), test_output);
hold off

pause();


