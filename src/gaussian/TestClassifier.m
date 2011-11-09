load('CourseworkData.mat');

% Normalise the input data
inputs = NormaliseData(inputs, 'minrange');

% ******************************************************************************************************************
% ******************************************************************************************************************
% Train using half of the dataset
% Comment this out to use other training
MidVal = (length(inputs) - mod(length(inputs), 2)) / 2;
TrainInputs = inputs(1:MidVal,:);
TrainOutputs = outputs(1:MidVal,:);

p = TrainClassifier(TrainInputs,TrainOutputs);              % Train classifier

ErrorIndex = zeros(285,2);
Error = 0;
for i = MidVal+1:length(inputs)
    Class = Classifier(inputs(i,:), p);
    if (Class ~= outputs(i))                                % Check against expected value
        Error = Error + 1;
        ErrorIndex(i - MidVal,1) = i;
        ErrorIndex(i - MidVal,2) = Class;
    end
end

% ******************************************************************************************************************
% ******************************************************************************************************************


% % ******************************************************************************************************************
% % ******************************************************************************************************************
% % % Train using "leave-one-data-point-out strategy"
% 
% ErrorIndex = zeros(length(inputs),2);
% Error = 0;
% 
% for point = 1:length(inputs)                            % Loop all points
%     tmpInputs = inputs;
%     tmpInputs(point,:) = [];                            % Remove current test point from the inputs
%     tmpOutputs = outputs;
%     tmpOutputs(point) = [];                             % Remove current test point from the outputs
%     p = TrainClassifier(tmpInputs, tmpOutputs);         % Leave point out and train
%     Class = Classifier(inputs(point,:), p);             % Test on point
% 
%     if (Class ~= outputs(point))                        % Compare with expected value
%         Error = Error+1;                                % Increment error if point is misclassified
%         ErrorIndex(point,1) = point;
%         ErrorIndex(point,2) = Class;
%     end
% end
% % TrainInputs = inputs(2,:);
% 
% % ******************************************************************************************************************
% % ******************************************************************************************************************


% %% Separate classes
% [C, I] = sort(outputs);
% nOfZeros = sum(C == 0);
% nOfOnes = sum(C == 1);
% 
% Class0 = zeros(nOfZeros, 30);
% for point = 1:nOfZeros
%     Class0(point,:) = inputs(I(point),:);                  % Store point as a point belonging to class 0
% end
% 
% Class1 = zeros(nOfOnes, 30);
% for point = 1:nOfOnes
%     Class1(point,:) = inputs(I(point + nOfZeros),:);       % Store point as a point belonging to class 1
% end
% 
% tmpInputs = [Class0(1:length(Class0)/2,:)', Class1(1:length(Class1)/2,:)']';
% tmpOutputs = [C(1:length(Class0)/2)', C(nOfZeros+1:nOfZeros+length(Class1)/2)']';
% 
% tmpTestI = [Class0(length(Class0)/2 +1:length(Class0),:)', Class1(length(Class1)/2:length(Class1),:)']';
% tmpTest0 = [C(length(Class0)/2 +1:length(Class0))', C(nOfZeros+length(Class1)/2:nOfZeros+length(Class1))']';
% 
% ErrorIndex = zeros(length(tmpTestI),2);
% eclass = zeros(length(tmpTestI),1);
% Error = 0;
% foo = 0;
% 
% for point = 1:length(tmpTestI)
% 
%     p = TrainClassifier(tmpInputs, tmpOutputs);         % Leave point out and train
%     Class = Classifier(tmpTestI(point,:), p);             % Test on point
% 
%     if (Class == tmpTest0(point))                        % Compare with expected value
%         Error = Error-1;                                % Increment error if point is misclassified
%         ErrorIndex(point,1) = -1;
%         ErrorIndex(point,2) = Class;
%     else
%         foo = foo + 1;
%         ErrorIndex(point,1) = point;
%         ErrorIndex(point,2) = Class;
%     end
% 
%     eclass(point) = tmpTest0(point);
% 
%     if (Class == 1)
%         a = 1;
%     end
