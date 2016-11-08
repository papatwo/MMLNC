function [S, A, T, R, StateNames, ActionNames, Absorbing] = chain1()

% Number of states
S = 7; 
StateNames =  ['s01'; 's02'; 's03'; 's04'; 's05'; 's06'; 's07'];
% States are laid out as follows:
%  index             name
% 1 2 3 4 5 6 7      S1 S2 S3 S4 S5 S6 S7
%    --> 


% Number of actions
A = 2; 
ActionNames = ['L'; 'R'];
% Actions are as follows: 
%index       name
% 1    -->   L
% 2    -->   R


% Matrix indicating absorbing states
Absorbing = [
%1  2   3   4   5   6   7  STATE 
1   0   0   0   0   0   1  
];

% load transition
T = transition_matrix();

% load reward matrix
R = reward_matrix(S,A);

%--------------------------------------------------------------------------

% get the transition matrix (defined as local function)
function T = transition_matrix()
%
% 1 2 3 4       S1 S2 S3  S4
% 5 # 6 7   --> S5 #  S6  S7
% 8 9 10 11     S8 S9 S10 S11
%
TR = [
%1    2     3     4     5     6     7   FROM STATE 
1     0     0     0     0     0     0  ; % 1 TO STATE
0   0.24    0     0     0     0     0  ; % 2
0   0.76  0.24    0     0     0     0  ; % 3
0     0   0.76   0.24   0     0     0  ; % 4
0     0     0    0.76  0.24   0     0  ; % 5
0     0     0     0    0.76  0.24   0  ; % 6
0     0     0     0     0    0.76   1  ; % 7
];
%
TL = [
%1    2     3     4     5     6     7   FROM STATE 
1   0.76    0     0     0     0     0  ; % 1 TO STATE
0   0.24  0.76    0     0     0     0  ; % 2
0     0   0.24   0.76   0     0     0  ; % 3
0     0     0    0.24  0.76   0     0  ; % 4
0     0     0     0    0.24  0.76   0  ; % 5
0     0     0     0     0    0.24   0  ; % 6
0     0     0     0     0     0     1  ; % 7
];
%

%
% T(2,2,1) = 0.24 % i.e. 1th matrix tW, 2rd row, 2th column (postState,priorState, action)
T = cat(3, TR, TL); % transition probabilities for each action 

%--------------------------------------------------------------------------

% the reward function (defined as a local function - subfunction)
function rew = reward_function(priorState, a, postState) % reward function (defined locally)
if ((priorState == 2) && (postState == 1))
    rew = -10;
elseif ((priorState == 6) && (postState == 7))
    rew = 10;
elseif priorState > postState 
    rew = 1;
else
    rew = -1;
end

% get the reward matrix (defined as a local function - subfunction)
function R = reward_matrix(S, A)
% i.e. 11x11 matrix of rewards for being in state s, performing action a and ending in state s'
R = zeros(S, S, A); 
for i = 1:S
   for j = 1:A
      for k = 1:S
         R(k, i, j) = reward_function(i, j, k);
      end
   end    
end

