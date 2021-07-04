function scaledImg = interpolate(originalImg)
    %Billinear interpolation to increase the number of pixels in the image
    [m,n] = size(originalImg);
    temp = zeros(2*m, 2*n);
    scaledImg = zeros(2*m,2*n);
 
    k = 1; % running index for the scaled Image
    % Inserting rows to obtain temp
    for i = 1:m
        for j = 1:n
            temp(k,j) = originalImg(i,j); % putting the original row
        end
        k = k+1;
        % inserting a row
        if i<m
            for j = 1:n
                temp(k,j) = (originalImg(i,j) + originalImg(i+1, j))/2;
                
            end
            k = k+1;   
       
        elseif i==m 
            for j = 1:n
                temp(k,j) = originalImg(i,j); % putting the original row
            end
        end
    end

    % Inserting columns to obtain final scaledImg
    k = 1;
    for i = 1:n
        for j = 1:(2*m)
            scaledImg(j,k) = temp(j,i); % putting the original row
        end
        k = k+1;
        % inserting a new column
        if i<n
            for j = 1:(2*m)
                scaledImg(j,k) = fix((temp(j,i) + temp(j,i+1))/2);
            end
            k = k+1;   
       
        elseif i==n 
            for j = 1:(2*m)
                scaledImg(j,k) = temp(j,i); % putting the original row
            end
        end
    end
    scaledImg = uint8(scaledImg);

end