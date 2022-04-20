function [ pop, v, fitnesses, pBest, gBest, pBestFitness, gBestFitness ] = UpdateNew(  pop, fitnesses, v, pBest, pBestFitness, gBest, gBestFitness, epsilon, alpha, c2, c3, c4, w, functionName )

[popSize, D] = size(pop);



index = rand(popSize,1) <= alpha;

XWeightedResult = XWeighted( pBest, pBestFitness, fitnesses, epsilon );
XWeightedResultFitness = GetFitness(XWeightedResult, functionName);

if XWeightedResultFitness < gBestFitness
    gBest = XWeightedResult;
    gBestFitness = XWeightedResultFitness;
end

countWhereSmallerThanAlpha = sum(index);

phi4 = c4 * rand(countWhereSmallerThanAlpha,1);

v(index,:) = zeros(countWhereSmallerThanAlpha,D);
pop(index,:) = pop(index,:) + repmat(phi4,[1,D]) .* (repmat(XWeightedResult,[countWhereSmallerThanAlpha,1]) - pop(index,:));



countWhereBiggerThanAlpha = popSize - countWhereSmallerThanAlpha;

phi3 = c3 * rand(countWhereBiggerThanAlpha,1);
phi2 = c2 * rand(countWhereBiggerThanAlpha,1);

c1 = -(phi2 + phi3);
phi1 = c1 .* rand(countWhereBiggerThanAlpha,1);

randomIndex = randi(popSize,[countWhereBiggerThanAlpha,1]);


v(~index,:) = repmat(w(~index),[1,D]) .* v(~index,:) ...
    + repmat(phi1 + phi2 + phi3,[1,D]) .* (pBest(randomIndex,:) - pop(~index,:)) ...
    + repmat(phi2,[1,D]) .* (repmat(gBest,[countWhereBiggerThanAlpha,1]) - pBest(randomIndex,:)) ...
    + repmat(phi3,[1,D]) .* (repmat(XWeightedResult,[countWhereBiggerThanAlpha,1]) - pBest(randomIndex,:));

pop(~index,:) = pop(~index,:) + v(~index,:);

fitnesses = GetFitness(pop, functionName);

[ pBest, pBestFitness ] = SaveIfIsBetter( pop, pBest, fitnesses, pBestFitness );

[ gBest, gBestFitness ] = SaveIfIsBetter( pBest, gBest, pBestFitness, gBestFitness );



end

