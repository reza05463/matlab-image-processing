% Reproduce the university examples using the supplied images in this folder.
projectDir = fileparts(mfilename('fullpath'));
addpath(projectDir);
outputDir = projectDir;
if ~exist(outputDir, 'dir'), mkdir(outputDir); end
dataDir = projectDir;
sample = fullfile(dataDir, 'Laplacian.tif');
[sharp,response,gray] = laplacian_sharpen(sample);
fig=figure('Visible','off','Position',[100 100 1200 400]);
subplot(1,3,1); imshow(gray); title('Original coursework image');
subplot(1,3,2); imshow(response,[]); title('Laplacian (display rescaled)');
subplot(1,3,3); imshow(sharp); title('Sharpened, clipped to [0,1]');
exportgraphics(fig,fullfile(outputDir,'moon-sharpening-result.png')); close(fig);
[difference,first,second] = image_difference( ...
    fullfile(dataDir, 'normalBrainGray.jpg'), ...
    fullfile(dataDir, 'alzaimerBrainGray.jpg'));
fig=figure('Visible','off','Position',[100 100 1200 400]);
subplot(1,3,1); imshow(first); title('Coursework input A');
subplot(1,3,2); imshow(second); title('Coursework input B');
subplot(1,3,3); imshow(difference); title('Absolute difference');
exportgraphics(fig,fullfile(outputDir,'brain-difference-result.png')); close(fig);
fprintf('Saved demonstration figures in %s\n',outputDir);
