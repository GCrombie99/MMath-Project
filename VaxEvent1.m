function [val, isterminal, dir]=VaxEvent1(t,p)
val = 0.156-p(2);
isterminal=1;
dir=-1;
end