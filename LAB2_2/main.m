% Author: Luca Moroni
%
% LAB 2 - 2 CNS Course: Hopfield Networks
%
% This file contains code necessary to complete the Assignment 1.

% Load the p0 image
p0 = csvread("lab2_2_data/p0.csv");

% Create the three distorted version of p0
d_0_1 = distort_image(p0, 0.05);
d_0_2 = distort_image(p0, 0.1);
d_0_3 = distort_image(p0, 0.25);

% Load the p1 image
p1 = csvread("lab2_2_data/p1.csv");

% Create the three distorted version of p1
d_1_1 = distort_image(p1, 0.05);
d_1_2 = distort_image(p1, 0.1);
d_1_3 = distort_image(p1, 0.25);

% Load the p2 image
p2 = csvread("lab2_2_data/p2.csv");

% Create the three distorted version of p2
d_2_1 = distort_image(p2, 0.05);
d_2_2 = distort_image(p2, 0.1);
d_2_3 = distort_image(p2, 0.25);

memory = [p0, p1, p2];

% compute the bias, with select_bias procedure a kind of model selection is
% done
% best_bias = select_bias(memory);
best_bias = 0;

% Pattern-0: distorsion 0.05
[xs, energies, overlaps, ~] = hopfieldnet(d_0_1, memory, 10, 1, best_bias);

% -- Plot the original Image
% imagesc(reshape(d_0_1, 32, 32));
% pause();

% - Plots for d_0_1
plots_for_pattern(xs, energies, overlaps, p0, "0_1")

% Pattern-0: distorsion 0.1

[xs, energies, overlaps, ~] = hopfieldnet(d_0_2, memory, 10, 1, best_bias);

% imagesc(reshape(d_0_2, 32, 32));
% pause();

% - Plots for d_0_2
plots_for_pattern(xs, energies, overlaps, p0, "0_2")

% Pattern-0: distorsion 0.25

[xs, energies, overlaps, ~] = hopfieldnet(d_0_3, memory, 10, 1, best_bias);

% imagesc(reshape(d_0_3, 32, 32));
% pause();

% - Plots for d_0_3
plots_for_pattern(xs, energies, overlaps, p0, "0_3")

% Pattern-1: distorsion 0.05

[xs, energies, overlaps, ~] = hopfieldnet(d_1_1, memory, 10, 1, best_bias);

% imagesc(reshape(d_1_1, 32, 32));
% pause();

% - Plots for d_1_1
plots_for_pattern(xs, energies, overlaps, p1, "1_1")

% Pattern-1: distorsion 0.1

[xs, energies, overlaps, ~] = hopfieldnet(d_1_2, memory, 10, 1, best_bias);

% imagesc(reshape(d_1_2, 32, 32));
% pause();

% - Plots for d_1_2
plots_for_pattern(xs, energies, overlaps, p1, "1_2")

% Pattern-1: distorsion 0.25

[xs, energies, overlaps, ~] = hopfieldnet(d_1_3, memory, 10, 1, best_bias);

% imagesc(reshape(d_1_3, 32, 32));
% pause();

% - Plots for d_1_3
plots_for_pattern(xs, energies, overlaps, p1, "1_3")

% Pattern-2: distorsion 0.05

[xs, energies, overlaps, ~] = hopfieldnet(d_2_1, memory, 10, 1, best_bias);

% imagesc(reshape(d_2_1, 32, 32));
% pause();

% - Plots for d_2_1
plots_for_pattern(xs, energies, overlaps, p2, "2_1")

% Pattern-2: distorsion 0.1

[xs, energies, overlaps, ~] = hopfieldnet(d_2_2, memory, 10, 1, best_bias);

% imagesc(reshape(d_2_2, 32, 32));
% pause();

% - Plots for d_2_2
plots_for_pattern(xs, energies, overlaps, p2, "2_2")

% Pattern-2: distorsion 0.25

[xs, energies, overlaps, ~] = hopfieldnet(d_2_3, memory, 10, 1, best_bias);

% imagesc(reshape(d_2_3, 32, 32));
% pause();

% - Plots for d_2_3
plots_for_pattern(xs, energies, overlaps, p2, "2_3")


function best_bias = select_bias(memory)
% Select the best bias given a memory patterns.
% 
% Arguments
%   - memory: matrix that contains the memory patterns.
%
% Returns
%   - bias: (float) the bias that best fits the memory patterns.

    best_bias = 0;
    best_err = inf;
    
    for bias_try = -1:0.3:1
        err = 0;
                
        for j = 1:size(memory, 2)
            mem = memory(:, j);
            
            [xs, ~, ~, ~] = hopfieldnet(distort_image(mem, 0.1), memory, 10, 1, bias_try);
            
            err = err + (sum(mem - xs(:, end)))^2/1024;
        end
                
        if err/size(memory, 2) < best_err
            best_bias = bias_try;
            best_err = err/size(memory, 2);
        end
        
    end
end

function plots_for_pattern(xs, energies, overlaps, optimal_memory, pattern_name)
% Utility function that plots all the required images for each input.

    % -- Plot of the energy function over time
    plot(energies);
    title("Energy function");
    % pause();
    f = gcf;
    exportgraphics(f, "images/distorted_"+pattern_name+"_energy.png", 'Resolution',300)

    % -- Plot the overlap computed for each one of the training patterns
    plot(overlaps');
    title("Overlaps during time");
    legend("Pattern 0", "Pattern 1", "Pattern 2");
    % pause();
    f = gcf;
    exportgraphics(f, "images/distorted_"+pattern_name+"_overlap.png", 'Resolution',300)

    % -- Plot the discrepancy
    imagesc(reshape(xs(:, end), 32, 32));
    err = (sum(optimal_memory - xs(:, end)))^2/1024;
    title("Reconstructed image, MSE with high overlap = " + err);
    f = gcf;
    exportgraphics(f, "images/distorted_"+pattern_name+"_reconstructed.png", 'Resolution',300)
    % pause();
end

