%% Question 2
clear all
mygamma = 0.91;
tol = 0.001;
[S, A, T, R,StateNames, ActionNames, Absorbing] = chain1(); % define transition prob and reward
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


%% Question 4
% a.
trace={};seq={};
for i=1:10
    % initialise every trace
    temp=[4];
    current=4;
    t=[];
    prior=[];
    priorStep=[];
    
    
    while current>1 && current<7
        if rand(1)>=0.5 % move to right
            if rand(1)>=0.24 %move
                prior=current; % store the last step
                current=current+1; % increment current step
                if current==7
                   t=[t,StateNames(prior,:),',R',',10']; % move to the absorbing state
                else
                   t=[t,StateNames(prior,:),',R',',-1,']; % move to next transition state
                end
            else
                prior=current; % store the last step but not increment current step
                t=[t,StateNames(prior,:),',R',',0,']; % stay
            end
        else % move to the left
            if rand(1)>=0.24 % move
                prior=current;
                current=current-1;
                 if current==1
                   t=[t,StateNames(prior,:),',L',',-10'];
                else
                   t=[t,StateNames(prior,:),',L',',1,'];
                end
            else
                prior=current;
                t=[t,StateNames(prior,:),',L',',0,'];
            end
        end
        temp=[temp current] % update all the states visited
        priorStep=[priorStep prior] % update all the prior states visited
     end
trace{i}=temp; % store the finished trace
seq{i,1}=t; %store the finished path

end


