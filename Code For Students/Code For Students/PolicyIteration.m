function [OptimalPolicy,i] = PolicyIteration(Policy, T, R, Absorbing, gamma)
% policy eval
S = length(Policy); % number of states - introspecting transition matrix
A = length(Policy(1,:)); % number of actions - introspecting policy matrix
V = zeros(S, 1); % optimal value function vector 11x1 (V at step i)
% newV = V; % (V at step i+1)
% delta=
i=0;
oldPolicy=zeros(size(Policy));
while sum(Policy-oldPolicy)~=0
    oldPolicy=Policy;
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
        V(priorState) = tmpV;
    end
%greedy policy
%[V] = PolicyEvaluation(oldPolicy, T, R, Absorbing, gamma, tol);
[Policy] = GreedyPolicyFromV(V, T, R, Absorbing, gamma);
i=i+1;
end
OptimalPolicy=Policy;
end





