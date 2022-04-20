function [ result ] = XWeighted( pBest, pBestFitness, fitnesses, epsilon )

CbarResult = Cbar(  pBestFitness, fitnesses, epsilon  );

result = sum(repmat(CbarResult,[1,size(pBest,2)]) .* pBest,1);

end

