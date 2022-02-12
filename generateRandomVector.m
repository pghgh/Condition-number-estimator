function [v] = generateRandomVector(n, a, b)

    if nargin < 3
        error("Not enough input arguments for the 'generateRandomVector' function\n");
    elseif nargin > 3
        error("Too many input arguments for the 'generateRandomVector' function\n");
    endif
    
    if b != -a
        error("b must be equal to -a in the 'generateRandomVector' function\n");
    endif
    
    validateattributes(n,{'float'},{'integer','>',0},'generateRandomVector','n',1);
    validateattributes(a,{'float'},{'integer','<',0},'generateRandomVector','a',2);
    validateattributes(b,{'float'},{'integer','>',0},'generateRandomVector','b',3);

    % Formula (interval [a,b], vector v of dimension n)
    v = a + (b-a)*rand(n,1);
endfunction