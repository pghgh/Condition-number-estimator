function [m] = magnitude(x, y)
    
    % routine to assess the accuracy of the implemented condition estimator
    if nargin < 2
        error("Not enough input arguments for the 'magnitude' function\n");
    elseif nargin > 2
        error("Too many input arguments for the 'magnitude' function\n");
    endif
    
    validateattributes(x,{'float'},{'nonempty'},'magnitude','x',1);
    validateattributes(y,{'float'},{'nonempty'},'magnitude','y',2);

    m = max(x, y) / min(x, y);

endfunction