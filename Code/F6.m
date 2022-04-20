function [ fitnesses ] = F6( pop )

fitnesses = sum(pop .^ 2 - 10 * cos(2 * pi * pop) + 10,2);

end

