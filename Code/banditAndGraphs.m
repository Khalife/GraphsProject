


%Plot graphs
addpath('gplotdc')


%Strongly observable graph
n=5;
W=strongGraph(n);
%coord=[[0:(1/n):1]',[0:(1/n):1]'];
coord=randn(n,2);
gplotdc(W,coord,'LineWidth',2,'MarkerSize',8);

%Weakly observable graph
W=weakGraph()

%Non observable graph


