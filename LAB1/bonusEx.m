%%% Bonus Tracks
is = [zeros(1, 40*4), ones(1, 4*4)*0.65, zeros(1, 4*4), ones(1, 4*4)*0.65, zeros(1, 100*4), ones(1, 4*4)*0.65, zeros(1, 16*4), ones(1, 4*4)*0.65, zeros(1, 100*4), ones(1, 4*4)*0.65, zeros(1, 40*4), ones(1, 4*4)*0.65, zeros(1, 100*4)];

resonator_config = ConfigDynamic;
resonator_config.a = 0.1;
resonator_config.b = 0.26;
resonator_config.c = -60;
resonator_config.d = -1;
resonator_config.v = -62;
resonator_config.step = 0.25;
resonator_config.is = is;
resonator_config.msg = "ResonatorBonusEx1";
resonator_config.p1 = 5;
resonator_config.p2 = 140;

izhikevic(resonator_config);

is = [zeros(1, 40*4), ones(1, 4*4)*0.65, zeros(1, 16*4), ones(1, 4*4)*0.65, zeros(1, 100*4), ones(1, 4*4)*0.65, zeros(1, 16*4), ones(1, 4*4)*0.65, zeros(1, 100*4)];

resonator_config = ConfigDynamic;
resonator_config.a = 0.1;
resonator_config.b = 0.26;
resonator_config.c = -60;
resonator_config.d = -1;
resonator_config.v = -62;
resonator_config.step = 0.25;
resonator_config.is = is;
resonator_config.msg = "ResonatorBonusEx2";
resonator_config.p1 = 5;
resonator_config.p2 = 140;

izhikevic(resonator_config);

is = [zeros(1, 10*4), ones(1, 9*4)*9, zeros(1, 100*4), ones(1, 2*4)*9, zeros(1, 8*4), ones(1, 2*4)*9, zeros(1, 100*4)];

integrator_config = ConfigDynamic;
integrator_config.a = 0.02;
integrator_config.b = -0.1;
integrator_config.c = -55;
integrator_config.d = 6;
integrator_config.v = -60;
integrator_config.step = 0.25;
integrator_config.is = is;
integrator_config.msg = "IntegratorBonusEx1";
integrator_config.p1 = 4.1;
integrator_config.p2 = 108;

izhikevic(integrator_config);

is = [zeros(1, 10*4), ones(1, 1*4)*9, zeros(1, 100*4), ones(1, 1*4)*9, zeros(1, 100*4)];

integrator_config = ConfigDynamic;
integrator_config.a = 0.02;
integrator_config.b = -0.1;
integrator_config.c = -55;
integrator_config.d = 6;
integrator_config.v = -60;
integrator_config.step = 0.25;
integrator_config.is = is;
integrator_config.msg = "IntegratorBonusEx2";
integrator_config.p1 = 4.1;
integrator_config.p2 = 108;

izhikevic(integrator_config);

is = [ones(1, 151)*0.24, ones(1, 19)*1.2, ones(1, 695)*0.24, ones(1, 19)*1.2, ones(1, 337)*0.24];

bistability_config = ConfigDynamic;
bistability_config.a = 0.1;
bistability_config.b = 0.26;
bistability_config.c = -60;
bistability_config.d = 0;
bistability_config.v = -61;
bistability_config.step = 0.25;
bistability_config.is = is;
bistability_config.msg = "BistabilityBonusEx1";
bistability_config.p1 = 5;
bistability_config.p2 = 140;

izhikevic(bistability_config);

is = [zeros(1, 151), ones(1, 19)*0.2, zeros(1, 695), ones(1, 19)*0.2, zeros(1, 337)];

bistability_config = ConfigDynamic;
bistability_config.a = 0.1;
bistability_config.b = 0.26;
bistability_config.c = -60;
bistability_config.d = 0;
bistability_config.v = -61;
bistability_config.step = 0.25;
bistability_config.is = is;
bistability_config.msg = "BistabilityBonusEx2";
bistability_config.p1 = 5;
bistability_config.p2 = 140;

izhikevic(bistability_config);