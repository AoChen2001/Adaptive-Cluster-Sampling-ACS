function C = create_C(k,w)
% create cluster sampling matrix C 
% k denotes the number of factors; w is the number of elementary effects to be generate for each factor

% at the begining, C is a 0 row vector
C = zeros(1,k);
% n denotes the number of elementary effects generated for each factor by matrix C 

% nee is a 1*k dementional vector
% nee(q) denotes the number of additional elementary effects generated for each factor by adding C_q to (C_0;C_1;...;C_q-1)
nee = create_nee(k);

% judging whether the target w is too large
if w > sum(nee)
    disp(['w is too large to achieve! The largest w corresponding to the current k is', num2str(sum(nee))]);
elseif w == 0
    C_q_star = [];
    C = [C;C_q_star];
else
    % determine q
    for q = 1:k
        if w <= sum(nee(1:q))
            break;
        end
    end
    % generate C_0;C_1;...;C_q-1 and add them to C
    for i = 1:q-1
        % create C_i
        C_i = create_C_q(k,i,nee(i));
        % remove the duplicate rows in C_i
        C_i = unique(C_i,'row','stable');
        % add C_i to C
        C = [C;C_i];
    end
    % according to the remaining number of elementary effects that needs to be generated for each factor to construct C_q_star
    C_q_star = create_C_q(k,q,w-sum(nee(1:q-1)));
    % remove the duplicate rows in C_q
    C_q_star = unique(C_q_star,'row','stable');
    % add C_q to C
    C = [C;C_q_star];
end
end