function p=gausslik(x,w)
    for i=1:length(x)
        p(i)=1/(sqrt(2*pi*w(2)^2))*exp(-(x(i)-w(1))^2/(2*w(2)^2));
    end
end

