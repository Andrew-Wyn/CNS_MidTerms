% Author: Luca Moroni
% 
% LAB 1 CNS Course
%
% This file contains the ConfigDynamic class


classdef ConfigDynamic
% This class contain the input properties necessary to define a kind of
% neuronal dynamic of the izhikevic model.
%
% Model:
%       dv_dt = (0.04 * v^2 + p1*v +p2 - u + i);
%       du_dt = a*(b*v -p3*u + p4);
%       v = v + h*dv_dt;
%       u = u + h*du_dt;
%
% nota: the ps parameters are added to deal with strange formula for some
%       neural dynamics not covered with the parameters of the original
%       formulation.


   properties
      a = NaN
      b = NaN
      c = NaN
      d = NaN
      v = NaN
      u = NaN
      step = NaN % the h parameter of the model, the time step discretization
      msg = "Config Name" % the name of the neuronal configuration
      is = NaN
      p1 = NaN
      p2 = NaN
      p3 = NaN
      p4 = NaN
   end
end
