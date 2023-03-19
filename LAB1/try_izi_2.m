
% Tonic Spiking
is = [zeros(1, 10*4), ones(1, 90*4)*14];

tonic_spiking_config = ConfigDynamic2;
tonic_spiking_config.a = 0.02;
tonic_spiking_config.b = 0.2;
tonic_spiking_config.c = -65;
tonic_spiking_config.d = 6;
tonic_spiking_config.v = -70;
tonic_spiking_config.step = 0.25;
tonic_spiking_config.msg = "TonicSpiking";
tonic_spiking_config.is = is;
tonic_spiking_config.p1 = 5;
tonic_spiking_config.p2 = 140;

% izi2(tonic_spiking_config);

is = [zeros(1, 10*4), ones(1, 90*4)*0.5];

phasic_spiking_config = ConfigDynamic2;
phasic_spiking_config.a = 0.02;
phasic_spiking_config.b = 0.25;
phasic_spiking_config.c = -65;
phasic_spiking_config.d = 6;
phasic_spiking_config.v = -64;
phasic_spiking_config.step = 0.25;
phasic_spiking_config.msg = "PhasicSpiking";
phasic_spiking_config.is = is;
phasic_spiking_config.p1 = 5;
phasic_spiking_config.p2 = 140;

% izi2(phasic_spiking_config);

is = [zeros(1, 20*4), ones(1, 90*4)*15];

tonic_bursting_config = ConfigDynamic2;
tonic_bursting_config.a = 0.02;
tonic_bursting_config.b = 0.2;
tonic_bursting_config.c = -50;
tonic_bursting_config.d = 2;
tonic_bursting_config.v = -70;
tonic_bursting_config.step = 0.25;
tonic_bursting_config.msg = "TonicBursting";
tonic_bursting_config.is = is;
tonic_bursting_config.p1 = 5;
tonic_bursting_config.p2 = 140;

% izi2(tonic_bursting_config);

is = [zeros(1, 20*5), ones(1, 90*5)*0.6];

phasic_bursting_config = ConfigDynamic2;
phasic_bursting_config.a = 0.02;
phasic_bursting_config.b = 0.25;
phasic_bursting_config.c = -55;
phasic_bursting_config.d = 0.05;
phasic_bursting_config.v = -64;
phasic_bursting_config.step = 0.2;
phasic_bursting_config.is = is;
phasic_bursting_config.msg = "PhasicBursting";
phasic_bursting_config.p1 = 5;
phasic_bursting_config.p2 = 140;

% izi2(phasic_bursting_config);

is = [zeros(1, 20*4), ones(1, 90*4)*10];

mixed_mode_config = ConfigDynamic2;
mixed_mode_config.a = 0.02;
mixed_mode_config.b = 0.2;
mixed_mode_config.c = -55;
mixed_mode_config.d = 4;
mixed_mode_config.v = -70;
mixed_mode_config.step = 0.25;
mixed_mode_config.msg = "MixedMode";
mixed_mode_config.is = is;
mixed_mode_config.p1 = 5;
mixed_mode_config.p2 = 140;

% izi2(mixed_mode_config);

is = [zeros(1, 20*4), ones(1, 90*4)*30];

spike_freq_adapt_config = ConfigDynamic2;
spike_freq_adapt_config.a = 0.01;
spike_freq_adapt_config.b = 0.2;
spike_freq_adapt_config.c = -65;
spike_freq_adapt_config.d = 8;
spike_freq_adapt_config.v = -70;
spike_freq_adapt_config.step = 0.25;
spike_freq_adapt_config.is = is;
spike_freq_adapt_config.msg = "SpikeFreqAdapt";
spike_freq_adapt_config.p1 = 5;
spike_freq_adapt_config.p2 = 140;

% izi2(spike_freq_adapt_config);

is = [zeros(1, 30*4), (0:0.25:270)*0.075];

