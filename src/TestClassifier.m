load('CourseworkData.mat');
p = TrainClassifier(inputs,outputs);

%p.K = 9;

ErrorIndex = zeros(285,2);
Error = 0;
for i = 285:length(inputs)
    Class = Classifier(inputs(i,:), p);
    if (Class ~= outputs(i))
        Error = Error+1;
        ErrorIndex(i - 284,1) = i;
        ErrorIndex(i - 284,2) = Class;
    else
        ErrorIndex(i - 284,2) = -1;
    end
end   

plot(ErrorIndex(:,1), outputs(ErrorIndex(:,1)),'r', ErrorIndex(:,2), 'b');