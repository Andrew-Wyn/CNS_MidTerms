function hebbian_learning(data, epochs, learning_rate, thr, learning_mode, varargin)
    % -- initialize the weight vector of dimension 2
    % --- uniform sampling between [-1, 1]
    w = (2).*rand(2,1) - 1;

    ws = w;

    % -- get varargin
    if learning_mode == "oja"
        alpha_oja = cell2mat(varargin(1));
    end

    if learning_mode == "bcm"
        theta_v = cell2mat(varargin(1));
        theta_v_lr = cell2mat(varargin(2));
    end

    % -- covariance rule preprocessing
    if learning_mode == "covariance"
        mean_theta_u = cell2mat(varargin(1));
        if mean_theta_u
            theta_u = mean(data, 2);
        else
            theta_u = cell2mat(varargin(2));
        end
    end

    for ep = 1:epochs
        for i = randperm(size(data, 2))
            % generate v
            v_i = w'*data(:, i);

            if learning_mode == "hebb"
                % compute the hebb step
                delta_w = (v_i*data(:, i));
            elseif learning_mode == "oja"
                % compute the oja step
                delta_w = (v_i*data(:, i) - alpha_oja*v_i^2*w);
            elseif learning_mode == "sub-norm"
                % compute the subtractive normalization step
                delta_w = (v_i*data(:, i) - (v_i*(ones(1,2)*data(:, i))*ones(2,1))/2);
            elseif learning_mode == "covariance"
                delta_w = (v_i*(data(:, i)-theta_u));
            elseif learning_mode == "bcm"
                % treat theta_v as dynamical system
                theta_v = theta_v + theta_v_lr*(v_i^2 - theta_v);
                delta_w = (v_i*data(:, i)*(v_i-theta_v));
            end

            w = w + learning_rate*delta_w;

            ws = [ws, w];
        end

        if norm(w - ws(end-1)) <= thr
            break
        end
    end

    % -- Plots

    % --- P1

    % compute the eigenvector of correlation matrix
    [eigs_vects, eigs] = eig(data*data');

    [~, argmax] = max(diag(eigs));
    max_eig_vect = eigs_vects(:, argmax);
    
    subplot(2,2,1)
    scatter(data(1, :), data(2, :))
    hold on
    % plot the weight vector
    normalized_w = w/norm(w);
    quiver(0,0,normalized_w(1,1),normalized_w(2,1), Color="red", LineWidth=3)
    hold on
    % plot the eig vector
    quiver(0,0,max_eig_vect(1,1),max_eig_vect(2,1), Color="green", LineWidth=3)
    legend('', 'weight vector', 'eig vector');
    title("Eigen vs Weight: " + learning_mode);
    hold off
    
    subplot(2,2,2)
    % --- P2
    % plot the first component of the weight vectors in time
    plot(ws(1, :));
    title("Weight first component: " + learning_mode);
    
    subplot(2,2,3)
    % plot the second component of the weight vectors in time
    plot(ws(2, :));
    title("Weight second component: " + learning_mode);
    
    subplot(2,2,4)
    % plot the norm of the weight vectors in time
    plot(vecnorm(ws));
    title("Weight norm: " + learning_mode);
    pause();
    f = gcf;
    exportgraphics(f, 'images/'+learning_mode+'.png', 'Resolution',300);
end