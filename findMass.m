function m = findMass(V,c)
%finds mass of a cluster (mass=number of particles)

l = max(size(V));
m=0;
for i=1:l
    if V(i,3)==c
        m=m+1;
    end
end