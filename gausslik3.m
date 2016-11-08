function L=gausslik3(x,mu,sigma)
for lm=1:length(mu)
    for ls=1:length(sigma)
        for i=1:length(x)
            temp(i)=1/(sqrt(2*pi*sigma(ls)^2))*...
                exp(1/(2*sigma(ls)^2)*sum(-(x-mu(lm)).^2));%error!!!
        end
        L(lm,ls)=prod(temp);
    end
end
end