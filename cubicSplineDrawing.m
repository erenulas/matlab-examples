
%This is a natural boundary cubic spline drawing program.
%Gets number of points which user will enter and the points from user as
%inputs. Calculates the coefficients for both x and y values, and creates
%cubic polynomials according to these coefficients. After that draw the
%curve

%Get points from user
nop = input('Enter the number of points: ');% nop= Number of Points
[x,y] = ginput(nop);

%Create a time vector with nop elements
timeaxis=linspace(1,nop,nop);

%Algorithm starts
%Step 1
%Finds the difference between times
for i=(1:nop-1)
    hx(i)=timeaxis(i+1)-timeaxis(i);
    hy(i)=timeaxis(i+1)-timeaxis(i);
end

%Step 2
%Calculates a values for both x and y which will be used in further
%calculations
for i=(2:nop-1)
    ax(i) = (3/hx(i))*(x(i+1)-x(i)) - (3/hx(i-1))*(x(i)-x(i-1));
    ay(i) = (3/hy(i))*(y(i+1)-y(i)) - (3/hy(i-1))*(y(i)-y(i-1));
end

%Step 3
%Sets the first values of I, u, and z for both x and y
Ix(1) = 1;
ux(1) = 0;
zx(1) = 0;
Iy(1) = 1;
uy(1) = 0;
zy(1) = 0;

%Step 4
%Calculates the values of I, u, and z for both x and y
for i=(2:nop-1)
    Ix(i) = 2*(timeaxis(i+1) - timeaxis(i-1)) - hx(i-1)*ux(i-1);
    ux(i) = hx(i)/Ix(i);
    zx(i) = (ax(i)-hx(i-1)*zx(i-1))/Ix(i);
    Iy(i) = 2*(timeaxis(i+1) - timeaxis(i-1)) - hy(i-1)*uy(i-1);
    uy(i) = hy(i)/Iy(i);
    zy(i) = (ay(i)-hy(i-1)*zy(i-1))/Iy(i);
end

%Step 5
%Sets the final values of I,z, and c
Ix(nop) = 1;
zx(nop) = 0;
cx(nop) = 0;
Iy(nop) = 1;
zy(nop) = 0;
cy(nop) = 0;

%Step 6
%Finds the coefficients for both x and y
for j=(nop-1:-1:1)
    cx(j) = zx(j)-ux(j)*cx(j+1);
    bx(j) = ((x(j+1)-x(j))/hx(j))-hx(j)*(cx(j+1) + 2*cx(j))/3;
    dx(j) = (cx(j+1) - cx(j))/(3*hx(j));
    cy(j) = zy(j)-uy(j)*cy(j+1);
    by(j) = ((y(j+1)-y(j))/hy(j))-hy(j)*(cy(j+1) + 2*cy(j))/3;
    dy(j) = (cy(j+1) - cy(j))/(3*hy(j));
end
%Algorithm finishes

%Reassign coefficient vectors to different vectors with diffent name to
%make them equal in size
for j=1:nop-1
d2x(j)=dx(j);
c2x(j)=cx(j);
b2x(j)=bx(j);
a2x(j)=x(j);
d2y(j)=dy(j);
c2y(j)=cy(j);
b2y(j)=by(j);
a2y(j)=y(j);
end

%Create piecewise polynomial using coefficients for x and y
sx=mkpp(timeaxis,[d2x';c2x';b2x';a2x']);
sy=mkpp(timeaxis,[d2y';c2y';b2y';a2y']);

%Decrease time axis spacing by factor 10 so that we get a smooth curve
timeaxis=linspace(1,nop,nop*10);

%Evaluate polynomials at different time values
for j=(1:nop*10)
    valuex(j) = ppval(sx,timeaxis(j));
    valuey(j) = ppval(sy,timeaxis(j));
end

%And plot curve using these values
plot(x,y,'o',valuex,valuey);

%End of program