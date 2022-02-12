function [c] = est_cond(A)
    
    % routine for the condition number estimator
    if nargin < 1
        error("Not enough input arguments for the 'est_cond' function\n");
    elseif nargin > 1
        error("Too many input arguments for the 'est_cond' function\n");
    endif
    
    validateattributes(A, {'numeric'}, {'nonempty','square'},'est_cond','A',1);

    [L, U] = lu(A);
    n = rows(A);

    % Initialize e,w and t (especially for the first iteration of the for loop k = 1:n)
    e = ones(n,1);
    w = ones(n,1);
    t = zeros(n, 1);
    
    e_plus = ones(n, 1);
    e_minus = -ones(n, 1);
    w_plus = ones(n, 1);
    w_minus = ones(n, 1);
    t_plus = zeros(n, 1);
    t_minus = zeros(n, 1);
    

    for k = 1:n
        for j = k:n
            s = 0;
            for i = 1:k-1
                s += U(i,j) * w(i);
            endfor
            t(j) = s;
        endfor
        
        if k!=1
            e_plus(k) = sign(-t(k));
            e_minus(k) = -e_plus(k);
        endif
        
        w_plus(k) = (e_plus(k) - t(k))/U(k,k);
        w_minus(k) = (e_minus(k) - t(k))/U(k,k);
        
        t_plus(k) = e_plus(k) - t(k);
        t_minus(k) = e_minus(k) - t(k);

        s_t_plus = abs(t_plus(k));
        s_t_minus = abs(t_minus(k));
        
        for j = k+1:n
            t_plus(j) = t(j) + U(k, j) * w_plus(k);
            s_t_plus += abs(t_plus(j));
            
            t_minus(j) = t(j) + U(k, j) * w_minus(k);
            s_t_minus += abs(t_minus(j));
        endfor
        
        if (s_t_plus > s_t_minus)
            e(k) = e_plus(k);
            w(k) = w_plus(k); 
        else
            e(k) = e_minus(k);
            w(k) = w_minus(k);
        endif
        
    endfor
    
    w = U' \ e; 
    y = L' \ w;
    v = L \ y;
    z = U \ v;
    
    c = (norm(A, 1) * norm(z, 1)) / norm(y, 1);
    
endfunction