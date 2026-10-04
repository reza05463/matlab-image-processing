function [difference, first, second] = image_difference(input1, input2)
%IMAGE_DIFFERENCE Absolute difference after grayscale conversion.
% Resize the second image to the first with bilinear interpolation when
% needed. Resizing is not registration and does not establish medical meaning.
first = to_grayscale(input1);
second = to_grayscale(input2);
if ~isequal(size(first), size(second))
    second = imresize(second, size(first), 'bilinear');
end
difference = abs(first - second);
end
