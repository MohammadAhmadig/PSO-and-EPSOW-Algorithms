clear all;close all;clc;




c1 = 2;
c2 = 2;
popSize = 60;
n = 10;
maxIteration = 3000;
w = 0.4 + (0.9 - 0.4) * rand(popSize, 1);
xMax = 100;
xMin = -100;
epsilon = eps;
maxTest = 100;
optimomSolutions = [0 0;0 0;0.7 0.5;0 0;0 0;0 0];




xWeightedHistory = zeros(maxTest,n,maxIteration);
gBestHistory = zeros(maxTest,n,maxIteration);

color = jet(30);

for functionTurn = 1:6
    

    functionName = ['F',num2str(functionTurn)];
    

    for test = 1:maxTest

      
    

        [pop ,v] = Initialization(popSize, n, repmat(xMax,[1,n]), repmat(xMin,[1,n]));

        fitnesses = GetFitness(pop, functionName);

        pBest = pop;
        pBestFitness = fitnesses;

        gBest = Inf(1,n);
        gBestFitness = Inf;
        [ gBest, gBestFitness ] = SaveIfIsBetter( pBest, gBest, pBestFitness, gBestFitness );


        for iteration = 1:maxIteration



            [ pop, v, fitnesses, pBest, gBest, pBestFitness, gBestFitness ] = Update( pop, v, w, c1, c2, pBest, pBestFitness, gBest, gBestFitness, functionName );

            gBestHistory(test,:,iteration) = gBest;
            xWeightedHistory(test,:,iteration) = XWeighted( pBest, pBestFitness, fitnesses, epsilon );



        end

    end

    errorXWeighted = sum(sum(abs(xWeightedHistory - repmat([0 0 0 0 0 0 0 0 0 0 ],[maxTest,1,maxIteration])),2),3);
    errorGBest = sum(sum(abs(gBestHistory - repmat([0 0 0 0 0 0 0 0 0 0 ],[maxTest,1,maxIteration])),2),3);


    subplot(3,2,functionTurn);
    
    plot(1:maxTest, [errorXWeighted,errorGBest], 'LineWidth', 2);
    title(['function ',num2str(functionTurn)]);
    xlabel('test');
    legend('Gbest','Xweigthed');
    ylabel('distance from optimom')

    
end


