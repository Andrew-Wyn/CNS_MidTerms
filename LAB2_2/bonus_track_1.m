% Author: Luca Moroni
%
% LAB 2 - 2 CNS Course: Hopfield Networks
%
% This file contains code necessary to complete the bonus track Assignment 1 - Synthetic data.

% load the data
p1 = [-1, -1, +1, -1, +1, -1, -1, +1]';

p2 = [-1, -1, -1, -1, -1, +1, -1, -1]';

p3 = [-1, +1, +1, -1, -1, +1, -1, +1]';

% define the memory
memory = [p1, p2, p3];

% set the bias to 0 as requested
bias = 0;

% --- check if all the memory's elements can be retrieved
ex1 = distort_image(p1, 0.05);

[~, energies, overlaps, ~] = hopfieldnet(ex1, memory, 10, 1, bias);

plot(energies);
title("ex1: Energy function");
% pause();

plot(overlaps');
title("ex1: Overlaps during time");
legend("pattern 1", "pattern 2", "pattern 3");
% pause();

ex2 = distort_image(p2, 0.05);

[~, energies, overlaps, ~] = hopfieldnet(ex2, memory, 10, 1, bias);

plot(energies);
title("ex2: Energy function");
% pause();

plot(overlaps');
title("ex2: Overlaps during time");
legend();
% pause();

ex3 = distort_image(p3, 0.05);

[~, energies, overlaps, ~] = hopfieldnet(ex3, memory, 10, 1, bias);

plot(energies);
title("ex3: Energy function");
% pause();

plot(overlaps');
title("ex3: Overlaps during time");
legend();
% pause();

% seems that can the model cannot retrieve every time the right pattern in
% memory given the distorted version of the input. But if we use a low
% value of distorsion p=5% so the model can retrieve the right
% configurations.

% P1 ex

% 1)
p1d=[+1, -1, +1, -1, +1, -1, -1, +1]';

[~, energies, overlaps, activations_1] = hopfieldnet(p1d, memory, 10, 1, bias);

% plot energies
plot(energies);
title("P1D: Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_1_energy.png', 'Resolution',300)

% plot overlaps
plot(overlaps');
title("P1D: Overlaps during time");
legend("pattern 1", "pattern 2", "pattern 3");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_1_overlaps.png', 'Resolution',300)

% plot activations 
imagesc(activations_1);
colormap(hot(256));
title("P1D: Neuron activations");
xlabel("time steps");
ylabel("neurons' activation probabilities");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_1_activations.png', 'Resolution',300)

% save activations
save("activation_P1_1.mat", "activations_1")

% 2)
p2d=[+1, +1, -1, -1, -1, +1, -1, -1]';

[~, energies, overlaps, activations_2] = hopfieldnet(p2d, memory, 10, 1, bias);

% plot energies
plot(energies);
title("P2D: Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_2_energy.png', 'Resolution', 300)

% plot overlaps
plot(overlaps');
title("P2D: Overlaps during time");
legend("pattern 1", "pattern 2", "pattern 3");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_2_overlaps.png', 'Resolution', 300)

% plot activations
imagesc(activations_2);
colormap(hot(256));
title("P2D: Neuron activations");
xlabel("time steps");
ylabel("neurons' activation probabilities");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_2_activations.png', 'Resolution', 300)

% save activations
save("activation_P1_2.mat", "activations_2")

% 3)
p3d=[+1, +1, +1, -1, +1, +1, -1, +1]';

[~, energies, overlaps, activations_3] = hopfieldnet(p3d, memory, 10, 1, bias);

% plot energies
plot(energies);
title("P3D: Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_3_energy.png', 'Resolution',300)

% plot overlaps
plot(overlaps');
title("P3D: Overlaps during time");
legend("pattern 1", "pattern 2", "pattern 3");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_3_overlaps.png', 'Resolution',300)

% plot activations
imagesc(activations_3);
colormap(hot(256));
title("P3D: Neuron activations");
xlabel("time steps");
ylabel("neurons' activation probabilities");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_3_activations.png', 'Resolution',300)

% save activations
save("activation_P1_3.mat", "activations_3")


% doent's seems that the model can retrieve the correspective memeory
% pattern.