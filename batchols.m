function [phi,W,A,error,theta,yhat] = batchols( xarray,yarray )
batchx=xarray(1:750,:);
batchy=yarray(1:750,:);


n0=55;
c=zeros(n0,4);

for no=1:1:n0
    for val=1:4
        c(no,val)=rand(1,1);
    end
end


phi=zeros(750,n0);
d=zeros(n0,1);

for t=1:750
    for val=1:n0
            d(val)=norm(batchx(t,:)-c(val,:));
            phi(t,val)=(d(val)^2)*log(d(val));
    end
end

[W,A]=gramsch(phi);
newy=W'*batchy;
theta=A\newy;


yhat=phi*theta;
error=batchy-yhat;

t=1:750;

plot(t,yhat,'b',t,batchy,'r')
norm(error);
errorpercent=sqrt(sum((batchy-yhat).^2)/750)

for t=751:1:1598
    
    for val=1:n0
        d(val)=norm(xarray(t,:)-c(val,:));
        phi(t,val)=(d(val)^2)*log(d(val));
    end
    newphi=[A;phi(t,:)];
    
    err=(yarray(t,:)-(phi(t,:)*theta));
    newyhat=[(newy-(A*theta));err];
    
    size(W)
    [W1,A]=gramsch(newphi);
    size(W1)
    newyhat=W1'*newyhat;
    
   
    size(A)
   
    size(newyhat)
    chtheta=A\newyhat;
    theta=theta+chtheta;
    yhat(t)=phi(t,:)*theta;
    

end 
    
   theta 
   t=1:1:1598;
   
   plot(t,yhat,'r',t,yarray,'b')
   grid on
   
   errorpercent=sqrt(sum((yarray-yhat).^2)/1598)

    
    
        


end

