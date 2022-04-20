clear all;close all;clc;




c1 = 2;
c2 = 2;
c3 = 1;
c4 = 2;
popSize = 20;
n = 10;
maxIteration = 100;
w = RandWithin( 0.55, 0.5, popSize, 1);
xMax = 100;
xMin = -100;
epsilon = eps;
maxTest = 90;
optimomSolutions = [0 0;0 0;0.7 0.5;0 0;0 0;0 0];
alpha = 0.2:0.1:0.8;



fitnessHistory = zeros(popSize,maxTest);


for functionTurn = 1:6
    
    
    functionName = ['F',num2str(functionTurn)];
    

    for alphaTest = 1:length(alpha)


        for test = 1:maxTest


            [pop ,v] = Initialization(popSize, n, repmat(xMax,[1,n]), repmat(xMin,[1,n]));

            fitnesses = GetFitness(pop, functionName);

            pBest = pop;
            pBestFitness = fitnesses;

            gBest = Inf(1,n);
            gBestFitness = Inf;
            [ gBest, gBestFitness ] = SaveIfIsBetter( pBest, gBest, pBestFitness, gBestFitness );

            for iteration = 1:maxIteration


                
                [ pop, v, fitnesses, pBest, gBest, pBestFitness, gBestFitness ] = UpdateNew(  pop, fitnesses, v, pBest, pBestFitness, gBest, gBestFitness, epsilon, alpha(alphaTest), c2, c3, c4, w, functionName );
                

            end
            
            
            fitnessHistory(:,test) = fitnesses;

        end

        
        GetMinMaxMenStd( fitnessHistory, alpha, alphaTest, functionTurn );
    
    
    end

    
    


end












