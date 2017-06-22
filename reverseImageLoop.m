function [lout_Loop] = reverseImageLoop(Im, rowstart, rowend, colstart, colend)


% This function takes the matrix of the image, number of the start row,
% columnn, and the end of the start row, column as inputs for the region which
% will be reversed, and gives the matrix of the image with reversed part as
% an output.
% At first, this function find the middle of the row and column of the matrix of the
% region which will be reversed. After that, it changes every row and
% column from the start with the corresponding row and column from the end,
% and during this process it does that for 3 color channels seperately.
%

% Finds the middle of the row of the region which will be reversed
if mod(rowstart + rowend,2) ~= 0
    control = (rowstart + rowend + 1) / 2;
else
    control = (rowstart + rowend) / 2;
end

% Finds the middle of the column of the region which will be reversed
if mod(colstart + colend,2) ~=0
    control2 = (colstart + colend + 1) / 2;
else
    control2 = (colstart + colend) / 2;
end

k = rowend;

% Changes the entries in the rows from the beginning with the
% corresponding rows from the end
for m = colstart:colend
    for n = rowstart:control
        
        %Changing process for the first color channel
            temp(1,1,1) = Im(n,m,1);
            temp(1,1,2) = Im(n,m,2);
            temp(1,1,3) = Im(n,m,3);
            
        %Changing process for the second color channel
            Im(n,m,1) = Im(k,m,1);
            Im(n,m,2) = Im(k,m,2);
            Im(n,m,3) = Im(k,m,3);
        
        %Changing process for the third color channel
            Im(k,m,1) = temp(1,1,1);
            Im(k,m,2) = temp(1,1,2);
            Im(k,m,3) = temp(1,1,3);
        
        %At each step, k is getting closer to the middle
            k = k-1;
    end
    
    %After changing process is done for the column, rowend is assigned to k, again. 
    k = rowend;
end

k = colend;

% Changes the entries in the columns from the beginning with the corresponding
% columns from the end.
for m = rowstart:rowend
    for n = colstart:control2
        
        %Changing process for the first color channel
        temp(1,1,1) = Im(m,n,1);
        temp(1,1,2) = Im(m,n,2);
        temp(1,1,3) = Im(m,n,3);
        
        %Changing process for the second color channel 
        Im(m,n,1) = Im(m,k,1);
        Im(m,n,2) = Im(m,k,2);
        Im(m,n,3) = Im(m,k,3);
        
        %Changing process for the third color channel
        Im(m,k,1) = temp(1,1,1);
        Im(m,k,2) = temp(1,1,2);
        Im(m,k,3) = temp(1,1,3);
        
        %At each step, k is getting closer to the middle
        k = k-1;
    end
    
    %After changing process is done for the row, colend is assigned to k, again. 
    k = colend;
end

% Assigns the matrix to lout_Loop output, after the process  
lout_Loop = Im(:,:,:);

end