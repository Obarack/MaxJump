
%O origin coordinates x,y
%In Insertion coordinates x,y
%J Joint coordinates x,y
function ma = moment(O,In,J)


L1 = sqrt((O(1)-J(1))^2+(O(2)-J(2))^2);
L2 = sqrt((In(1)-J(1))^2+(In(2)-J(2))^2);
L3 = sqrt((O(1)-In(1))^2+(O(2)-In(2))^2);
b = real(acos((L2^2+L3^2-L1^2)/(2*L2*L3)));
ma = L2*real(sin(b));
