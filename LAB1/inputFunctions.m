classdef inputFunctions
    methods(Static)

        function i = tonic_spiking(t)
            if (t>10) 
                i=14;
            else
                i=0;
            end
        end

        function i = phasic_spiking(t)
            if (t>20) 
                i=0.5;
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
            if (t>8.5)
                i=30;
            else
                i=0;
            end
        end

        function i = class_one_exc(t)
            if (t > 30)
                i = 0.075*(t-30);
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

        function i = sub_thresh_osc(t)
            if (t>20) && (t < 25)
                i=2;
            else
                i=0;
            end
        end

        function i = resonator(t)
            if ((t>40) && (t < 44)) || ((t>60) && (t < 64)) || ((t>400*0.7) && (t < 400*0.7+4)) || ((t>400*0.7+40) && (t < 400*0.7+44)) 
                i=0.65;
            else
                i=0;
            end
        end

        function i = integrator(t)
            T1=100/11;
            T2=T1+5;
            T3 = 0.7*100;
            T4 = T3+10;
            if ((t>T1) && (t < T1+2)) || ((t>T2) && (t < T2+2)) || ((t>T3) && (t < T3+2)) || ((t>T4) && (t < T4+2)) 
                i=9;
            else
                i=0;
            end
        end

        function i = rebound_spike(t)
            if (t>20) && (t < 25) 
                i=-15;
            else
                i=0;
            end
        end

        function i = rebound_burst(t)
            if (t>20) && (t < 25) 
                i=-15;
            else
                i=0;
            end
        end

        function i = thresh_variability(t)
            if ((t>10) && (t < 15)) || ((t>80) && (t < 85)) 
                i=1;
            elseif (t>70) && (t < 75)
                i=-6;
            else
                i=0;
            end
        end

        function i = bistability(t)
            T1 = 300/8;
            T2 = 216;

            if ((t>T1) && (t < T1+5)) || ((t>T2) && (t < T2+5)) 
                i=1.24;
            else
                i=0.24;
            end
        end

        function i = dap(t)
            if abs(t-10)<1 
                i=20;
            else
                i=0;
            end
        end

        function i = accomodation(t)
            if (t < 200)
                i=t/25;
            elseif t < 300
                i=0;
            elseif t < 312.5
                i=(t-300)/12.5*4;
            else
                i=0;
            end
        end

        function i = inhibition_induced_spiking(t)
            if (t < 50) || (t>250)
                i=80;
            else
                i=75;
            end
        end

        function i = inhibition_induced_bursting(t)
            if (t < 50) || (t>250)
                i=80;
            else
                i=75;
            end
        end
     
    end
end