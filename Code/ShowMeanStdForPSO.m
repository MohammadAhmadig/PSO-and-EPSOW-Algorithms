function [  ] = ShowMeanStdForPSO( fitnessHistory, functionTurn )


disp(['functionTurn',num2str(functionTurn)]);

disp(['Best = ',num2str(min(fitnessHistory(:)))]);
disp(['Worst = ',num2str(max(fitnessHistory(:)))]);
disp(['Mean = ',num2str(mean(fitnessHistory(:)))]);
disp(['Std = ',num2str(std(fitnessHistory(:)))]);


end

