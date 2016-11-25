function [ Q,R ] = gramsch( A )
% o{1,:}=x(1,:)/sqrt(sum(x(1,:).^2));
% for k=2:1:size(x,1)
%     s=x(k,:);
%     for m=1:1:k-1
%         s=s-((o{m}*x(k,:)')/(o{m}*o{m}'))*o{m};
%     end
%     o{k,:}=s/sqrt(sum(s.^2));
% end
% res=o;
% for K=1:1:size(x,1)
%     
% 
% 
% end
[m,n]=size(A);
Q=zeros(m,n);
R=zeros(n,n);
for j=1:n
    v=A(:,j);
    for i=1:j-1
        R(i,j)=Q(:,i)'*A(:,j);
        v=v-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(v);
    Q(:,j)=v/R(j,j);
end
end
