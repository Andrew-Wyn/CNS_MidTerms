% Author: Luca Moroni
%
% CNS Laboratory 2: Hebbian learning
% This file contains the execution of the learning for the learning modes:
% hebbian, oja, subtractive normalization, covariance, and BCM.
% 
% The parameters are chosen after a raw selection, taken the ones that
% bring decent results.

% -- load the dataset
data = table2array(readtable('lab2_1_data.csv'));

epochs = 10;
learning_rate = 0.1;
thr = 0.1;
alpha_oja = 0.1; % parameter for the oja learning rule
theta_v = 0; % parameter for the BCM learning rule

% -- Hebb rule
learning_mode = "hebb";
 
[w_hebb, ws_hebb] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% save weights matrix
save("hebb_weights.mat", "ws_hebb")

% save figure
f = gcf;
exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',500);

% -- oja rule
learning_mode = "oja";

[w_oja, ws_oja] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, alpha_oja);

% save weights matrix
save("oja_weights.mat", "ws_oja")

% save figure
f = gcf;
exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',500);

% -- subtractive normalization rule
learning_mode = "sub-norm";

[w_sub_norm, ws_sub_norm] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode);

% save weights matrix
save("sub_norm_weights.mat", "ws_sub_norm")

% save figure
f = gcf;
exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',500);

% -- covariance rule
learning_mode = "covariance";

% the last parameter indicate the computation of the average vs as step to
% be done previous the learning computation.
[w_covariance, ws_covariance] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, 1);

% save weights matrix
save("covariance_weights.mat", "ws_covariance")

% save figure
f = gcf;
exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',500);

% -- BCM rule
learning_mode = "bcm";

[w_bcm, ws_bcm] = hebbian_learning(data, epochs, learning_rate, thr, learning_mode, theta_v, learning_rate*2);

% save weights matrix
save("bcm_weights.mat", "ws_bcm")

% save figure
f = gcf;
exportgraphics(f, 'images/data1/'+learning_mode+'.png', 'Resolution',500);