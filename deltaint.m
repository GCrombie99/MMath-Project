function dpdt = deltaint(t,p)
R = 1.7;
alpha=0.2;
delta=1.6;

dpdt = [p(1) .* (-1 + R*p(2));
        p(2) .* (- R*p(1)-alpha-delta)+alpha];
end
