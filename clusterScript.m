%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %
%                         Genesis Quiles-Galarza                         %
%                           CBE 641: Transport                           %
%                   Diffusion Limited Cluster Aggregation                %
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This script runs until the simulation has reached a desired amount of
%clusters.

sz = 200;
phi0=0.05;
time=0;

[num,V,map,m,s] = populatemap(sz,phi0);
figure(1)
imagesc(map)
hold on
xlabel('x-coordinate');
ylabel('y-coordinate');

clusters=unique(V(:,3));
Nclusters = max(size(clusters));
    
while Nclusters > 10
    [map,V,m2,s2,flag] = move(map,V,num);
    imagesc(map)
    title(['t = ' num2str(time)]);
    drawnow;
    m=[m m2];
    s=[s s2];
    time=time+1;
    clusters=unique(V(:,3));
    Nclusters = max(size(clusters));
    if flag==1
        break
    end
end


figure(2)
scatter(s,m)
set(gca,'xscale','log')
set(gca,'yscale','log')


%resize for excel
m=reshape(m, [max(size(m)) 1]);
s=reshape(s, [max(size(s)) 1]);