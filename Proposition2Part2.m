%Nat line run in backwards time
tspan = [15.07 0];
tstart = tspan(1);
Iint=0.1;
Inat=0.08;
alpha=0.2;
delta=1.6;
R0=1.7;
p0 = [Iint 1/R0];
t = tstart;
p = p0;
[t,p,te,pe,ie]=ode45(@deltanat,[t(end),tspan(end)],p(end, :),odeset('Events',@Vdash));
plot(p(:,1),p(:,2))
%title('Switching Vaccination Rate')
hold on 
%Int line run in forwards time
tspan = [0 100];
tstart = tspan(1);
tend = tspan(end);
p0 = [Iint 1/R0];
t = tstart;
p = p0;
[t,p]=ode45(@deltaint,[t(end),tend],p(end,:));
plot(p(:,1),p(:,2))

%Line from V' to V, terminating at Iint.  
tspan = [1 0];
tstart = tspan(1);
tend = tspan(end);
p0 = pe;
t = tstart;
p = p0;
[t,p,ta,pa,ia]=ode45(@deltaint,[t(end),tend],p(end, :),odeset('Events',@TerminateNat));
plot(p(:,1),p(:,2))

xline(Iint,'--')
xline(Inat,'--')
yline(1/R0,'--',{'S_{E}'})
plot(alpha*(1-1/R0), 1/R0, '.','MarkerSize',10) %Plot E
plot(0, alpha/delta+alpha, '.','MarkerSize',10) %Plot E*
xlim([0 Iint+0.01])
ylim([0 1])
xlabel('I')
ylabel('S')
hold off
