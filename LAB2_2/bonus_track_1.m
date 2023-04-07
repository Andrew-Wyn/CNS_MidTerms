p1 = [-1, -1, +1, -1, +1, -1, -1, +1]';

p2 = [-1, -1, -1, -1, -1, +1, -1, -1]';

p3 = [-1, +1, +1, -1, -1, +1, -1, +1]';

memory = [p1, p2, p3];

% --- check if all the memory's elements can be retrieved
ex1 = distort_image(p1, 0.3);

[~, energies, overlaps, ~] = hopfieldnet(ex1, memory, 10, 1);

plot(energies);
title("ex1: Energy function");
% pause();

plot(overlaps');
title("ex1: Overlaps during time");
legend();
% pause();

ex2 = distort_image(p2, 0.3);

[~, energies, overlaps, ~] = hopfieldnet(ex2, memory, 10, 1);

plot(energies);
title("ex2: Energy function");
% pause();

plot(overlaps');
title("ex2: Overlaps during time");
legend();
% pause();

ex3 = distort_image(p3, 0.3);

[~, energies, overlaps, ~] = hopfieldnet(ex3, memory, 10, 1);

plot(energies);
title("ex3: Energy function");
% pause();

plot(overlaps');
title("ex3: Overlaps during time");
legend();
% pause();

% seems that can store only two patterns

% P1 ex

p1d=[+1, -1, +1, -1, +1, -1, -1, +1]';

[~, energies, overlaps, activations_1] = hopfieldnet(p1d, memory, 10, 1);

plot(energies);
title("P1D: Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_1_energy.png', 'Resolution',300)

plot(overlaps');
title("P1D: Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_1_overlaps.png', 'Resolution',300)

plot(activations_1');
title("P1D: Neuron activations");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_1_activations.png', 'Resolution',300)

p2d=[+1, +1, -1, -1, -1, +1, -1, -1]';

[~, energies, overlaps, activations_2] = hopfieldnet(p2d, memory, 10, 1);

plot(energies);
title("P2D: Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_2_overlaps.png', 'Resolution',300)

plot(overlaps');
title("P2D: Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_2_overlaps.png', 'Resolution',300)

plot(activations_2');
title("P2D: Neuron activations");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_2_activations.png', 'Resolution',300)

p3d=[+1, +1, +1, -1, +1, +1, -1, +1]';

[~, energies, overlaps, activations_3] = hopfieldnet(p3d, memory, 10, 1);

plot(energies);
title("P3D: Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_3_energy.png', 'Resolution',300)

plot(overlaps');
title("P3D: Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_3_overlaps.png', 'Resolution',300)

plot(activations_3');
title("P3D: Neuron activations");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_1_3_activations.png', 'Resolution',300)