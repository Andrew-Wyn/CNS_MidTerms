% function izhikevic(a, b, c, d, v, i0, t0, max_step, msg)

as = [0.02, 0.02, 0.02, 0.02, 0.02, 0.01, 0.02, 0.2, 0.02, 0.05];
bs = [0.2, 0.25, 0.2, 0.25, 0.2, 0.2, -0.1, 0.26, 0.2, 0.26];
cs = [-65, -65, -50, -55, -55, -65, -55, -65, -65, -60];
ds = [6, 6, 2, 0.05, 4, 8, 6, 0, 6, 0];
vs = [-70, -64, -70, -64, -70, -70, -60, -64, -70, -62];
max_steps = [100, 200, 220, 200, 160, 85, 300, 300, 100, 200];
msgs = ["TonicSpiking", "PhasicSpiking", "TonicBursting", "PhasicBursting", "MixedMode", "SpikeFreqAdapt", "Class1Exc", "Class2Exc", "SpikeLatency", "SubThreshOsc"];

voltagefs = {};
voltagefs{1} = @(t) tonic_spiking(t);
voltagefs{2} = @(t) tonic_spiking(t);
voltagefs{3} = @(t) tonic_spiking(t);
voltagefs{4} = @(t) tonic_spiking(t);
voltagefs{5} = @(t) tonic_spiking(t);
voltagefs{6} = @(t) tonic_spiking(t);
voltagefs{7} = @(t) tonic_spiking(t);
voltagefs{8} = @(t) tonic_spiking(t);
voltagefs{9} = @(t) tonic_spiking(t);
voltagefs{10} = @(t) tonic_spiking(t);
voltagefs{11} = @(t) tonic_spiking(t);
voltagefs{12} = @(t) tonic_spiking(t);
voltagefs{13} = @(t) tonic_spiking(t);
voltagefs{14} = @(t) tonic_spiking(t);
voltagefs{15} = @(t) tonic_spiking(t);
voltagefs{16} = @(t) tonic_spiking(t);
voltagefs{17} = @(t) tonic_spiking(t);
voltagefs{18} = @(t) tonic_spiking(t);
voltagefs{19} = @(t) tonic_spiking(t);
voltagefs{20} = @(t) tonic_spiking(t);



for i = 1:1
    % define before the vector of the in
    izhikevic(as(i), bs(i), cs(i), ds(i), vs(i), voltagefs{1}, max_steps(1), msgs(i))
    pause;
    disp("press a key");
end

function i = tonic_spiking(t)
    if (t>10) 
        i=14;
    else
        i=0;
    end
end

function i = phasic_spiking(t)
    if (t>20) 
        i=14;
    else
        i=0;
    end
end

function i = tonic_bursting(t)
    if (t>22) 
        i=15;
    else
        i=0;
    end
end

function i = phasic_bursting(t)
    if (t>20) 
        i=0.6;
    else
        i=0;
    end
end

function i = mixed_mode(t)
    if (t>16)
        i=10;
    else
        i=0;
    end
end

function i = spike_freq_adapt(t)
    if (t>8)
        i=30;
    else
        i=0;
    end
end

function i = class_one_exc(t)
    if (t > 30)
        i = (0.075*(t-30);
    else
        i = 0;
    end
end

function i = class_two_exc(t)
    if (t > 30)
        i = -0.5+(0.015*(t-30));
    else
        i = -0.5;
    end
end

function i = spike_latency(t)
    if (t > 10) && (t < 13)
        i = 7.04;
    else
        i = 0;
    end
end

function 
end