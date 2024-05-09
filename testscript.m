%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %
%                         Genesis Quiles-Galarza                         %
%                           CBE 641: Transport                           %
%                   Diffusion Limited Cluster Aggregation                %
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%this script runs for a desired amount of time.

sz = 200;
phi0=0.1;
time=500;

[num,V,map,m,s] = populatemap(sz,phi0);
figure(1)
imagesc(map)
hold on
xlabel('x-coordinate');
ylabel('y-coordinate');

for t = 1:time
    [map,V,m2,s2,flag] = move(map,V,num);
    imagesc(map)
    drawnow;
    if flag==1
        break
    end
    m=[m m2];
    s=[s s2];
end

clusters=unique(V(:,3));
Nclusters = max(size(clusters));

figure(2)
scatter(s,m)
set(gca,'xscale','log')
set(gca,'yscale','log')

[szs,P,avgs] = probDist(V,map);
% figure(3)
% histogram(szs);
% xlabel('Size');
% ylabel('Psize');

%resize for excel
m=reshape(m, [max(size(m)) 1]);
s=reshape(s, [max(size(s)) 1]);