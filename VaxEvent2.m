function [val, isterminal, dir]=VaxEvent2(t,p)
val = 0.15-p(2);
isterminal=1;
dir=1;
end