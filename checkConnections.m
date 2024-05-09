function [V,m,s,flag] = checkConnections(map,V,num)
%Checks whole matrix to see which particles are connected in a cluster and reformat V to
%ensure no double counting. Also reports the mass and size of each new
%cluster.

sz = size(map);
N = sz(1)-1;
connect=0;
h=1;
m=0;
s=0;
flag=0;

for a = 1:num %Outer loop goes through V
    i = V(a,1);
    j = V(a,2);
    for b = 1:num%INNER LOOP GOES THROUGH V again TO COMPARE
        k = V(b,1);
        l = V(b,2);
        index = V(b,3);
        if ((l==j && (k==i+1 || k==i-1)) || (k==i && (l==j-1 || l==j+1))) && (V(a,3) ~= index)%if theres an occupied place next to the i,j index AND if it's not part of the cluster
            V(b,3) = V(a,3); %make it part of the cluster
            connect=1;
            for c=1:num 
                if V(c,3)==index %and make the whole cluster
                    V(c,3)=V(a,3); %part of the new cluster
                end
            end
         elseif ((i==1 && k==i && l==j+N) || (i+1>sz(1) && k==i && l==j-N) || (j==1 && l==j && k==i+N) || (j+1>sz(1) && l==j && k==i-N)) && (V(a,3) ~= index) %if at a boundary ,also check the locations at PBCs
            V(b,3) = V(a,3); %make it part of the cluster
            connect=1;
            for c=1:num 
                if V(c,3)==index %and make the whole cluster
                    V(c,3)=V(a,3); %part of the new cluster
                end
            end
        end
    end
    if connect ==1 %if cluster found a succcessful connection, measure mass and size
        [sz,flag] = findSize(V,V(a,3),map);
        mass = findMass(V,V(a,3));
        m(h) = mass;
        s(h)=sz;
        h=h+1;
        connect=0;     
    end
end

    

