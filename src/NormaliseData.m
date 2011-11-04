function NormalisedData = NormaliseData(data, norm)
    ssize = size(data);
    NormalisedData = zeros(length(data), ssize(2));
    
    switch norm
        case 'minrange'
            for col = 1: ssize(2)
                NormalisedData(:,col) = (data(:,col)-min(data(:,col)))/(max(data(:,col))-min(data(:,col)));
                
            end
        case 'medianvariance'
            for col = 1: ssize(2)
                 NormalisedData(:,col) = (data(:,col)-median(data(:,col)))/(2*std(data(:,col))^2);
            end   
    end
end