class_1_exc_config = ConfigDynamic2;
class_1_exc_config.a = 0.02;
class_1_exc_config.b = -0.1;
class_1_exc_config.c = -55;
class_1_exc_config.d = 6;
class_1_exc_config.v = -60;
class_1_exc_config.step = 0.25;
class_1_exc_config.is = is;
class_1_exc_config.msg = "Class1Exec";
class_1_exc_config.p1 = 4.1;
class_1_exc_config.p2 = 108;

% izi2(class_1_exc_config);

is = [ones(1, 30*4)*-0.5, (0:0.25:270)*0.015+-0.5];

class_2_exc_config = ConfigDynamic2;
class_2_exc_config.a = 0.2;
class_2_exc_config.b = 0.26;
class_2_exc_config.c = -65;
class_2_exc_config.d = 0;
class_2_exc_config.v = -64;
class_2_exc_config.step = 0.25;
class_2_exc_config.is = is;
class_2_exc_config.msg = "Class2Exec";
class_2_exc_config.p1 = 5;
class_2_exc_config.p2 = 140;

% izi2(class_2_exc_config);

is = [zeros(1, 10*5), ones(1, 3*5)*7.04, zeros(1, 87*5)];

spike_latency_config = ConfigDynamic2;
spike_latency_config.a = 0.02;
spike_latency_config.b = 0.2;
spike_latency_config.c = -65;
spike_latency_config.d = 6;
spike_latency_config.v = -70;
spike_latency_config.step = 0.2;
spike_latency_config.is = is;
spike_latency_config.msg = "SpikeLatency";
spike_latency_config.p1 = 5;
spike_latency_config.p2 = 140;

% izi2(spike_latency_config);

is = [zeros(1, 10*4), ones(1, 5*4)*2, zeros(1, 87*4)];

sub_thresh_osc_config = ConfigDynamic2;
sub_thresh_osc_config.a = 0.05;
sub_thresh_osc_config.b = 0.26;
sub_thresh_osc_config.c = -60;
sub_thresh_osc_config.d = 0;
sub_thresh_osc_config.v = -62;
sub_thresh_osc_config.step = 0.25;
sub_thresh_osc_config.is = is;
sub_thresh_osc_config.msg = "SubThreshOsc";
sub_thresh_osc_config.p1 = 5;
sub_thresh_osc_config.p2 = 140;

% izi2(sub_thresh_osc_config);

is = [zeros(1, 40*4), ones(1, 4*4)*0.65, zeros(1, 16*4), ones(1, 4*4)*0.65, zeros(1, 150*4), ones(1, 4*4)*0.65, zeros(1, 36*4), ones(1, 4*4)*0.65, zeros(1, 36*4)];

resonator_config = ConfigDynamic2;
resonator_config.a = 0.1;
resonator_config.b = 0.26;
resonator_config.c = -60;
resonator_config.d = -1;
resonator_config.v = -62;
resonator_config.step = 0.25;
resonator_config.is = is;
resonator_config.msg = "Resonator";
resonator_config.p1 = 5;
resonator_config.p2 = 140;

%izi2(resonator_config);

is = [zeros(1, 40*4), ones(1, 2*4)*9, zeros(1, 3*4), ones(1, 2*4)*9, zeros(1, 150*4), ones(1, 2*4)*9, zeros(1, 7*4), ones(1, 2*4)*9, zeros(1, 36*4)];

integrator_config = ConfigDynamic2;
integrator_config.a = 0.02;
integrator_config.b = -0.1;
integrator_config.c = -55;
integrator_config.d = 6;
integrator_config.v = -60;
integrator_config.step = 0.25;
integrator_config.is = is;
integrator_config.msg = "Integrator";
integrator_config.p1 = 4.1;
integrator_config.p2 = 108;

izi2(integrator_config);

% add possibility to switch btw euler and leap-frog method
function izi2(config)
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
        
        % leap frog step
        dv_dt = (0.04 * v^2 + p1*v +p2 - u + i);
        v = v + step*dv_dt;        
        du_dt = a*(b*v -p3*u + p4);
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
