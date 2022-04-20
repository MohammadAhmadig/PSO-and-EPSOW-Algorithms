function [ pop, v ] = Initialization( popSize, n, xMax, xMin )

%pop = RandWithin( xMax, xMin, m, n );
pop =  repmat(xMin,[popSize,1]) + repmat((xMax - xMin),[popSize,1]).* rand(popSize,n);

%v = repmat(vMin,[popSize,1]) + repmat((vMax - vMin),[popSize,1]).* rand(popSize,n);
v = zeros(popSize,n);

end

