% TODO: add possibility to switch btw euler and leap-frog method
function izhikevic(config, ode_method)
    a = config.a;
    b = config.b;
    c = config.c;
    d = config.d;
    v = config.v;
    is = config.is;
    msg = config.msg;
    p1 = config.p1;
    p2 = config.p2;
        
    if (isnan(config.p3))
        p3 = 1;
    else
        p3 = config.p3;
    end
    if (isnan(config.p4))
        p4 = 0;
    else
        p4 = config.p4;
    end
    
    step = config.step;

    if (isnan(config.u))
        u = b*v;
    else
        u = config.u;
    end
    
    vs = [];
    us = [];
        
    for t = 1:length(is)
        i = is(t);
        
        % leap-frog step
        if ode_method == "leap-frog"
            dv_dt = (0.04 * v^2 + p1*v +p2 - u + i);
            v = v + step*dv_dt;
            du_dt = a*(b*v -p3*u + p4);
            u = u + step*du_dt;
        elseif ode_method == "euler"
            dv_dt = (0.04 * v^2 + p1*v +p2 - u + i);
            du_dt = a*(b*v -p3*u + p4);
            v = v + step*dv_dt;
            u = u + step*du_dt;
        end
        
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
    subplot(2,2,1) 
    
    plot(vs);
    title("Membrane Potential: " + msg);
    
    subplot(2,2,3) 
    
    plot(is);
    title("Input: " + msg);

    subplot(2,2,2)
    
    plot(vs,us);
    
    title("Phase Portrait: " + msg);
    
    f = gcf;
    exportgraphics(f, 'images/'+msg+'.png', 'Resolution',300)

end