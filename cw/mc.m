function v=mc(trace,s,gamma,r)
if (s+1)~= length(trace) % not to the last state in a trace
    v=r(s)+gamma*mc(trace,s+1,gamma,r);
else
    v=r(end);
end

end