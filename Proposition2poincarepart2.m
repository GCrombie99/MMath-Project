tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
for i=1
v=[0.156 1;];
p0 = v(i,:);
t = tstart;
p = p0;
[t,p,te,pe,ie]=ode45(@deltaint,[t(end),tspan(end)],p(end, :),odeset('Events',@Vax2part2));
plot(p(:,1),p(:,2))
hold on
tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
t = tstart;
p = pe;
[t,p,ta,pa,ia]=ode45(@deltanat,[t(end),tspan(end)],p(end, :),odeset('Events',@Vax1));

plot(p(:,1),p(:,2))
end
xline(0.156,'--')
xline(0.1525,'--')
yline(0.19455,'--',{'S_{E}'})
%plot(0.156, 0.2071, '.','MarkerSize',10)
yline(1,'--')
%xlim([0 0.156+0.01])
%ylim([0 1.01])
hold off

