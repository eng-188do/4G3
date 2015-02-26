function [d_reaaranged] = createPostMultiplicationMatrix(dcollapsed, nEntries);
%createPostMultiplicationMatrix create multiplication matrix.

d_reaaranged = zeros(nEntries, nEntries);

for i=1:length(dcollapsed)
    d_reaaranged = d_reaaranged + diag(dcollapsed(i)*ones(1,nEntries-i+1) ,i-1);
end


preMatrix = zeros(nEntries/10, nEntries);
for i=1:nEntries/10
    preMatrix(i, ((i-1)*10+1):i*10 )  = ones(1,10); % insert 1's for 100 ms
end

d_reaaranged = preMatrix * d_reaaranged;

end

