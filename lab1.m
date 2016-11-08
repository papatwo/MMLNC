%question 1
avg=mean(hospital.Weight)
sstd=std(hospital.Weight)
mmedian=median(hospital.Weight)
% Normal distribution. As it's median and mean are similar.

%%
%question 2
hist(hospital.Weight)
% It is a normal distribution

%%
%question 3
subplot(2,3,1)
hist(hospital.Weight,5)
title('bin 5')

subplot(2,3,2)
hist(hospital.Weight,10)
title('bin 10')

subplot(2,3,3)
hist(hospital.Weight,20)
title('bin 20')

subplot(2,3,4)
hist(hospital.Weight,30)
title('bin 30')

subplot(2,3,5)
hist(hospital.Weight,40)
title('bin 40')

subplot(2,3,6)
hist(hospital.Weight,50)
title('bin 50')
% Plots from bin 5 to bin 50.
% Bin 20 gives the best display
% The best way to choose bin size is to look at the total number of samples

%%
% question 4
max(hospital.Weight)
locationOfBinsVector=111:5:200
[N,X]=hist(hospital.Weight,locationOfBinsVector)
probability=N./sum(X)