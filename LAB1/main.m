
voltagefs = {};
voltagefs{1} = @(t) voltageFunctions.tonic_spiking(t);
voltagefs{11} = @(t) voltageFunctions.resonator(t);
voltagefs{12} = @(t) voltageFunctions.integrator(t);


for i = 1:1
    izhikevic(as(i), bs(i), cs(i), ds(i), vs(i), voltagefs{i}, max_steps(i), msgs(i))
    disp("press a key");
    pause;
end