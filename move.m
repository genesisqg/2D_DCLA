function [map,V,m,s,flag] = move(map,V,num)
% moves all the clusters/particles in the map by 1 step.

clusters=unique(V(:,3)); %matrix with all the cluster values
Nclusters = size(clusters); %total number of clusters
        
sz = size(map);
N = sz(1)-1;

for a=1:Nclusters
    c=clusters(a); %this is the cluster we currently want to move
    R = randi(10,1);
    if R==1 %move up
        dx=0;
        dy=-1;
    elseif R==2 %move right
        dx=1;
        dy=0;
    elseif R==3 %move down
        dx=0;
        dy=1;
    elseif R==4 %move left
        dx=-1;
        dy=0;
    else
        dx=0;
        dy=0;
    end
    if R<5
        %NEED TO IMPORE PERIODIC BCs
        %check to make sure there's no conflicts with desired move
        [conflicts,newV]=checkConflict(V,num,dx,dy,c,map);
        if conflicts == 0 %if there's no conflicts detected
            V=newV;
        end
    end
end

map=zeros(sz);
l = max(size(V));
%create new matrix ith moved values
for i=1:sz(1)
    for j = 1:sz(1)
        for k = 1:l
            if V(k,1)==i  && V(k,2)==j
                map(i,j)=1;
            end
        end
    end
end
[V,m,s,flag] = checkConnections(map,V,num);
end