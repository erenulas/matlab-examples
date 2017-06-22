# Matlab Examples
This repo contains some example programs implemented in [Matlab](https://www.mathworks.com/product/matlab.html). You can find
the explanation for each example below.
## plotpder.m
This function is used for plotting an nth degree polynomial and its derivative. It takes four inputs as coef, x1, x2, numpoints.<br/>
* coef is a row vector which store the coefficients of the polynomial.
* [x1, x2] is the interval which the graph would be plotted.
* numpoints indicates the number of data points to be plotted.

## funcplot.m
This script is used to plot the following function on interval [-pi, pi] using 1000 data points.<br/>
<p align="center">
f(x) = 2cos(x<sup>2</sup>/2)e<sup>0.6x</sup>
</p>

## mypi.m
This function is used to approximate the value of pi using Monte Carlo simulation.

## main.m, reverseImageLoop.m, reverseImageWithoutLoop.m
Aim of this example is to reverse some part of the image 'birds2.jpg' both in x and y axes. The part to be reversed is indicated in 'temp.jpg'. reverseImageLoop and reverseImageWithoutLoop are used to reverse the image. As you can understand from their names, one of them reverses the image with loop and the other one does the same thing without using loop.

## cubicSplineDrawing.m
A curve drawing program is implemented in Matlab, and natural cubic splines are used to draw smooth curves.<br/>
It takes the number of points, and the points as inputs. To give the points as inputs, you'll click on the screen that will appear once you enter the number of points.

## mygauss.m
This function is used to find the solution x of the system A*x=b by using Gaussian Elimination Method with Scaled Column Pivoting.