function result = to_grayscale(input)
%TO_GRAYSCALE Normalize a grayscale/RGB array or image filename to [0,1].
% Floating-point inputs must already be normalized. Integer images use the
% Image Processing Toolbox conversion convention (im2double).
if ischar(input) || (isstring(input) && isscalar(input))
    [input, map] = imread(input);
    if ~isempty(map)
        input = ind2rgb(input, map);
    end
end
validateattributes(input, {'numeric','logical'}, {'nonempty','real','nonsparse'}, mfilename);
if ~(ismatrix(input) || (ndims(input) == 3 && size(input,3) == 3))
    error('portfolio:InvalidShape', 'Use a grayscale or three-channel RGB image.');
end
if any(~isfinite(input(:))) || (isfloat(input) && any(input(:)<0 | input(:)>1))
    error('portfolio:InvalidRange', 'Floating-point images must be finite and in [0,1].');
end
result = im2double(input);
if ~ismatrix(result)
    result = rgb2gray(result);
end
end
