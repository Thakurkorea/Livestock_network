clc
clear all
import java.nio.charset.Charset
encoding = Charset.defaultCharset()
load chuksan.mat
load city_coordinates.mat
imagesc(chuksan)
colorbar
%lables={'서울','부산','대구','인천','광주','대전','울산','경기','강원','충청북','충청남','전라북','전라남','경상북','경상남','제주','세종'}
lables={'서울','부산','대구','인천','광주','대전','울산','경기','강원','충청북','충청남','전라북','전라남','경상북','경상남','제주','세종'}
xticklabels(lables)
yticklabels(lables)
xticks(1:1:length(chuksan))
yticks(1:1:length(chuksan))
nodenames=lables
% let's see the inter city graph for livestock transport 
G=digraph(chuksan,nodenames)
p=plot(G)  
p.EdgeCData=G.Edges.Weight; colormap jet; colorbar
p.EdgeFontWeight= 'bold'
p.NodeFontWeight= 'bold'
p.EdgeColor='flat'
p.NodeFontSize=10

% let's find the inter city distances  in LM
dist_data=zeros(length(City_cord));
for i=1:length(City_cord);
    for j=1:length(City_cord);
        distn=acos(cos(deg2rad(90-City_cord(i,2))) * cos(deg2rad(90-City_cord(j,2)))...
            + sin(deg2rad(90-City_cord(i,2))) * sin(deg2rad(90-City_cord(j,2)))...
            * cos(deg2rad(City_cord(i,1)-City_cord(j,1)))) * 6371
        dist_data(i,j)=real(distn)

    end
end 

% plot the distance network figure
figure
G=digraph(dist_data,nodenames)
p=plot(G)  
p.EdgeCData=G.Edges.Weight; colormap jet; colorbar
p.EdgeFontWeight= 'bold'
p.NodeFontWeight= 'bold'
p.EdgeColor='flat'
p.NodeFontSize=10
% plot the heatmap for distances in KM
figure 
imagesc(dist_data)
colorbar
xticklabels(lables)
yticklabels(lables)
xticks(1:1:length(chuksan))
yticks(1:1:length(chuksan))





