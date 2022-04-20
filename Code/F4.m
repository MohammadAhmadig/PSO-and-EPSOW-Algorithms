function [ fitnesses ] = F4( pop )

D = size(pop,2);

fitnesses = -20 * exp(-0.2 * (((1/D) * F1(pop)) .^ 0.5)) - exp((1/D) * sum(cos(2 * pi * pop),2)) + 20 + exp(1);

end

