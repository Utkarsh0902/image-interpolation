clear;
ImgName = input("Enter the name of the image (without quotes):",'s'); %eg: leaf.jpg
originalImg = imread(ImgName);
s = size(size(originalImg)); % To check if the image is grayscale or colour
if isequal(s,[1,2])
    "Image is grayscale"
    scaledImg = interpolate(double(originalImg));
    correctedScaled = correctedInterpolate(double(originalImg));

elseif isequal(s,[1,3])
    "Image is color"
    [R,G,B] = imsplit(originalImg); %split into R,G,B matrices
    scaledR = interpolate(double(R));
    scaledG = interpolate(double(G));
    scaledB = interpolate(double(B)); 
    scaledImg = cat(3,scaledR,scaledG,scaledB); %concatenate the scaled R,G,B matrices
    
    correctedscR = correctedInterpolate(double(R));
    correctedscG = correctedInterpolate(double(G));
    correctedscB = correctedInterpolate(double(B));
    correctedScaled = cat(3,correctedscR,correctedscG,correctedscB);
    
end
%imtool(originalImg)
%imtool(scaledImg)
%imtool(correctedScaled)
imwrite(correctedScaled,'newLogo.jpeg','JPEG');

% Uncomment these lines to compare the images with pre-existing
% Interpolation techniques
%imtool(originalImg,'Interpolation','bilinear')
%imtool(originalImg,'Interpolation','nearest')

