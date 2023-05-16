% Load the ten digits

p0 = csvread("lab2_2_alldigits/p0.csv");
p1 = csvread("lab2_2_alldigits/p1.csv");
p2 = csvread("lab2_2_alldigits/p2.csv");
p3 = csvread("lab2_2_alldigits/p3.csv");
p4 = csvread("lab2_2_alldigits/p4.csv");
p5 = csvread("lab2_2_alldigits/p5.csv");
p6 = csvread("lab2_2_alldigits/p6.csv");
p7 = csvread("lab2_2_alldigits/p7.csv");
p8 = csvread("lab2_2_alldigits/p8.csv");
p9 = csvread("lab2_2_alldigits/p9.csv");

dataset = [p0, p1, p2, p3, p4, p5, p6, p7, p8, p9];
distorted_dataset = [distort_image(p0, 0.05), distort_image(p1, 0.05), distort_image(p2, 0.05), distort_image(p3, 0.05), distort_image(p4, 0.05), distort_image(p5, 0.05), distort_image(p6, 0.05), distort_image(p7, 0.05), distort_image(p8, 0.05), distort_image(p9, 0.05)];

input_dim = size(p0, 1);

% 1) 
% learn the first three digits follow the incremental method

W = 1/input_dim * (p0*p0');
W = W + 1/input_dim * (p1*p1');

% 2)
% compute the average discrepancy for each of the saved images you have in
% memory

discrepancies = [];

for i = 3:10
    memory = dataset(:, 1:i);
    discrepancy = 0;
    
    % learn the new pattern
    W = W + 1/input_dim * memory(:, end)*memory(:, end)';
    
    W = W - diag(diag(W));
    
    overlapses = [];
    
    for j = 1:size(memory, 2)
        mem = memory(:, j);
        dmem = distorted_dataset(:, j);
         
        [xs, energies, overlaps, activations] = hopfieldnet(dmem, memory, 3, 0, W);
        
        % compute the discrepancy between the mem and reconstruction of the
        % distorted mem image
        discrepancy = discrepancy + (sum(mem - xs(:, end)))^2/1024;
        
        % compute the overlap between the mem and reconstruction of the
        % distorted mem image during time of the model evolution
        overlap_original = dmem'*xs;
        overlap_original = overlap_original/input_dim;
                
        overlapses = [overlapses, overlap_original'];
    end
    
    plot(overlaps');
    title("Overlaps during time");
    legend();
    % pause();
    f = gcf;
    exportgraphics(f, 'images/bonus_2_momory_'+string(i)+'.png', 'Resolution',300)
    
    discrepancies = [discrepancies, discrepancy/size(memory, 2)];
    
    disp("Done " + string(i) + " ...");
end

plot(discrepancies');
title("Average Discrepancy");
% pause();
f = gcf;
exportgraphics(f, 'images/bonus_2_discrepancy.png', 'Resolution',300)