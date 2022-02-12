function [lb, rb] = bounds(A, E, b, delta_b)

    % computes left- and right-hand side bounds of the relative error in the solution of a linear system 
    % due to perturbations of the left-hand side matrix or the right-hand side vector
    
    if nargin < 4
        error("Not enough input arguments for the 'bounds' function\n");
    elseif nargin > 4
        error("Too many input arguments for the 'bounds' function\n");
    endif
    
    validateattributes(A, {'numeric'}, {'nonempty','square'},'lhs_perturbation','A',1);
    validateattributes(E, {'numeric'}, {'nonempty','square'},'lhs_perturbation','E',2);
    validateattributes(b, {'numeric'}, {'nonempty','vector'},'lhs_perturbation','b',3);
    validateattributes(delta_b, {'numeric'}, {'nonempty','vector'},'lhs_perturbation','delta_b',4);
    
    [x, delta_x] = lhs_perturbation(A, E, b, delta_b);
    lb = norm(delta_x,1) / norm(x, 1);
    rb = cond(A, 1) * (norm(delta_b, 1)/norm(b, 1) + norm(E, 1)/norm(A, 1));

endfunction