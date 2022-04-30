tspan = [10 0];
tstart = tspan(1);
p0 = [0.156 0.19455];
Iint=0.156;
Inat=0.13;
t = tstart;
p = p0;
[t,p,te,pe,ie]=ode45(@deltanat,[t(end),tspan(end)],p(end, :),odeset('Events',@TerminateNat2));
plot(p(:,1),p(:,2))
hold on 
tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
p0 = [Iint 0.19455];
t = tstart;
p = p0;
[t,p]=ode45(@deltaint,[t(end),tend],p(end,:));
plot(p(:,1),p(:,2))
xline(Iint,'--')
xline(Inat,'--')
yline(0.19455,'--',{'S_{E}'})
plot(0.15304, 1/5.14, '.','MarkerSize',15) %Plot E
plot(0, 0.19/1.81, '.','MarkerSize',15) %Plot E*
xlim([0 Iint+0.01])
ylim([0 1.01])
xlabel('I')
ylabel('S')
hold off

