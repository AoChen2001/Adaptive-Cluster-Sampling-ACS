function [C_qm] = deal_C_qm(C_qm,C_n)
% determine if C_qm is duplicated with the previously generated sub-block matrix
for i = 1:size(C_n,1)
    if isequal(C_qm(1,:),C_n(i,:)) 
        % if C_qm is duplicated with another block matrix, reset it to a empty matrix
        C_qm = [];
        break;
    end
end
end

