 %%Initial setup
   tspan = [0 40];
   tstart = tspan(1);
   tend = tspan(end);
%Here p(1) is S and p(2) is I
hold on
%Set two different initial conditions, get MATLAB to plot both
for i=1:2
   v=[0.22 0.15;0.2 0.15];
   p0 = v(i,:);
   %Initial equations
   t = tstart;
   p = p0;
   fcn = @SIRODE;
   opt = odeset('Events', @VaxEvent1);
   %Initialize empty vector
   ateout = [];
   apeout = [];
   aieout = [];
while t(end) < tend
   % Run integration until event function stops it
   [at, ap, ate, ape, aie] = ode45(fcn, [t(end), tend], p(end, :), opt);
   % Append the new trajectory
   t = cat(1, t, at(2:end));
   p = cat(1, p, ap(2:end,:));

   if (p(end)<=0.15)
     fcn = @SIRODE;
     opt = odeset('Events', @VaxEvent1);
   elseif (p(end)>=0.156)
     fcn = @SIRODE2;
     opt = odeset('Events', @VaxEvent2);
   end
 ateout = [ateout; ate];
 apeout = [apeout; ape];
 aieout = [aieout; aie];
end
disp(apeout)
%%Plotting results
plot(t,p(:,2))
title('Switching Vaccination Rate')
xlabel('Time')
ylabel('Infectious Population')
end
hold off
