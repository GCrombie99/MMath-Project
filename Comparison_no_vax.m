 %%Initial setup
   tspan = [0 30];
   tstart = tspan(1);
   tend = tspan(end);
%Here p(1) is S and p(2) is I
   p0 = [0.5 0.15];
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
   if (p(end)<=0.1525)
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
%%Plotting results - switching vaccination
plot(t,p(:,2))
hold on
%%Plotting results - no vaccinations
[t,p]=ode45(@SIRODE,[0,30],[0.5 0.15]);
plot(t,p(:,2))
hold off
xlabel('Time')
ylabel('Infectious Population')
