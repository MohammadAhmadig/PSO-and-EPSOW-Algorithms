function [ best, bestFitnesses ] = SaveIfIsBetter( pop, best, fitnesses, bestFitnesses )


if size(best,1) > 1
    index = fitnesses < bestFitnesses;
    bestFitnesses(index) = fitnesses(index);
    best(index,:) = pop(index,:);
else
    [v, index] = min(fitnesses);
    if v < bestFitnesses
        bestFitnesses = v;
        best = pop(index,:);
    end
end


end

