function dpdt = SIRODE(t,p)
R = 5.14;
delta = 0;
alpha=0.19;

dpdt = [p(1) .* (- R*p(2)-delta-alpha)+alpha;
        p(2) .* (-1 + R*p(1))];
end

