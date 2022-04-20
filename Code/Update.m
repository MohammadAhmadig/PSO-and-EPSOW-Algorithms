function [ pop, v, fitnesses, pBest, gBest, pBestFitness, gBestFitness ] = Update( pop, v, w, c1, c2, pBest, pBestFitness, gBest, gBestFitness, functionName )

[popSize ,n] = size(pop);

v = repmat(w,[1,n]) .* v + c1 * (pBest - pop) .* repmat(rand(popSize,1),[1,n]) + c2 * (repmat(gBest,[popSize,1]) - pop) .* repmat(rand(popSize,1),[1,n]);

pop = pop + v;

fitnesses = GetFitness(pop, functionName);
    
[ pBest, pBestFitness ] = SaveIfIsBetter( pop, pBest, fitnesses, pBestFitness );

[ gBest, gBestFitness ] = SaveIfIsBetter( pBest, gBest, pBestFitness, gBestFitness );

end

