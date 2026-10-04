function [sharpened, response, gray] = laplacian_sharpen(input)
%LAPLACIAN_SHARPEN Four-neighbour Laplacian with replicated boundaries.
% RESPONSE is signed and unscaled. SHARPENED is clipped to [0,1].
gray = to_grayscale(input);
kernel = [0 1 0; 1 -4 1; 0 1 0];
response = imfilter(gray, kernel, 'replicate');
sharpened = min(max(gray - response, 0), 1);
end
