function calcMomentArm()

global M J O In;

% M = [ moment([O(1,1) O(1,2)],[In(1,1) In(1,2)],[J(2,1) J(2,2)]) ...
%     moment([O(2,1) O(2,2)],[In(2,1) In(2,2)],[J(2,1) J(2,2)]) ...
%     moment([O(3,1) O(3,2)],[In(3,1) In(3,2)],[J(2,1) J(2,2)]) ...
%     moment([O(4,1) O(4,2)],[In(4,1) In(4,2)],[J(2,1) J(2,2)]) 0 0 0 0;
%     ...
%     0 0 0 0 moment([O(5,1) O(5,2)],[In(5,1) In(5,2)],[J(3,1) J(3,2)]) ...
%     0 moment([O(7,1) O(7,2)],[In(7,1) In(7,2)],[J(3,1) J(3,2)]) 0;
%     ...
%     0 0 0 0 0 moment([O(6,1) O(6,2)],[In(6,1) In(6,2)],[J(4,1) J(4,2)]) 0 ...
%     moment([O(8,1) O(8,2)],[In(8,1) In(8,2)],[J(4,1) J(4,2)])];
 % 
M = [ 0 ...
    0  ...
    moment([O(3,1) O(3,2)],[In(3,1) In(3,2)],[J(2,1) J(2,2)]) ...
    0 0 0 0 0;
    ...
    0 0 0 0 0 ...
    0 0 0;
    ...
    0 0 0 0 0 0 0 ...
    0];