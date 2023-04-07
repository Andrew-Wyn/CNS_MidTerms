function [xs, energies, overlaps, activations] = hopfieldnet(input, memory, max_step, stop_criterion, varargin)
%HOPFIELDMET Summary of this function goes here
%   Detailed explanation goes here    
    num_memory_els = size(memory, 2);
    input_dim = size(memory, 1);
    
    
    
    if size(varargin) == 0
        % learn the model
    
        W = zeros(input_dim, input_dim);

        for mi = 1:num_memory_els
            W = W + memory(:, mi)*memory(:, mi)';
        end

        W = (W - num_memory_els*eye(size(W,1)))/input_dim;

        % ---
    else
        % take the matrix's weight directly from the arguments
        W = cell2mat(varargin(1));
        % ---
    end
    
    final_x = input;
    
    energies = [];
    overlaps = [];
    xs = [];
    
    xs = [xs, input];
    
    activations = [];
    
    for t = 1:max_step
        old_x = final_x;
        for j=randperm(input_dim)
            act = W*final_x;
            final_x(j) = sign(act(j));
            
            activations = [activations, act];
            xs = [xs, final_x];

            % compute the energy
            energies(end+1) = energy_function(W, final_x);
            % compute the overlap
            overlaps = [overlaps, overlap_function(final_x, memory)'];
        end

        if stop_criterion && norm(final_x - old_x) == 0
            disp("reached fixed point");
            return
        end
    end

end

function energy = energy_function(W, input)
    energy = W*input;
    energy = -0.5*energy'*input;
end

function overlap = overlap_function(input, memory)
    overlap = input'*memory;
    overlap = overlap/size(input, 1);
end
