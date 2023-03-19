resonator_config = ConfigDynamic;
resonator_config.a = 0.1;
resonator_config.b = 0.26;
resonator_config.c = -60;
resonator_config.d = -1;
resonator_config.v = -62;
resonator_config.step = 0.25;
resonator_config.max_step = 400;
resonator_config.msg = "ResonatorBonusEx1";
resonator_config.voltage_f = @(t) resonator_1(t);
resonator_config.p1 = 5;
resonator_config.p2 = 140;

izhikevic(resonator_config);

resonator_config = ConfigDynamic;
resonator_config.a = 0.1;
resonator_config.b = 0.26;
resonator_config.c = -60;
resonator_config.d = -1;
resonator_config.v = -62;
resonator_config.step = 0.25;
resonator_config.max_step = 400;
resonator_config.msg = "ResonatorBonusEx2";
resonator_config.voltage_f = @(t) resonator_2(t);
resonator_config.p1 = 5;
resonator_config.p2 = 140;

izhikevic(resonator_config);

integrator_config = ConfigDynamic;
integrator_config.a = 0.02;
integrator_config.b = -0.1;
integrator_config.c = -55;
integrator_config.d = 6;
integrator_config.v = -60;
integrator_config.step = 0.25;
integrator_config.max_step = 100;
integrator_config.msg = "IntegratorBonusEx1";
integrator_config.voltage_f = @(t) integrator_1(t);
integrator_config.p1 = 4.1;
integrator_config.p2 = 108;

izhikevic(integrator_config);

integrator_config = ConfigDynamic;
integrator_config.a = 0.02;
integrator_config.b = -0.1;
integrator_config.c = -55;
integrator_config.d = 6;
integrator_config.v = -60;
integrator_config.step = 0.25;
integrator_config.max_step = 100;
integrator_config.msg = "IntegratorBonusEx2";
integrator_config.voltage_f = @(t) integrator_2(t);
integrator_config.p1 = 4.1;
integrator_config.p2 = 108;

izhikevic(integrator_config);

bistability_config = ConfigDynamic;
bistability_config.a = 0.1;
bistability_config.b = 0.26;
bistability_config.c = -60;
bistability_config.d = 0;
bistability_config.v = -61;
bistability_config.step = 0.25;
bistability_config.max_step = 300;
bistability_config.msg = "BistabilityBonusEx1";
bistability_config.voltage_f = @(t) bistability_1(t);
bistability_config.p1 = 5;
bistability_config.p2 = 140;

izhikevic(bistability_config);

bistability_config = ConfigDynamic;
bistability_config.a = 0.1;
bistability_config.b = 0.26;
bistability_config.c = -60;
bistability_config.d = 0;
bistability_config.v = -61;
bistability_config.step = 0.25;
bistability_config.max_step = 500;
bistability_config.msg = "BistabilityBonusEx2";
bistability_config.voltage_f = @(t) bistability_2(t);
bistability_config.p1 = 5;
bistability_config.p2 = 140;

izhikevic(bistability_config);

function i = resonator_1(t)
    if ((t>40) && (t < 44)) || ((t>48) && (t < 52)) || ((t>150) && (t < 154)) || ((t>170) && (t < 174)) || ((t>400*0.7) && (t < 400*0.7+4)) || ((t>400*0.7+40) && (t < 400*0.7+44)) 
        i=0.65;
    else
        i=0;
    end
end

function i = integrator_1(t)
    T1=100/11;
    T3 = 0.7*100;
    T4 = T3+10;
    if ((t>T1) && (t < T1+9)) || ((t>T3) && (t < T3+2)) || ((t>T4) && (t < T4+2)) 
        i=9;
    else
        i=0;
    end
end

function i = bistability_1(t)
    T1 = 300/8;
    T2 = 216;

    if ((t>T1) && (t < T1+5)) || ((t>T2) && (t < T2+5)) 
        i=1.5;
    else
        i=0.24;
    end
end

function i = resonator_2(t)
    if ((t>40) && (t < 44)) || ((t>60) && (t < 64)) || ((t>400*0.7) && (t < 400*0.7+4)) || ((t>400*0.7+20) && (t < 400*0.7+24)) 
        i=0.65;
    else
        i=0;
    end
end

function i = integrator_2(t)
    if ((t>40) && (t < 41)) || ((t>52) && (t < 53))
        i=9;
    else
        i=0;
    end
end

function i = bistability_2(t)
    T1 = 300/8;
    T2 = 216;

    if ((t>T1) && (t < T1+5)) || ((t>T2) && (t < T2+5)) 
        i=0.2;
    else
        i=0;
    end
end