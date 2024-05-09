function [szs,P,avgs] = probDist(V,map)
%finds the size of each cluster and then determines how many clusters have
%the same size in order to generate a probability distribution

clusters=unique(V(:,3));
Nclusters = max(size(clusters));

%want to get the size of each cluster
for i = 1:Nclusters
    c = clusters(i);
    [s(i),flag,Rg,Rs] = findSize(V,c,map);
end
avgs = mean(s);
[newsz,ia,ic] = unique(s);
P = accumarray(ic,1);
szs = reshape(newsz,[max(size(newsz)) 1]);