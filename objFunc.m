function j = objFunc(PT)

P0 = [4235; 3590; 1400; 2370; 5400; 930; 2350; 2650];
% assumption: subjects distribute their muscle force  such that the sum of
% the squares of muscle stress is minimized.
% PTi: value of the ith musculotendon force
% P0i: peak isometric strength of the ith muscle
j = sum( (PT./P0).^2 );
