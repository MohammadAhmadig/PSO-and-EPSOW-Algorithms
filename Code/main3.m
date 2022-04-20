clear all;close all;clc;




c1 = 2;
c2 = 2;
popSize = 20;
n = 10;
maxIteration = 100;
w = 0.4 + (0.9 - 0.4) * rand(popSize, 1);
xMax = 100;
xMin = -100;
epsilon = eps;
maxTest = 90;
optimomSolutions = [0 0;0 0;0.7 0.5;0 0;0 0;0 0];


fitnessHistory = zeros(popSize,maxTest);



for functionTurn = 1:6
    
 %   functionTurn = 1;
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




        end

        
        fitnessHistory(:,test) = fitnesses;
        
        
    end

    ShowMenStdForPSO( fitnessHistory, functionTurn );
    


    
end




