
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
 
[w_hebb, ws_hebb] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode);
f = gcf;
exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',300);

% -- oja rule
learning_mode = "oja";

%[w_oja, ws_oja] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, alpha_oja);
%f = gcf;
%exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',300);

% -- subtractive normalization rule
learning_mode = "sub-norm";

%[w_sub_norm, ws_sub_norm] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode);
%f = gcf;
%exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',300);

% -- covariance rule
learning_mode = "covariance";

% [w_covariance, ws_covariance] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, 1);
%f = gcf;
%exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',300);

% -- BCM rule
learning_mode = "bcm";

% [w_bcm, ws_bcm] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, theta_v, learning_rate*2);
%f = gcf;
%exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',300);