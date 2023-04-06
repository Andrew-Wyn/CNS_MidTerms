p0 = csvread("lab2_2_data/p0.csv");

d_0_1 = distort_image(p0, 0.05);
d_0_2 = distort_image(p0, 0.1);
d_0_3 = distort_image(p0, 0.25);


p1 = csvread("lab2_2_data/p1.csv");

d_1_1 = distort_image(p1, 0.05);
d_1_2 = distort_image(p1, 0.1);
d_1_3 = distort_image(p1, 0.25);


p2 = csvread("lab2_2_data/p2.csv");

d_2_1 = distort_image(p2, 0.05);
d_2_2 = distort_image(p2, 0.1);
d_2_3 = distort_image(p2, 0.25);

memory = [p0, p1, p2];

% 0: distorsion 0.05

[xs, energies, overlaps, ~] = hopfieldnet(d_0_1, memory, 10);

imagesc(reshape(d_0_1, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_0_1_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_0_1_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_0_1))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_0_1_reconstructed.png', 'Resolution',300)

% 0: distorsion 0.1

[xs, energies, overlaps, ~] = hopfieldnet(d_0_2, memory, 10);

imagesc(reshape(d_0_2, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_0_2_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_0_2_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_0_2))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_0_2_reconstructed.png', 'Resolution',300)


% 0: distorsion 0.25

[xs, energies, overlaps, ~] = hopfieldnet(d_0_3, memory, 10);

imagesc(reshape(d_0_3, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_0_3_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_0_3_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_0_1))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_0_3_reconstructed.png', 'Resolution',300)

% 0: distorsion 0.05

[xs, energies, overlaps, ~] = hopfieldnet(d_1_1, memory, 10);

imagesc(reshape(d_1_1, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_1_1_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_1_1_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_1_1))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_1_1_reconstructed.png', 'Resolution',300)

% 0: distorsion 0.1

[xs, energies, overlaps, ~] = hopfieldnet(d_1_2, memory, 10);

imagesc(reshape(d_1_2, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_1_2_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_1_2_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_1_2))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_1_2_reconstructed.png', 'Resolution',300)


% 0: distorsion 0.25

[xs, energies, overlaps, ~] = hopfieldnet(d_1_3, memory, 10);

imagesc(reshape(d_1_3, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_1_3_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_1_3_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_1_3))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_1_3_reconstructed.png', 'Resolution',300)


% 0: distorsion 0.05

[xs, energies, overlaps, ~] = hopfieldnet(d_2_1, memory, 10);

imagesc(reshape(d_2_1, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_2_1_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_2_1_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_2_1))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_2_1_reconstructed.png', 'Resolution',300)

% 0: distorsion 0.1

[xs, energies, overlaps, ~] = hopfieldnet(d_2_2, memory, 10);

imagesc(reshape(d_2_2, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_2_2_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_2_2_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_2_2))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_2_2_reconstructed.png', 'Resolution',300)


% 0: distorsion 0.25

[xs, energies, overlaps, ~] = hopfieldnet(d_2_3, memory, 10);

imagesc(reshape(d_2_3, 32, 32));
% pause();

plot(energies);
title("Energy function");
% pause();
f = gcf;
exportgraphics(f, 'images/distorted_2_3_energy.png', 'Resolution',300)

plot(overlaps');
title("Overlaps during time");
legend();
% % pause();
f = gcf;
exportgraphics(f, 'images/distorted_2_3_overlap.png', 'Resolution',300)

[~, argmax] = max(overlaps(:, end));

disp(argmax);

imagesc(reshape(xs(:, end), 32, 32));
err = (sum(memory(argmax) - d_2_3))^2/1024;
title("Reconstructed image, MSE with high overlap = " + err);
f = gcf;
exportgraphics(f, 'images/distorted_2_3_reconstructed.png', 'Resolution',300)

