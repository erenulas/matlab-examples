function plotpder (coef, x1, x2, numpoints)


% This function plots an nth degree polynomial and its derivative.
% The function takes four inputs. coef is a row vector which stores the
% coefficients of the polynomial. [x1, x2] is the interval on which the
% graph would be plotted. numpoints is the number of data points to be
% plotted.

% Generates linearly spaced data points in [x1,x2] interval
x=linspace(x1,x2,numpoints);

% x values 
xmarkers = x;        
% Finds y values corresponding to x values (for polynomial)
ymarkers = polyval(coef,xmarkers); 
% Finds y values corresponding to x values (for derivative)
ymarkers2 = polyval(polyder(coef),xmarkers); 

% Plots the polynomial and its derivative with data points
plot(x,polyval(coef,x),'m',xmarkers,ymarkers,'m*',x,polyval(polyder(coef),x),'r',xmarkers,ymarkers2,'r*'); 

% Labels x axis
xlabel('X'); 
% Labels y axis
ylabel('Y');  
% Title for the plot
title('Plot Of The Polynomial And Its Derivative'); 
% Legend for the plot
legend('polynomial','data point(polynomial)','derivative','data point(derivative)','Location','NorthEast'); 


end