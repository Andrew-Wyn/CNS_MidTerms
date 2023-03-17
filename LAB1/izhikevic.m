function izhikevic(a, b, c, d, v, voltagef, max_step, msg)
    step = 0.25;
    times = 0:step:max_step;
    u = b*v;
    
    vs = [];
    us = [];
    
    for t=times
        i = voltagef(t);
        
        % compute the differentials
        dv_dt = (0.04 * v^2 + 5*v +140 - u + i);
        du_dt = a*(b*v -u);
                
        % euler step
        v = v + step*dv_dt;
        u = u + step*du_dt;
        
        % after spike reset
        if v > 30
            vs(end+1) = 30;
            v = c;
            u = u + d;
        else
            vs(end+1) = v;
        end
        
        us(end+1) = u;
    end
    
    % ---- Plots
    subplot(1,2,1) 
    
    plot(times,vs);
    title("Membrane Potential: " + msg);

    subplot(1,2,2)
    
    plot(vs,us);
    
    title("Phase Portrait: " + msg);
    
    f = gcf;
    exportgraphics(f, msg+'.png', 'Resolution',300)

end