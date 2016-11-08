%% Question 2
clear all
mygamma = 0.91;
tol = 0.001;
[S, A, T, R, t_print,StateNames, ActionNames, Absorbing] = chainnn(); % define transition prob and reward
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
trace={};
for i=1:10
    temp=[4];
    current=4;
    t_print=[];
    k=0;
    
    while (current>1)&&(current<7)
        if rand(1)>=0.5 % move to right
            if rand(1)>=0.24 % chance to move
                current=current+1;
%                 if current==7
%                     t_print=[t_print,StateNames(current-1,:),',R',',10'];
% 
%                 else 
%                     t_print=[t_print,StateNames(current-1,:),',R',',-1,'];
%                 end
%             else
%                 t_print=[t_print,StateNames(current-1,:),',R',',0,'];
            end
        else % move to left
            if rand(1)>=0.24 
                current=current-1;
%                 if current==1
%                     t_print=[t_print,StateNames(current+1,:),',L',',-10'];
%                 else
%                     current=current-1;
%                     t_print=[t_print,StateNames(current+1,:),',L',',1,']; 
%                 end
%             else
%                 t_print=[t_print,StateNames(current+1,:),',L',',0,'];
            end
        end
        temp=[temp current]; 
    end
    trace{i}=temp;
    trace{i}
end

%%
trace={};
for i=1:10
    temp=[4];
    current=4;
    t_print=[];
    k=0;   
while current>1 && current<7
    
        if rand(1)>=0.5
            if rand(1)>=0.24
                current=current+1;
            end
        else
            if rand(1)>=0.24
                current=current-1;
            end
        end
        temp=[temp current]
end
trace{i}=temp
end


