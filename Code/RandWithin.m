function [ result ] = RandWithin( upperBound, lowerBand, m, n )

if nargin == 2
    m = 1;
    n = 1;
end

boundry = sort([upperBound lowerBand]);
result = boundry(1) + (boundry(2) - boundry(1)) * rand(m, n);

end

