function [x ceMdl] = contElemModel(lM0, P0)
% computes the model for contractile element
% lM0: slack length of each muscle
% P0 : peak force

n = length(lM0);
for i = 1:n
    mu = lM0(i);
    sigma = 0.2*mu;
    x(i,:) = (mu - 4 * sigma) : (sigma / 100) : (mu + 4 * sigma);
    ceMdl(i,:) = normpdf(x(i,:), mu, sigma);
    maxD = max(ceMdl(i,:));
    ceMdl(i,:) = (ceMdl(i,:)/maxD) * P0(i);
    
%     a = 1/(sigma*sqrt(2*pi));
%     fx(i,:) = exp(- ((x(i,:)-mu).^2)/(2*sigma.^2));
%     maxD = max(fx(i,:));
%     fx(i,:) = (fx(i,:)/maxD) * P0(i);
end

% plot(x(n,:), ceMdl(n,:));
% figure
% plot(x(n,:), fx(n,:));