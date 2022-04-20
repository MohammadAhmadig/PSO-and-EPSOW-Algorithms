function [ fitnesses ] = F1( pop )

fitnesses = sum(pop .^ 2,2);

end

