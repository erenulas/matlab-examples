function zpi = mypi(numpoints)


%Approximates the value of pi using Monte Carlo simulation.Input parameter
%is the number of points used in simulation

hit=0;
miss=0;

    for k=(1:numpoints) 
        %Generate random x value between 1 and -1
        x= (rand()-0.5)*2;
        %Generate random y value between 1 and -1
        y= (rand()-0.5)*2;
        %It checks if our random x and y coordinates are in the circle or
        %not
        if sqrt(power(x,2)+power(y,2))<1
            hit=hit+1;
        else
            miss=miss+1;
        end
    end
    %This formula finds the approximate value of pi
            zpi= 4*hit/numpoints;
end


   

