% Hebbian learning

% -- load the dataset
data = table2array(readtable('dataset2_lab_2_1.csv'));

% normalize data
data = normalize(data, 2);

epochs = 10;
learning_rate = 0.2;
thr = 0.01;

% -- Hebb rule
learning_mode = "hebb";
 
% hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% -- oja rule
learning_mode = "oja";

epochs = 20;
learning_rate = 0.01;
thr = 0.01;
alpha_oja = 0.1;

% hebbian_learning(data, epochs, learning_rate, thr, learning_mode, alpha_oja);

% -- subtractive normalization rule
learning_mode = "sub-norm";
epochs = 10;
learning_rate = 0.001;
thr = 0.01;
alpha_oja = 0.1;

% hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% -- covariance rule
learning_mode = "covariance";
epochs = 100;
learning_rate = 0.0000001;
thr = 0.01;

hebbian_learning(data, epochs, learning_rate, thr, learning_mode, 1);

% -- BCM rule
learning_mode = "bcm";

hebbian_learning(data, epochs, learning_rate, thr, learning_mode, theta_v, learning_rate*2);