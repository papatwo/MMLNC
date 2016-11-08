%% Question 2
mygamma = 0.91;
tol = 0.001;
[S, A, T, R, StateNames, ActionNames, Absorbing] = chain1(); % define transition prob and reward
[UnbiasedPolicy] = GetUnbiasedPolicy(Absorbing, A) % get unbiased policy
[V,i,del] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, mygamma, tol); % value function for unbiased policy

%% Question 3
% a.
p_stay=0.24;
p_move=0.76;
p_lu=0.5;
p_ru=0.5;
% Trace 1: s4 ¡ú s5 ¡ú s6 ¡ú s7
p_t1= p_ru * p_move * p_ru * p_move *p_ru * p_move;
% Trace 2: s4 ¡ú s5 ¡ú s6 ¡ú s7
p_t2= p_ru * p_move * p_ru * p_move *p_ru * p_move;
% Trace 3: s4 ¡ú s3 ¡ú s4 ¡ú s5 ¡ú s6 ¡ú s7
p_t3= p_lu * p_move * p_ru * p_move *p_ru * p_move * p_ru * p_move * p_ru * p_move;
% Likelihood
L_u=p_t1 * p_t2 * p_t3;

% b.


%%