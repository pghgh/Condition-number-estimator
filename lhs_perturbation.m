function [x, delta_x] = lhs_perturbation(A, E, b, delta_b)

    % output of the routine: n×1 vector x which is the solution to the linear system Ax=b,
    % n×1 vector delta_x which is the difference x_hat?x between x and the solution x_hat to the perturbed linear system
    if nargin < 4
        error("Not enough input arguments for the 'lhs_perturbation' function\n");
    elseif nargin > 4
        error("Too many input arguments for the 'lhs_perturbation' function\n");
    endif
    
    validateattributes(A, {'numeric'}, {'nonempty','square'},'lhs_perturbation','A',1);
    validateattributes(E, {'numeric'}, {'nonempty','square'},'lhs_perturbation','E',2);
    validateattributes(b, {'numeric'}, {'nonempty','vector'},'lhs_perturbation','b',3);
    validateattributes(delta_b, {'numeric'}, {'nonempty','vector'},'lhs_perturbation','delta_b',4);
    
    x = A \ b;
    x_hat = (A+E) \ (b+delta_b);
    delta_x = x_hat - x;

endfunction