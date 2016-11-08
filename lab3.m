%% lab 3

%% 1 a.
x=[-2,-1,1,2];
mu=mean(x); sigma=std(x);

for i=1:length(x)
    log_p(i)=log(1/(sqrt(2*pi*sigma^2)))+(-(x(i)-mu)^2/(2*sigma^2));
end
%1 b.
max_log=max(log_p)

% the data was distributed symetrically

%% 2 a.
x=[-2,-1,1,2];
mu = -5:0.1:5;
sigma = -5:0.1:5;

% Calculate the probability
L=gausslik3(x,mu,sigma);
[X,Y] = meshgrid(mu, sigma);
Z = L;
surf(X,Y,Z)
shading interp
axis tight
colorbar
xlabel('\mu')
ylabel('\sigma')
view(130,30)