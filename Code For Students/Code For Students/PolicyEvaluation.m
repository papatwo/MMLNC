function [V,i,del] = PolicyEvaluation(Policy, T, R, Absorbing, gamma, tol)
% Dynamic Programming: Policy Evaluation. Estimates V(s) for each state s.
% Using 2 vectors for keeping track of Value Function, V(s)
S = length(Policy); % number of states - introspecting transition matrix
A = length(Policy(1,:)); % number of actions - introspecting policy matrix
V = zeros(S, 1); % optimal value function vector 11x1 (V at step i)
newV = V; % (V at step i+1)
Delta = 2*tol; % ensure initial Delta is greater than tolerance
i=0;
del=[];
while Delta > tol % keep approximating while not met the tolerane level
    for priorState = 1 : S
        if Absorbing(priorState) % do not update absorbing states
            continue;
        end
        tmpV = 0;
        for action = 1 : A
            tmpQ = 0;
            for postState = 1 : S
                tmpQ = tmpQ + T(postState,priorState,action)*(R(postState,priorState,action) + gamma*V(postState));
            end
            tmpV = tmpV + Policy(priorState,action)*tmpQ;
        end
        newV(priorState) = tmpV;
    end
    diffVec = abs(newV - V);
    Delta = max(diffVec);
    V = newV;
    i=i+1;
    del=[del Delta];
end
% plot(del) % for step 4
end
