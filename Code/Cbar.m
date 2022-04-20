function [ result ] = Cbar(  pBestFitness, fitnesses, epsilon  )

ChatResult = Chat( pBestFitness, fitnesses, epsilon );
result = ChatResult ./ sum(ChatResult);

end

