function [ fitnesses ] = GetFitness( pop, functionName )


fitnesses = eval([functionName,'(pop)']);
%fitnesses = F2(pop);

end

