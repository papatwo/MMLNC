function  [OptimalPolicy] = ValueIteration(T, R, Absorbing, gamma, tol)
S = 11; % number of states - introspecting transition matrix
A = 4; % number of actions - introspecting policy matrix
V = zeros(S, 1); % optimal value function vector 11x1 (V at step i)
newV = V; % (V at step i+1)
Delta=2*tol;
while Delta > tol % keep approximating while not met the tolerane level
    for priorState = 1 : S
        if Absorbing(priorState) % do not update absorbing states
            continue;
        end
        for action = 1 : A
            tmpQ = 0;
            for postState = 1 : S
                tmpQ = tmpQ + T(postState,priorState,action)*(R(postState,priorState,action) + gamma*V(postState));
            end
        end
        newV(priorState) = tmpQ;
    end
    diffVec = abs(newV - V);
    Delta = max(diffVec);
    V = newV;


end
 [OptimalPolicy] = GreedyPolicyFromV(V, T, R, Absorbing, gamma);

end