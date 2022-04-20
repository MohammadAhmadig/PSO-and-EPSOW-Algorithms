function [ result ] = Chat( pBestFitnesses, fitnesses, epsilon )


pBestFitnessesMaxValue = max(pBestFitnesses);
pBestFitnessesMinValue = min(pBestFitnesses);

result = (pBestFitnessesMaxValue - fitnesses + epsilon) / (pBestFitnessesMaxValue - pBestFitnessesMinValue + epsilon); 


end

