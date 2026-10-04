function verify_examples
% Meaningful invariants and error cases for the revised processing functions.
[sharp,response] = laplacian_sharpen(ones(8)*0.4);
assert(max(abs(response(:)))<1e-12);
assert(max(abs(sharp(:)-0.4))<1e-12);
impulse = zeros(7); impulse(4,4)=1;
[~,response] = laplacian_sharpen(impulse);
assert(response(4,4)==-4 && response(3,4)==1 && response(4,3)==1);
same = image_difference(impulse,impulse);
assert(all(same(:)==0));
[different,a,b] = image_difference(zeros(8,9),ones(4,5));
assert(isequal(size(a),[8 9]) && isequal(size(b),[8 9]));
assert(max(abs(different(:)-1))<1e-12);
rgb = repmat(uint8(128),[5 6 3]);
gray=to_grayscale(rgb);
assert(isequal(size(gray),[5 6]) && max(abs(gray(:)-128/255))<1e-12);
mustFail(@() to_grayscale([NaN 0]),'portfolio:InvalidRange');
mustFail(@() to_grayscale([0 2]),'portfolio:InvalidRange');
mustFail(@() to_grayscale(zeros(2,2,4)),'portfolio:InvalidShape');
fprintf('PASS: constant, impulse, identical inputs, resizing, RGB, and invalid inputs.\n');
end

function mustFail(operation, expected)
try
    operation();
catch exception
    assert(strcmp(exception.identifier,expected));
    return;
end
error('portfolio:MissingError','Expected input rejection.');
end
