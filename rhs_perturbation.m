function [E, delta_b] = rhs_perturbation(n)
    
    % output of the routine: random n×n matrix E & random n×1 vector delta_b, both of the following 1-norm: 10^?8
    if nargin < 1
        error("Not enough input arguments for the 'rhs_perturbation' function\n");
    elseif nargin > 1
        error("Too many input arguments for the 'rhs_perturbation' function\n");
    endif
    
    validateattributes(n,{'float'},{'nonempty'},'rhs_perturbation','n',1);

    E = rand(n);
    delta_b = rand(n,1);
    
    v = sum(E, 1);
    index_v = 0;

    for j = 1:columns(E)
        index_v++;
        for i = 1:rows(E)
            E(i, j) = (E(i, j) / v(index_v)) * 10^(-8);
        endfor
    endfor
    
    w = sum(delta_b, 1);
    
    for i = 1:rows(delta_b)
        delta_b(i) = (delta_b(i) / w) * 10^(-8);
    endfor

endfunction