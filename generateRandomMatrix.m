function [A] = generateRandomMatrix(n, a, b)

    if nargin < 3
        error("Not enough input arguments for the 'generateRandomMatrix' function\n");
    elseif nargin > 3
        error("Too many input arguments for the 'generateRandomMatrix' function\n");
    endif
    
    if b != -a
        error("b must be equal to -a in the 'generateRandomMatrix' function\n");
    endif
    
    validateattributes(n,{'float'},{'integer','>',0},'generateRandomMatrix','n',1);
    validateattributes(a,{'float'},{'integer','<',0},'generateRandomMatrix','a',2);
    validateattributes(b,{'float'},{'integer','>',0},'generateRandomMatrix','b',3);

    % Formula (interval [a,b], n x n matrix A)
    A = a + (b-a)*rand(n,n);
endfunction