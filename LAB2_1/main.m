% Hebbian learning

% -- load the dataset
data = table2array(readtable('lab2_1_data.csv'));

epochs = 10;
learning_rate = 0.01;
thr = 0.1;
alpha_oja = 0.1;

% -- Hebb rule
learning_mode = "hebb";

hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, learning_mode);

% -- oja rule
learning_mode = "oja";

hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, learning_mode);

% -- subtractive normalization rule
learning_mode = "sub-norm";

hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, learning_mode);