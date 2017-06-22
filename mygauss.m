
%This function has been implemented to find the solution of the system Ax=b 
%by using Gaussian Elimination Method with Scaled Column Pivoting 
%The function takes two inputs. A is an n-by-n matrix
%b is a vector of size n. The function gives two outputs. 'singular'
%indicates whether the matrix A is nonsigular or not.

function [singular,x] = mygauss(A,b)

%finds the length of the matrices
n = length(b);
%Creates the augmented matrix
A = [A b];

% finds the scale factor for each row
for i = (1:n)
    maximum = 0;
    %Moves on the columns of the row i, and compares the entries to find
    %the maximum one, and the indexOfMax.
    for j =(1:n)
    s(i) = abs(A(i,j));
    if(s(i)>maximum)
        maximum = s(i);
        indexOfMax = i;
    end
    end

    % If one of the scale factors is zero, it means that process is not
    % successfull finished
    if(s(i) == 0)
        singular = 1;
        disp('Failure');
        return
    end
    %Keeps the indexOfMax and the maximum entry in the matrices
    nrow(i)=indexOfMax;
    s(i) = maximum;
end


for i = (1:n-1)
    maximum = 0;
    %Finds the greatest ratio and the index of it
    for j=(i:n)
        % if the ratio for the current row is bigger than the previous one,
        % it assigns the current one's ratio to maximum, and its index to
        % indexOfMax
        if((abs(A(nrow(j),i))/s(nrow(j))) > maximum)
            maximum = (abs(A(nrow(j),i))/s(nrow(j)));
            indexOfMax = j;
        end
    end
    %If the element at the row of the maximum ratio and ith column is zero
    %it gives a failure message, and makes the variable 'singular' one.
    if(A(nrow(indexOfMax),i) == 0)
        disp('Failure');
        singular = 1;
        return
    end
    
    %If the row which contains the maximum ratio is not the same row with
    %the nrow(i)th, then it swaps the row numbers of scale factors
    if(nrow(indexOfMax) ~= nrow(i))
        temp = nrow(i);
        nrow(i) = nrow(indexOfMax);
        nrow(indexOfMax) = temp;
        
    end
    
    %Changes the values of rows of the augmented matrix
    for j = ((i+1):n)
        m(nrow(j),i) = A(nrow(j),i)/A(nrow(i),i);
        A(nrow(j),:) = A(nrow(j),:) - m(nrow(j),i)*A(nrow(i),:);

    end
end

% If the condition below is satisfied, then the process is not successfully
% completed
if(A(nrow(n),n) == 0)
    disp('Failure');
    singular = 1;
    return
end

%Back Substitution
x(n) = A(nrow(n),n+1)/A(nrow(n),n);
sum = 0;
for i = (n-1:-1:1)
    for j = (i+1:n)
        sum = sum + A(nrow(i),j)*x(j);
    end
    x(i) = (A(nrow(i),n+1) - sum)/A(nrow(i),i);
    sum=0;
end
x = x';
%After the back substitution is done displays the output 
disp('Completed Successfully');
singular = 0;
disp('Result: ')
disp(x);

end
