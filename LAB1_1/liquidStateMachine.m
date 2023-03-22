function states = liquidStateMachine(input, hidden_dim, exc_perc, wInExc, wInInh, wRecExc, wRecInh)

    % NumExc = 800;
    % NumInh = 200;
    
    NumExc = int16(hidden_dim*exc_perc);
    NumInh = hidden_dim - int16(hidden_dim*exc_perc);    
    
    rexc = rand(NumExc, 1);
    rinh = rand(NumInh, 1);
    
    a = [0.02*ones(NumExc,1);     0.02+0.08*rinh];
    b = [0.2*ones(NumExc,1);      0.25-0.05*rinh];
    c = [-65+15*rexc.^2;        -65*ones(NumInh,1)];
    d = [8-6*rexc.^2;           2*ones(NumInh,1)];
    
    % input scaling coefficients
    % wInExc = 5;
    % wInInh = 2;
    
    UIn=[wInExc * ones(NumExc,1);   wInInh * ones(NumInh,1)];
    
    % recurrent scaling coefficients
    % wRecExc = 0.5;
    % wRecInh = 1;
    
    URec=[wRecExc * rand(NumExc+NumInh,NumExc),   -wRecInh * rand(NumExc+NumInh,NumInh)];
    
    % initializing the membrane potential v and the resisting variable u
    v = -65*ones(NumExc + NumInh, 1);
    u = b.*v;
    
    states = [];
    
    for t = 1:size(input, 2)       
        % input connections
        I = input(t)*UIn;

        fired = find(v >= 30);
        v(fired) = c(fired);
        u(fired) = u(fired) + d(fired);
        
        % recurrent connections        
        I = I + sum(URec(:, fired), 2);
        
        v=v+0.5*(0.04*v.^2+5*v+140-u+I); % step 0.5 ms
        v=v+0.5*(0.04*v.^2+5*v+140-u+I); % for numerical
        u=u+a.*(b.*v-u);                  % stability
        
        %disp(v(1:5, 1));
        %disp(v(1:5, 1) >= 30);
        
        states = [states (v>=30)];
    end
    
    disp(NumExc);
    disp(NumInh);

end