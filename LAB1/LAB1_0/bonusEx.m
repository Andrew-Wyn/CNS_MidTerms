% Author: Luca Moroni
% 
% LAB 1 CNS Course
%
% This file contains the Bonus Track 4 neuro-computational features of 
% biological neurons
%
% Each execution need the definition of a ConfigDynamic object, taken in
% input by the izhikevic funcion, the input sequences are defined by the
% 'is' vectors.

% --- Resonator Bonus Track 1

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

% --- Resonator Bonus Track 2

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

% We can see that a resonator with input defined as in ResonatorBonusEx1,
% so two short input voltage at certain delay, can bring the model to
% spike. We can notice that the second pairs of input, that has a delay for
% which the model is not sensible doesn't produce a spike.
% The second example ResonatorBonusEx2 use this property, defining two pairs
% of input at certain delay, that is not "sensible" producing only small
% variations in the membrane potential of the neuron.

% --- Integrator Bonus Track 1

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

% --- Integrator Bonus Track 2

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

% We can see that the integrator model react to input that present a
% sufficient large time of consequent high values (9 amperes), this is
% shown in IntegratorBonusEx1. While in IntegratorBonusEx2 we can see that
% input with shot consequential high value cannot bring to a spike but only
% a little movements in the membrane potential

% --- Bistability Bonus Track 1

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

% --- Bistability Bonus Track 2

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

% The bistability is a behaviour that consist of a constant spiking regime
% started after a positive value (enough high) input and interrupted, with an input of the same capacity, 
% after a certain time delay, we can see that behaviour in BistabilityBonusEx1. We can see that
% if we change the value of the inputs, with lower values, the bistability spike regime cannot
% be reached by the model, see BistabilityBonusEx2.