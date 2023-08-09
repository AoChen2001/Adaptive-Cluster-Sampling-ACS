function [nee] = create_nee(k)
% create_nee, nee denotes the number of elementary effect for each factor when add C_q into (C_0;C_1;...;C_q-1)
% k denotes the number of factors
nee = zeros(1,k);
for q=1:k
   nee(q) = nchoosek(k-1,q-1); 
end
end