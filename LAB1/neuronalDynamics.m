% Tonic Spiking
tonic_spiking_config = ConfigDynamic;
tonic_spiking_config.a = 0.02;
tonic_spiking_config.b = 0.2;
tonic_spiking_config.c = -65;
tonic_spiking_config.d = 6;
tonic_spiking_config.v = -70;
tonic_spiking_config.step = 0.25;
tonic_spiking_config.max_step = 100;
tonic_spiking_config.msg = "TonicSpiking";
tonic_spiking_config.voltage_f = @(t) inputFunctions.tonic_spiking(t);
tonic_spiking_config.p1 = 5;
tonic_spiking_config.p2 = 140;

izhikevic(tonic_spiking_config);

phasic_spiking_config = ConfigDynamic;
phasic_spiking_config.a = 0.02;
phasic_spiking_config.b = 0.25;
phasic_spiking_config.c = -65;
phasic_spiking_config.d = 6;
phasic_spiking_config.v = -64;
phasic_spiking_config.step = 0.25;
phasic_spiking_config.max_step = 200;
phasic_spiking_config.msg = "PhasicSpiking";
phasic_spiking_config.voltage_f = @(t) inputFunctions.phasic_spiking(t);
phasic_spiking_config.p1 = 5;
phasic_spiking_config.p2 = 140;

izhikevic(phasic_spiking_config);

tonic_bursting_config = ConfigDynamic;
tonic_bursting_config.a = 0.02;
tonic_bursting_config.b = 0.2;
tonic_bursting_config.c = -50;
tonic_bursting_config.d = 2;
tonic_bursting_config.v = -70;
tonic_bursting_config.step = 0.25;
tonic_bursting_config.max_step = 220;
tonic_bursting_config.msg = "TonicBursting";
tonic_bursting_config.voltage_f = @(t) inputFunctions.tonic_bursting(t);
tonic_bursting_config.p1 = 5;
tonic_bursting_config.p2 = 140;

izhikevic(tonic_bursting_config);

phasic_bursting_config = ConfigDynamic;
phasic_bursting_config.a = 0.02;
phasic_bursting_config.b = 0.25;
phasic_bursting_config.c = -55;
phasic_bursting_config.d = 0.05;
phasic_bursting_config.v = -64;
phasic_bursting_config.step = 0.2;
phasic_bursting_config.max_step = 200;
phasic_bursting_config.msg = "PhasicBursting";
phasic_bursting_config.voltage_f = @(t) inputFunctions.phasic_bursting(t);
phasic_bursting_config.p1 = 5;
phasic_bursting_config.p2 = 140;

izhikevic(phasic_bursting_config);

mixed_mode_config = ConfigDynamic;
mixed_mode_config.a = 0.02;
mixed_mode_config.b = 0.2;
mixed_mode_config.c = -55;
mixed_mode_config.d = 4;
mixed_mode_config.v = -70;
mixed_mode_config.step = 0.25;
mixed_mode_config.max_step = 160;
mixed_mode_config.msg = "MixedMode";
mixed_mode_config.voltage_f = @(t) inputFunctions.mixed_mode(t);
mixed_mode_config.p1 = 5;
mixed_mode_config.p2 = 140;

izhikevic(mixed_mode_config);

spike_freq_adapt_config = ConfigDynamic;
spike_freq_adapt_config.a = 0.01;
spike_freq_adapt_config.b = 0.2;
spike_freq_adapt_config.c = -65;
spike_freq_adapt_config.d = 8;
spike_freq_adapt_config.v = -70;
spike_freq_adapt_config.step = 0.25;
spike_freq_adapt_config.max_step = 85;
spike_freq_adapt_config.msg = "SpikeFreqAdapt";
spike_freq_adapt_config.voltage_f = @(t) inputFunctions.spike_freq_adapt(t);
spike_freq_adapt_config.p1 = 5;
spike_freq_adapt_config.p2 = 140;

izhikevic(spike_freq_adapt_config);

