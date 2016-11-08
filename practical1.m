load hospital
%% 1
muW=mean(hospital.Weight); % answer 154
medW = median(hospital.Weight); % answer 142.5
sW = std(hospital.Weight); % answer 26.57
%The Normal Distribution has mean, median and mode all equal. Therefore looking at the data, one could
%possibly assume that the weight data is normally distributed since the mean (154 lb) and median (142.5 lb) are
%almost equal.

%% 2
hist(hospital.Weight);
xlabel('weight [lb]'); ylabel('occurance')
title('Histogram of patient weights')
%the data is bimodal and therefore is not normally distributed as previously assumed

%% 3
n = 6; % number of iterations
for ii = 1 : n
    numBins = 10*ii; % increase bin size by 10 each time
    subplot(2,3,ii); hist(hospital.Weight,numBins);
    title(['# bins: ' num2str(numBins)])
    % only label the outside axes
    if ii == 1 || ii == 4
        ylabel('occurance')
    end
    if ii == 4 || ii == 5 || ii == 6
        xlabel('weight [lb]')
    end
end
%the cleanest representation is for the bin size of 20, while anything of bin size above
%40 becomes too detailed, distracting away from the structure.

%There is no ¡¯best¡¯ number of bins and different bin sizes can reveal various features of the data. If one does not
%know much about the data set, the bin sizes can be selected using the following steps
%? Find the range of the data (i.e. min and max values ¨C in our case the weight data range is 202 - 111 = 91)
%1 minW = min(hospital.Weight);
%2 maxW = max(hospital.Weight);
%3 rangeW = maxW - minW;
%? A rule of thumb could be to select bin width (h) equalling to 5% of the range (in our case 5% ¡Ö 5).
%? The number of bins (k) is therefore k =range/h (in our case this gives k=18 bins)

%% 4
locationOfBinsVector = [0:5:250];
subplot(2,1,1); hist(hospital.Weight,locationOfBinsVector);
axis([0 250 0 15])
xlabel('weight [lb]'); ylabel('frequency');
title('Histogram of patient weights')
[frequencies,locationOfBins] = hist(hospital.Weight,locationOfBinsVector);
N = sum(frequencies);
pWeight = frequencies./N; % all n_i/N
% check total prob adds to 1
subplot(2,1,2); plot(locationOfBins,pWeight,'r-','LineWidth',2);
xlabel('weight [lb]'); ylabel('p(weight)');
title('Emperical Probability Distribution')
legend('p(weight)')

%% 5
% calculate frequencies for each joint occurance of events
locationOfBinsVector = [0:5:250];
nWeights = hist(hospital.Weight,locationOfBinsVector); % all Freqs
N = sum(nWeights); % total # of events
WeightAndSmoker = hospital.Weight(hospital.Smoker==1);
WeightAndNonSmoker = hospital.Weight(hospital.Smoker==0);
WeightAndMale = hospital.Weight(hospital.Sex=='Male');
WeightAndFemale = hospital.Weight(hospital.Sex=='Female');
nWeightAndMale = hist(WeightAndMale,locationOfBinsVector);
nWeightAndFemale = hist(WeightAndFemale,locationOfBinsVector);
nWeightAndSmoker = hist(WeightAndSmoker,locationOfBinsVector);
nWeightAndNonSmoker = hist(WeightAndNonSmoker,locationOfBinsVector);

pWeightAndMale=nWeightAndMale/N;
pWeightAndFemale=nWeightAndFemale/N;
pWeightAndSmoker=nWeightAndSmoker/N;
pWeightAndNonSmoker=nWeightAndNonSmoker/N;

subplot(2,1,1)
plot(locationOfBinsVector,pWeightAndMale,'g-','LineWidth',2); hold on
plot(locationOfBinsVector,pWeightAndFemale,'k-','LineWidth',2);
legend('pWeightAndMale','pWeightAndFemale')
ylabel('frequency'); title('Joint Empirical Probabilities');
subplot(2,1,2)
plot(locationOfBinsVector,pWeightAndSmoker,'m-','LineWidth',2); hold on
plot(locationOfBinsVector,pWeightAndNonSmoker,'b-','LineWidth',2);
xlabel('weight [lb]'); ylabel('frequency');
legend('pWeightAndSmoker','pWeightAndNonSmoker')

%% 6
pSmoker=sum(hospital.Smoker==1)/N;
p_w_con_s=pWeightAndSmoker/pSmoker;
pNonSmoker=sum(hospital.Smoker==0)/N;
p_w_con_ns=pWeightAndNonSmoker/pNonSmoker;
p_marginalWeight_s=(nWeightAndSmoker+nWeightAndNonSmoker)./N;
subplot(2,1,1)
plot(locationOfBinsVector,p_marginWeight_s,'r-','LineWidth',2);hold on
plot(locationOfBinsVector,p_w_con_s,'g-','LineWidth',2);
plot(locationOfBinsVector,p_w_con_ns,'b-','LineWidth',2);
legend('p(weight)','p(w|smoker)','p(w|nonsmoker)');

subplot(2,1,2)
pMale=sum(hospital.Sex=='Male')/N;
p_w_con_m=pWeightAndMale/pMale;
pFemale=sum(hospital.Smoker==0)/N;
p_w_con_fm=pWeightAndFemale/pFemale;
p_marginalWeight_g=(nWeightAndMale+nWeightAndFemale)./N;
plot(locationOfBinsVector,p_marginWeight_s,'r-','LineWidth',2);hold on
plot(locationOfBinsVector,p_w_con_m,'g-','LineWidth',2);
plot(locationOfBinsVector,p_w_con_fm,'b-','LineWidth',2);
legend('p(weight)','p(w|male)','p(w|female)');

%% 7
% how well two measures match each other is the squared difference between the distributions


%% 8
% Based on the empirical conditional distributions (Fig. 3(b)), men are indeed heavier than women. A
% simple classifier could be to use the weight of the input data point to assign it to the women/men output
% category based on: which center of the distribution the input weight is closest to

%% 9


%% 10
% p(weight and gender)[joint prob]=p(gender)[marginal prob]*p(
% weight|gender)[conditional]