function scaledImg = correctedInterpolate(originalImg)
    % Billinear interpolation to increase the number of pixels in the image
    [m,n] = size(originalImg);
    temp = zeros(2*m, 2*n);
    scaledImg = zeros(2*m,2*n);
    
    k = 1; % running index for the scaled Image
    % Inserting rows to obtain temp
    for i = 1:m-1
           for j = 1:n
               temp(k,j) = originalImg(i,j); % putting the original row
           end
           k = k+1;
           if i<m-1
               % Inserting a row using interpolation
               for j = 1:n
                   temp(k,j) = (originalImg(i,j) + originalImg(i+1, j))/2;
               end
               k = k+1;
           end
    end
    % Inserting last 3 rows 
    % 3rd last row
    for j = 1:n
        temp(k,j) = (originalImg(i,j)*2/3 + originalImg(i+1,j)*1/3);
    end
    k = k+1;
    % 2nd last row
    for j = 1:n
        temp(k,j) = (originalImg(i,j)*1/3 + originalImg(i+1,j)*2/3);
    end
    k = k+1;
    i = i+1;
    %last row
    for j = 1:n
        temp(k,j) = originalImg(i,j);
    end
    
    %Inserting columns to obtain the final scaledImg
    k = 1;
    for i = 1:n-1
           for j = 1:(2*m)
               scaledImg(j,k) = temp(j,i); % putting the original row
           end
           k = k+1;
           if i<n-1
               % Inserting a row using interpolation
               for j = 1:(2*m)
                   scaledImg(j,k) = (temp(j,i) + temp(j,i+1))/2;
               end
               k = k+1;   
           end
    end
    % Inserting last 3 columns
    % 3rd last column
    for j = 1:(2*m)
        scaledImg(j,k) = temp(j,i)*2/3 + temp(j,i+1)*1/3;
    end
    k = k+1;
    % 2nd last row
    for j = 1:(2*m)
        scaledImg(j,k) = temp(j,i)*1/3 + temp(j,i+1)*2/3;
    end
    k = k+1;
    i = i+1;
    %last row
    for j = 1:(2*m)
        scaledImg(j,k) = temp(j,i);
    end
    
    scaledImg = uint8(scaledImg);
end