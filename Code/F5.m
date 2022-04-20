function [ fitnesses ] = F5( pop )

[popSize, D] = size(pop);

fitnesses = 1 + (F1(pop)/4000) - prod(cos(pop ./ repmat(([1:D]) .^ 0.5,[popSize,1])),2);

end

