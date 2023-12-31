function [w] = validation_procedure(C)
%exam the number of elementary effects generated by matrix C for each factor
%   C is a sampling matrix
[r,k] = size(C);
w = zeros(1,k);
for i=1:k
   temp_C = C;
   temp_C(:,i) = [];
   temp_C = unique(temp_C,'row');
   temp_r = size(temp_C,1);
   w(1,i) = r-temp_r;
end
end