class_1_exc_config = ConfigDynamic;
class_1_exc_config.a = 0.02;
class_1_exc_config.b = -0.1;
class_1_exc_config.c = -55;
class_1_exc_config.d = 6;
class_1_exc_config.v = -60;
class_1_exc_config.step = 0.25;
class_1_exc_config.max_step = 300;
class_1_exc_config.msg = "Class1Exec";
class_1_exc_config.voltage_f = @(t) inputFunctions.class_one_exc(t);
class_1_exc_config.p1 = 4.1;
class_1_exc_config.p2 = 108;

izhikevic(class_1_exc_config);

class_2_exc_config = ConfigDynamic;
class_2_exc_config.a = 0.2;
class_2_exc_config.b = 0.26;
class_2_exc_config.c = -65;
class_2_exc_config.d = 0;
class_2_exc_config.v = -64;
class_2_exc_config.step = 0.25;
class_2_exc_config.max_step = 300;
class_2_exc_config.msg = "Class2Exec";
class_2_exc_config.voltage_f = @(t) inputFunctions.class_two_exc(t);
class_2_exc_config.p1 = 5;
class_2_exc_config.p2 = 140;

izhikevic(class_2_exc_config);

spike_latency_config = ConfigDynamic;
spike_latency_config.a = 0.02;
spike_latency_config.b = 0.2;
spike_latency_config.c = -65;
spike_latency_config.d = 6;
spike_latency_config.v = -70;
spike_latency_config.step = 0.2;
spike_latency_config.max_step = 100;
spike_latency_config.msg = "SpikeLatency";
spike_latency_config.voltage_f = @(t) inputFunctions.spike_latency(t);
spike_latency_config.p1 = 5;
spike_latency_config.p2 = 140;

izhikevic(spike_latency_config);

sub_thresh_osc_config = ConfigDynamic;
sub_thresh_osc_config.a = 0.05;
sub_thresh_osc_config.b = 0.26;
sub_thresh_osc_config.c = -60;
sub_thresh_osc_config.d = 0;
sub_thresh_osc_config.v = -62;
sub_thresh_osc_config.step = 0.25;
sub_thresh_osc_config.max_step = 200;
sub_thresh_osc_config.msg = "SubThreshOsc";
sub_thresh_osc_config.voltage_f = @(t) inputFunctions.sub_thresh_osc(t);
sub_thresh_osc_config.p1 = 5;
sub_thresh_osc_config.p2 = 140;

izhikevic(sub_thresh_osc_config);

resonator_config = ConfigDynamic;
resonator_config.a = 0.1;
resonator_config.b = 0.26;
resonator_config.c = -60;
resonator_config.d = -1;
resonator_config.v = -62;
resonator_config.step = 0.25;
resonator_config.max_step = 400;
resonator_config.msg = "Resonator";
resonator_config.voltage_f = @(t) inputFunctions.resonator(t);
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
integrator_config.msg = "Integrator";
integrator_config.voltage_f = @(t) inputFunctions.integrator(t);
integrator_config.p1 = 4.1;
integrator_config.p2 = 108;

izhikevic(integrator_config);

rebound_spike_config = ConfigDynamic;
rebound_spike_config.a = 0.03;
rebound_spike_config.b = 0.25;
rebound_spike_config.c = -60;
rebound_spike_config.d = 4;
rebound_spike_config.v = -64;
rebound_spike_config.step = 0.2;
rebound_spike_config.max_step = 200;
rebound_spike_config.msg = "ReboundSpike";
rebound_spike_config.voltage_f = @(t) inputFunctions.rebound_spike(t);
rebound_spike_config.p1 = 5;
rebound_spike_config.p2 = 140;

izhikevic(rebound_spike_config);

rebound_burst_config = ConfigDynamic;
rebound_burst_config.a = 0.03;
rebound_burst_config.b = 0.25;
rebound_burst_config.c = -52;
rebound_burst_config.d = 0;
rebound_burst_config.v = -64;
rebound_burst_config.step = 0.2;
rebound_burst_config.max_step = 200;
rebound_burst_config.msg = "ReboundBurst";
rebound_burst_config.voltage_f = @(t) inputFunctions.rebound_burst(t);
rebound_burst_config.p1 = 5;
rebound_burst_config.p2 = 140;

