tspan = [100 0];
tstart = tspan(1);
Iint=0.1;
Inat=0.01;
p0 = [Iint 1/1.7];
t = tstart;
p = p0;
[t,p,te,pe,ie]=ode45(@deltanat,[t(end),tspan(end)],p(end, :),odeset('Events',@TerminateNat2));
plot(p(:,1),p(:,2))
hold on 
tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
p0 = [Iint 1/1.7];
t = tstart;
p = p0;
[t,p]=ode45(@deltaint,[t(end),tend],p(end,:));
plot(p(:,1),p(:,2))
xline(Iint,'--')
xline(Inat,'--')
yline(1/1.7,'--')
plot(0.2*(1-1/1.7), 1/1.7, '.','MarkerSize',15) %Plot E
plot(0, 0.2/1.8, '.','MarkerSize',15) %Plot E*
xlim([0 Iint+0.01])
ylim([0 1.01])
xlabel('I')
ylabel('S')
hold off


