function initMuscles(th)
% origins  for each muscle
global J O In l;

%Points for joints, center of mass and end of foot
J(1,1) = 0.1;
J(1,2) = 0;
J(2,1) = J(1,1) - l(1)*cos(th(1));
J(2,2) = J(1,2) + l(1)*sin(th(1));
J(3,1) = J(2,1) + l(2)*cos(pi-th(2));
J(3,2) = J(2,2) + l(2)*sin(pi-th(2));
J(4,1) = J(3,1) - l(3)*cos(th(3));
J(4,2) = J(3,2) + l(3)*sin(th(3));
J(5,1) = J(4,1) + l(4)*cos(pi-th(4));
J(5,2) = J(4,2) + l(4)*sin(pi-th(4));

%centimeters
%TIBANT
O(3,:) = coordinate(0.092,J(2,1),J(2,2),J(3,1),J(3,2));
In(3,:) = coordinate(0.142,J(1,1),J(1,2),J(2,1),J(2,2));
O(3,1) = O(3,1)+J(2,1);
O(3,2) = O(3,2)+J(2,2);
In(3,1) = In(3,1)+J(1,1);
In(3,2) = In(3,2)+J(1,2);

%SOL
O(1,:) = coordinate(0.053,J(3,1),J(3,2),J(2,1),J(2,2));
%O(2,:)=J(3,:);
In(1,:) = coordinate(0.01,J(1,1),J(1,2),J(2,1),J(2,2));
O(1,1) = O(1,1)+J(3,1);
O(1,2) = O(1,2)+J(3,2);
In(1,1) = In(1,1)+J(2,1);
In(1,2) = In(1,2)+J(2,2);

%GAS
O(4,:) = coordinate(0.05,J(3,1),J(3,2),J(4,1),J(4,2));
%O(3,:)=J(3,:);
In(4,:) = coordinate(0.01,J(1,1),J(1,2),J(2,1),J(2,2));
O(4,1) = O(4,1)+J(3,1);
O(4,2) = O(4,2)+J(3,2);
In(4,1) = In(4,1)+J(2,1);
In(4,2) = In(4,2)+J(2,2);

%OPF
O(2,:) = coordinate(0.02,J(3,1),J(3,2),J(2,1),J(2,2));
In(2,:) = coordinate(0.01,J(1,1),J(1,2),J(2,1),J(2,2));
O(2,1) = O(2,1)+J(3,1);
O(2,2) = O(2,2)+J(3,2);
In(2,1) = In(2,1)+J(2,1);
In(2,2) = In(2,2)+J(2,2);

%VAS
%O(5,:)=coordinate(0.14,J(4,1),J(4,2),J(3,1),J(3,2));
In(5,:) = coordinate(0.04,J(3,1),J(3,2),J(2,1),J(2,2));
O(5,1) = J(3,1)+0.02;
O(5,2) = J(3,2);
%O(5,1)=O(5,1)+J(4,1);
%O(5,2)=O(5,2)+J(4,2);
In(5,1) = In(5,1)+J(3,1);
In(5,2) = In(5,2)+J(3,2);

%HAMS
%O(6,:)=coordinate(0.15,J(5,1),J(5,2),J(4,1),J(4,2));
In(7,:) = coordinate(0.04,J(3,1),J(3,2),J(2,1),J(2,2));
O(7,1) = J(4,1)-0.1;
O(7,2) = J(4,2);
%O(6,1)=O(6,1)+J(4,1);
%O(6,2)=O(6,2)+J(4,2);
In(7,1) = In(7,1)+J(3,1);
In(7,2) = In(7,2)+J(3,2);

%GMAX
%O(7,:)=coordinate(0.15,J(4,1),J(4,2),J(5,1),J(5,2));
In(8,:) = coordinate(0.076,J(4,1),J(4,2),J(3,1),J(3,2));
%O(7,1)=O(7,1)+J(4,1);
%O(7,2)=O(7,2)+J(4,2);
O(8,1) = J(4,1)-0.1;
O(8,2) = J(4,2);
In(8,1) = In(8,1)+J(4,1);
In(8,2) = In(8,2)+J(4,2);

%RF
O(6,:) = coordinate(0.05,J(4,1),J(4,2),J(5,1),J(5,2));
In(6,:) = coordinate(0.04,J(3,1),J(3,2),J(4,1),J(4,2));
O(6,1) = O(6,1)+J(4,1);
O(6,2) = O(6,2)+J(4,2);
In(6,1) = In(6,1)+J(3,1);
In(6,2) = In(6,2)+J(3,2);
