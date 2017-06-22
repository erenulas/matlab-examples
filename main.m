function main


%Read image from file
ilkresim=imread('birds2.jpg');
%Displays the original image
figure, imshow('birds2.jpg');
%Read mask from file
maske=imread('temp.jpg');
%Displays the temp
figure, imshow('temp.jpg');

% Here we find white pixels and assing their position to an row and column
% vectors
[row,col] = find(maske>252);
%find first white pixel's row
rowstart=row(1);
%find last white pixel's row
rowend=row(end);
%find first white pixel's column
colstart=col(1);
%find last white pixel's column
colend=col(end);

%Start timer
tic;
%Invokes the function without loop
imageWithoutLoop = reverseImageWithoutLoop(ilkresim,rowstart,rowend,colstart,colend);
%End timer and show elapsed time
reverseImageWithoutLoopTime = toc;
%Displays the running time for the function without loop
disp(reverseImageWithoutLoopTime);

%Start timer
tic;
%Invokes the function with loop
imageWithLoop = reverseImageLoop(ilkresim,rowstart,rowend,colstart,colend);
%End timer
reverseImageLoopTime = toc;
%Displays the running time for the function with loop
disp(reverseImageLoopTime);

%Save the output images into the files
imwrite(imageWithoutLoop,'reversedWithoutLoop.jpg');
imwrite(imageWithLoop,'reversedLoop.jpg');

end
%End of main function
