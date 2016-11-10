%% Question 2
% clear all
mygamma = 0.91;
tol = 0.001;
[S, A, T, R,StateNames, ActionNames, Absorbing] = chain1(); % define transition prob and reward
[UnbiasedPolicy] = GetUnbiasedPolicy(Absorbing, A); % get unbiased policy
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
trace={};seq={};R={};V_mc={};V_mcall={}; 
R_mat=zeros(length(trace),7); % first visited return matrix
                                % row: trace number
                                % col: state

for i=1:10
    % initialise every trace
    temp=[4];
    current=4;
    t=[]; 
    prior=[];
    priorStep=[];
    rew=[];

    
    
    while current>1 && current<7
        if rand(1)>=0.5 % move to right
            if rand(1)>=0.24 %move
                prior=current; % store the last step
                current=current+1; % increment current step
                if current==7
                   t=[t,StateNames(prior,:),',R',',10']; % move to the absorbing state
                   rew=[rew 10];
                else
                   t=[t,StateNames(prior,:),',R',',-1,']; % move to next transition state
                   rew=[rew -1];
                end
            else
                prior=current; % store the last step but not increment current step
                t=[t,StateNames(prior,:),',R',',0,']; % stay
                rew=[rew 0];
            end
        else % move to the left
            if rand(1)>=0.24 % move
                prior=current;
                current=current-1;
                 if current==1
                   t=[t,StateNames(prior,:),',L',',-10'];
                   rew=[rew -10];
                else
                   t=[t,StateNames(prior,:),',L',',1,'];
                   rew=[rew 1];
                end
            else
                prior=current;
                t=[t,StateNames(prior,:),',L',',0,'];
                rew=[rew 0];
            end
        end
        temp=[temp current]; % update all the states visited
        priorStep=[priorStep prior]; % update all the prior states visited
     end
trace{i}=temp; % store the finished trace
seq{i,1}=t; % store the finished path
R{i}=rew; % store the reward for this trace (for monte-carlo policy evaluation aim)

[unitrace, uni_i]=unique(trace{i},'stable'); % get the first visited state and their idx
v_mc=[];
for c=1:length(temp)-1 % 
    v_mc(c) = mc(temp,c,mygamma,rew);
end
% V_mcall{i}=v_mc; % Return for all visited states. A check reference for
% % return of first visted states
V_mc{i}=[v_mc(uni_i(1:end-2)) v_mc(end)]; % return for first visited states



for g=1:length(unitrace)-1 % ignore absorbing state (return for absorbing state is 0)
    for m=1:7
            if unitrace(g)==m
                if g<length(unitrace)-1 % return has one less value than trace does
                    R_mat(i,m)=V_mc{i}(g);
                else 
                    R_mat(i,m)=V_mc{i}(g);
                end
            end
    end
end

end

avg_R=sum(R_mat,1)./sum(R_mat~=0,1) % calculate the mean for each state over ten traces


%% Question 5



