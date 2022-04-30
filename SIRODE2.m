function dpdt = SIRODE2(t,p)
R = 5.14;
delta = 1.62;
alpha=0.19;

dpdt = [p(1) .* (- R*p(2)-delta-alpha)+alpha;
        p(2) .* (-1 + R*p(1))];
end