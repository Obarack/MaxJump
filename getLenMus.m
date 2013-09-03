function newLen = getLenMus()

global O In;

% newLen(3) = sqrt( norm(J(2,:)-O(3,:))^2 + norm(J(2,:)-In(3,:))^2 ...
%     - 2*norm(J(2,:)-O(3,:))*norm(J(2,:)-O(3,:))*cos(pi-theta(2)+theta(1)) );
n = length(O);
newLen = zeros(n,1);
for i = 1:n
    newLen(i) = norm(O(i,:)-In(i,:));
end