function dpdt = deltaint(t,p)
R = 5.14;
alpha=0.19;
delta=1.62;

dpdt = [p(1) .* (-1 + R*p(2));
        p(2) .* (- R*p(1)-alpha-delta)+alpha];
end
