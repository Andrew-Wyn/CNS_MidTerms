% Hebbian learning

% -- load the dataset
data = table2array(readtable('lab2_1_data.csv'));

epochs = 10;
learning_rate = 0.1;
thr = 0.1;
alpha_oja = 0.1;
theta_v = 0;

% -- Hebb rule
learning_mode = "hebb";
 
% hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% -- oja rule
learning_mode = "oja";

% hebbian_learning(data, epochs, learning_rate, thr, learning_mode, alpha_oja);

% -- subtractive normalization rule
learning_mode = "sub-norm";

hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% -- covariance rule
learning_mode = "covariance";

% hebbian_learning(data, epochs, learning_rate, thr, learning_mode, 1);

% -- BCM rule
learning_mode = "bcm";

% hebbian_learning(data, epochs, learning_rate, thr, learning_mode, theta_v, learning_rate*2);