% Author: Luca Moroni
%
% LAB 2 - 2 CNS Course: Hopfield Networks
%
% This file contains the implementation of the hopfield network

function [xs, energies, overlaps, activations] = hopfieldnet(input, memory, max_step, stop_criterion, bias, varargin)
% Implementation of the Hopfield network, with bias.
% 
% Arguments
%   - input: vector of (-1, 1).
%   - memory: matrix containing the element "memorized" by the model.
%   - max_step: (int) the max number of epoch that the model can do.
%   - stop_criterion: (bool) if True (1), the model will stop if converged
%   before of max_step epochs.
%   - bias: (float) the bias of the model.
%   - varagin: (variable arguments) if present it will contain the weight
%   matrix of the model, it will substitute the learning phase.
%
% Returns
%   - xs: matrix of all the neruon activation for each steps.
%   - energies: vector of all the energy values through the model
%   evolution.
%   - overlaps: matrix contains the overlaps of the model's activation
%   values with respect to all the memory's patterns through the evolution
%   of the system, so step-by-step.
%   - activation: matrix contains all neurons' activations for each step of
%   the model.

    num_memory_els = size(memory, 2);
    input_dim = size(memory, 1);
        
    if size(varargin) == 0
        % - learn the model
    
        W = zeros(input_dim, input_dim);

        for mi = 1:num_memory_els
            W = W + memory(:, mi)*memory(:, mi)';
        end

        W = (W - num_memory_els*eye(size(W,1)))/input_dim;

        % ---
    else
        % - take the matrix's weight directly from the arguments
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
            final_x(j) = sign(act(j) + bias);
            
            activations = [activations, act];
            xs = [xs, final_x];

            % compute the energy
            energies(end+1) = energy_function(W, bias, final_x);
            % compute the overlap
            overlaps = [overlaps, overlap_function(final_x, memory)'];
        end
        
        if stop_criterion && norm(final_x - old_x) == 0
            return
        end
    end

end

function energy = energy_function(W, bias, input)
% Energy function of the hopfield network model.
%
% Arguments
%   - W: the weight matrix of the model.
%   - bias: the bias of the model.
%   - input: the neurons' activation of the model.
%
% Returns
%   - energy: the energy value of the model with a certain neurons'
%   configuration

    energy = W*input;
    energy = -0.5*energy'*input - (bias*ones(size(input)))'*input;
end

function overlap = overlap_function(input, memory)
% Compute the overlap of the neurons' configurations with respect the memory
% patterns.
%
% Arguments
%   - input: the neurons' activation of the model.
%   - memory: the memory pattern learned by the model.
%
% Returns
%   - overlap: the vector of the overlaps of input with respect to each
%   memory patterns.

    overlap = input'*memory;
    overlap = overlap/size(input, 1);
end