izhikevic(rebound_burst_config);

thresh_variability_config = ConfigDynamic;
thresh_variability_config.a = 0.03;
thresh_variability_config.b = 0.25;
thresh_variability_config.c = -60;
thresh_variability_config.d = 4;
thresh_variability_config.v = -64;
thresh_variability_config.step = 0.25;
thresh_variability_config.max_step = 100;
thresh_variability_config.msg = "ThreshVariability";
thresh_variability_config.voltage_f = @(t) inputFunctions.thresh_variability(t);
thresh_variability_config.p1 = 5;
thresh_variability_config.p2 = 140;

izhikevic(thresh_variability_config);

bistability_config = ConfigDynamic;
bistability_config.a = 0.1;
bistability_config.b = 0.26;
bistability_config.c = -60;
bistability_config.d = 0;
bistability_config.v = -61;
bistability_config.step = 0.25;
bistability_config.max_step = 300;
bistability_config.msg = "Bistability";
bistability_config.voltage_f = @(t) inputFunctions.bistability(t);
bistability_config.p1 = 5;
bistability_config.p2 = 140;

izhikevic(bistability_config);

dap_config = ConfigDynamic;
dap_config.a = 1;
dap_config.b = 0.2;
dap_config.c = -60;
dap_config.d = -21;
dap_config.v = -70;
dap_config.step = 0.1;
dap_config.max_step = 50;
dap_config.msg = "DAP";
dap_config.voltage_f = @(t) inputFunctions.dap(t);
dap_config.p1 = 5;
dap_config.p2 = 140;

izhikevic(dap_config);

accomodation_config = ConfigDynamic;
accomodation_config.a = 0.02;
accomodation_config.b = 1;
accomodation_config.c = -55;
accomodation_config.d = 4;
accomodation_config.v = -65;
accomodation_config.u = -16;
accomodation_config.step = 0.5;
accomodation_config.max_step = 400;
accomodation_config.msg = "Accomodation";
accomodation_config.voltage_f = @(t) inputFunctions.accomodation(t);
accomodation_config.p1 = 5;
accomodation_config.p2 = 140;
accomodation_config.p3 = 0;
accomodation_config.p4 = 65;


izhikevic(accomodation_config);

inhibition_induced_spiking_config = ConfigDynamic;
inhibition_induced_spiking_config.a = -0.02;
inhibition_induced_spiking_config.b = -1;
inhibition_induced_spiking_config.c = -60;
inhibition_induced_spiking_config.d = 8;
inhibition_induced_spiking_config.v = -63.8;
inhibition_induced_spiking_config.step = 0.5;
inhibition_induced_spiking_config.max_step = 350;
inhibition_induced_spiking_config.msg = "InhibitionInducedSpiking";
inhibition_induced_spiking_config.voltage_f = @(t) inputFunctions.inhibition_induced_spiking(t);
inhibition_induced_spiking_config.p1 = 5;
inhibition_induced_spiking_config.p2 = 140;

izhikevic(inhibition_induced_spiking_config);

inhibition_induced_bursting_config = ConfigDynamic;
inhibition_induced_bursting_config.a = -0.026;
inhibition_induced_bursting_config.b = -1;
inhibition_induced_bursting_config.c = -45;
inhibition_induced_bursting_config.d = -2;
inhibition_induced_bursting_config.v = -63.8;
inhibition_induced_bursting_config.step = 0.5;
inhibition_induced_bursting_config.max_step = 350;
inhibition_induced_bursting_config.msg = "InhibitionInducedBursting";
inhibition_induced_bursting_config.voltage_f = @(t) inputFunctions.inhibition_induced_bursting(t);
inhibition_induced_bursting_config.p1 = 5;
inhibition_induced_bursting_config.p2 = 140;

izhikevic(inhibition_induced_bursting_config);