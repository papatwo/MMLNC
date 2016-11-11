function v=mc(trace,s,gamma,r)
v=0;
if (s+1)~= length(trace) % not to the last state in a trace
    v=r(s)+gamma*mc(trace,s+1,gamma,r);
else
    v=v+r(end);
end

end