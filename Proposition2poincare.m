tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
Iint=0.1;
Inat=0.05;
p0 = [Iint 0.8;];
t = tstart;
p = p0;
%Plot intervention dynamics first
[t,p,te,pe,ie]=ode45(@deltaint,[t(end),tspan(end)],p(end, :),odeset('Events',@Vax2));
plot(p(:,1),p(:,2))
hold on
tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
t = tstart;
p = pe;
%Plot natural dynamics next
[t,p,ta,pa,ia]=ode45(@deltanat,[t(end),tspan(end)],p(end, :),odeset('Events',@Vax1));
plot(p(:,1),p(:,2))
xline(Iint,'--')
xline(Inat,'--')
yline(1/1.7,'--',{'S_{E}'})
yline(1,'--')
hold off

