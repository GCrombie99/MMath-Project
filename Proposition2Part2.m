%Nat line run in backwards time
tspan = [5.71 0];
tstart = tspan(1);
p0 = [0.156 0.19455];
Iint=0.156;
Inat=0.1525;
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
p0 = [Iint 0.19455];
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
yline(0.19455,'--',{'S_{E}'})
plot(0.15304, 0.19455, '.','MarkerSize',10) %Plot E
%plot(Iint, 0.19455, '.','MarkerSize',10) %Plot O
%plot(0.15218, 0.148558, '.','MarkerSize',10) %Plot F
%plot(0.1525, 0.148075758184667, '.','MarkerSize',10) %Plot point
%plot(0.156, 0.2071, '.','MarkerSize',10) %Plot point
plot(0, 0.19/1.81, '.','MarkerSize',10) %Plot E*
xlim([0 Iint+0.01])
ylim([0 1])
xlabel('I')
ylabel('S')
hold off