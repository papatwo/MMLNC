%% 2.1 Grid World 1 - Policy Evaluation / Improvement
 [S, A, T, R, StateNames, ActionNames, Absorbing] = GridWorld1();
%% step 2
gamma = 0.9;
tol = 0.001;
[UnbiasedPolicy] = GetUnbiasedPolicy(Absorbing, A);
[V] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, gamma, tol);

%% Step 3
[V,i] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, gamma, tol);

%% step 4
%uncomment plot command in policyEvaluation script
[V,i,del] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, gamma, tol);
plot(del,'b','linewidth',2)
title('Approximation error Vs iteration')
xlabel('iteration');ylabel('error')
[GreedyPolicy] = GreedyPolicyFromV(V, T, R, Absorbing, gamma);
DisplayFunctionalPolicy(GreedyPolicy, StateNames, ActionNames);
%we have completed a 1 policy evaluation (E) step and 1 policy improvement (I) step.
%% step 5
%change reward in gridworld to -100
[S, A, T, R, StateNames, ActionNames, Absorbing] = GridWorld1();

gamma = 0.9;
tol = 0.001;
[V] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, gamma, tol);

[V,i] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, gamma, tol);

 [GreedyPolicy] = GreedyPolicyFromV(V, T, R, Absorbing, gamma);
 DisplayFunctionalPolicy(GreedyPolicy, StateNames, ActionNames);
 
 
 %% 2.2 Grid World 1 - Policy / Value Iteration
[UnbiasedPolicy] = GetUnbiasedPolicy(Absorbing, A);
[OptimalPolicy,i] = PolicyIteration(UnbiasedPolicy, T, R, Absorbing, gamma);
DisplayFunctionalPolicy(OptimalPolicy, StateNames, ActionNames);
%% step 6
[OptimalPolicy] = ValueIteration(T, R, Absorbing, gamma, tol);
 DisplayFunctionalPolicy(OptimalPolicy, StateNames, ActionNames);