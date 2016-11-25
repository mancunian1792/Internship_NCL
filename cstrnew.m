function [ f ] = cstrnew(t,x,u  )
%THREECSTR Summary of this function goes here
%   Detailed explanation goes here
    f=[((0.2+u-x(1))/2)-(0.5*x(1)); ((x(1)-x(2))/2)-0.5*x(2);((x(2)-x(3))/2)-0.5*x(3)];
      

end

