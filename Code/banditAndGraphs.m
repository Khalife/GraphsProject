%Plot graphs
addpath('gplotdc')

%Strongly observable graph
n=5;
Wstrong=strongGraph(n);
coord=randn(n,2);
gplotdc(Wstrong,coord,'LineWidth',2,'MarkerSize',8);

%Weakly observable graph
n=10;
W=weakGraph(10);
coord=randn(n,2);
gplotdc(W,coord,'LineWidth',2,'MarkerSize',8);

%Non observable graph
n=10;
W=nonObservableGraph(n);
coord=randn(n,2);
gplotdc(W,coord,'LineWidth',2,'MarkerSize',8);


% Run EXP3G algorithm
gamma=0.2;
eta=0.4;
T=5000;
E=EXP3G(Wstrong,gamma,eta);
E.init();
regret=zeros(T,1);

% sequence of loss functions
lt=abs(randn(size(Wstrong,1),T));


N_monte_carlo=1000;
for n=1:N_monte_carlo
        loss_t=[];
    for t=1:T

        E.play(lt);
        E.update();
        loss_t=[loss_t,lt(E.It,t)];
        regret(t)=sum(loss_t)-min(sum(lt(:,[1:t]),2));

    end
    disp(n);
end
    regret = (1/N)*regret;
