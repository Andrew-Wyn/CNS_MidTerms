% Hebbian learning

% -- load the dataset
data = table2array(readtable('lab2_1_data.csv'));

epochs = 100;
learning_rate = 0.00001;
thr = 0.1;
alpha_oja = 0.1;
theta_v = 0.00000001;

% -- Hebb rule
learning_mode = "hebb";

%hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, theta_v, learning_mode);

% -- oja rule
learning_mode = "oja";

%hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, theta_v, learning_mode);

% -- subtractive normalization rule
learning_mode = "sub-norm";

%hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, theta_v, learning_mode);

% -- covariance rule
learning_mode = "covariance";

% hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, theta_v, learning_mode);

% -- BCM rule
learning_mode = "bcm";

% hebbian_learning(data, epochs, learning_rate, thr, alpha_oja, theta_v, learning_mode);