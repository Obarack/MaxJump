function ppe = passElemF(lenMuscle, lM0)

n = length(lenMuscle);
ppe = zeros(n,1);
for i = 1:n
    if lenMuscle(i) <= lM0(i)
        ppe(i) = 0;
    else
        lDiff = lenMuscle(i) - lM0(i);
        ppe(i) = exp( lDiff );
    end
end
