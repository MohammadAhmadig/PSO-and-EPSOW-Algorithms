function [ fitnesses ] = F3( pop )

fitnesses = sum((100 * ((pop(:,2:end) - (pop(:,1:end - 1) .^ 2)) .^ 2)) + ((1 - pop(:,1:end - 1)) .^ 2),2);
 
% d = size(pop,2);
% sum = 0;
% for ii = 1:(d-1)
% 	xi = pop(:,ii);
% 	xnext = pop(:,ii+1);
% 	new = 100*(xnext-xi.^2)^2 + (xi-1).^2;
% 	sum = sum + new;
% end
% 
% fitnesses = sum;



end

