% Author: Luca Moroni
%
% CNS Laboratory 2: Hebbian learning
% This file contains the execution of the learning for the learning modes:
% hebbian, oja, subtractive normalization, covariance, and BCM.
% The present file is the same as main.m but executed over the bonus track
% dataset 'dataset2_lab_2_1.csv'.
% 
% The parameters are chosen after a raw selection, taken the ones that
% bring decent results.

% -- load the dataset
data = table2array(readtable('dataset2_lab_2_1.csv'));

% normalize data, to avoid numerica unstable results and to plot a decent
% pictures
data = normalize(data, 2);

epochs = 20;
learning_rate = 0.01;
thr = 0.1;

% -- Hebb rule
learning_mode = "hebb";
 
[w_hebb, ws_hebb] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% save weights matrix
save("hebb_weights_2.mat", "ws_hebb")

% save figure
f = gcf;
exportgraphics(f, 'images/data2/'+learning_mode+'.png', 'Resolution',500);

% -- oja rule
learning_mode = "oja";

epochs = 20;
learning_rate = 0.01;
thr = 0.1;
alpha_oja = 0.1;

[w_oja, ws_oja] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, alpha_oja);

% save weights matrix
save("oja_weights_2.mat", "ws_oja")

% save figure
f = gcf;
exportgraphics(f, 'images/data2/'+learning_mode+'.png', 'Resolution',500);

% -- subtractive normalization rule
learning_mode = "sub-norm";
epochs = 10;
learning_rate = 0.001;
thr = 0.01;
alpha_oja = 0.1;

[w_sub_norm, ws_sub_norm] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% save weights matrix
save("sub_norm_weights_2.mat", "ws_sub_norm")

% save figure
f = gcf;
exportgraphics(f, 'images/data2/'+learning_mode+'.png', 'Resolution',500);

% -- covariance rule
learning_mode = "covariance";
epochs = 100;
learning_rate = 0.01;
thr = 0.1;

[w_covariance, ws_covariance] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, 1);

% save weights matrix
save("covariance_weights_2.mat", "ws_covariance")

% save figure
f = gcf;
exportgraphics(f, 'images/data2/'+learning_mode+'.png', 'Resolution',500);

% -- BCM rule
learning_mode = "bcm";
epochs = 10;
theta_v = 0;
learning_rate = 0.1;
thr = 0.1;

[w_bcm, ws_bcm] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, theta_v, learning_rate*2);

% save weights matrix
save("bcm_weights_2.mat", "ws_bcm")

% save figure
f = gcf;
exportgraphics(f, 'images/data2/'+learning_mode+'.png', 'Resolution',500);