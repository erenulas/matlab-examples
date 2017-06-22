

%Plots the following f function on interval [-pi,pi] using
%1000 linearly spaced data points.

%Generates linearly spaced array between -pi and pi
x=linspace(-pi,pi,1000);
%Function
f=2*cos(power(x,2)/2).*exp(0.6*x);
%Plots the function
plot(x,f);

% label for x axis
xlabel('X'); 
% label for y axis
ylabel('Y');
% title for plot
title('Plot Of The Function On Interval [-pi, pi]'); 