function [E_s] = create_E_s(k,s)
% create_E_s create the E_s matrix
% k denotes the number of factors, s is an index
E_s = [zeros(k,s-1),eye(k)];
E_s(:,1:s-1) = E_s(:,k+1:k+s-1);
E_s(:,k+1:k+s-1) = [];
end

