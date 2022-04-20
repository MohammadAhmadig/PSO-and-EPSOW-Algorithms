function [ fitnesses ] = F2( pop )

pop = abs(pop);
fitnesses = sum(pop,2) + prod(pop,2);

end

