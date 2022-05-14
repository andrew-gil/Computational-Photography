close('all');   % close all open figures so we start with a clean slate!

im_bg = im2double(imread('swim.jpg'));        % background image
im_obj = im2double(imread('bear.jpg'));       % source image

poly_x = [276.4628  324.9961  391.5884  425.4488  453.6659  457.0519  433.3496 442.3791 ...
    441.2504  348.6984  248.2457  222.2860  238.0876  226.8008  222.2860  214.3853  224.5434  248.2457];
poly_y = [255.3512  238.4209  255.3512  250.8364  260.9946  283.5682  329.8442  349.0318 ...
    404.3372  419.0101  404.3372  356.9326  342.2597  308.3992  292.5977  265.5093  250.8364  247.4504];
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 575.9264;
bottom_y = 432.4922;
padding = 64;
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% Call the function to blend the images using the mask
levels = 6;         % levels in the Laplacian pyramid
result1 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% You must use the same images and mask and alignment coordinates as Part 1.
% Simply copy most of the code from Part 1 here.  The only difference
% is that the blending function called is now alpha_blend() instead of
% cut_and_paste().
% -------------------------------------------------------------------------


%%%%% your own images
im_bg = im2double(imread('https://media.istockphoto.com/photos/red-apple-with-leaf-isolated-on-white-background-picture-id185262648?b=1&k=20&m=185262648&s=170667a&w=0&h=2ouM2rkF5oBplBmZdqs3hSOdBzA4mcGNCoF2P0KUMTM='));        % background image
im_obj = im2double(imread('https://media.istockphoto.com/photos/orange-fruit-isolated-on-white-picture-id477836156?k=20&m=477836156&s=170667a&w=0&h=cOOINsrgHi9ocyeEhdJb2luIvtx2KJL3WwrWUs2Hves='));       % source image
poly_x = [206.9818  299.2912  346.6606  363.6650  364.8796  338.1584  295.6474  251.9219  216.6985  206.9818];       % display x coords of polygon
poly_y = [73.6796   85.8255  134.4095  206.0708  260.7277  314.1701  346.9642  360.3248  366.3978 73.6796];        % display y coords of polygon
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
center_x = 279.8577;      % display x coord where center of object should be placed
bottom_y = 366.3978;
padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 6;         % levels in the Laplacian pyramid
result2 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});


% REPEAT ABOVE FOR IMAGE SET 3
im_bg = im2double(imread('https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Paume_de_main.jpeg/800px-Paume_de_main.jpeg'));        % background image
im_obj = im2double(imread('https://cdn.mos.cms.futurecdn.net/UKVU6RwT7zgtCuLkQDRyKV.jpg'));       % source image
poly_x = [401.8825  532.7581  637.8272  510.6382  352.1129  154.8779  289.4401  403.7258];      % display x coords of polygon
poly_y = [237.8272  245.2005  348.4263  451.6521  455.3387  374.2327  269.1636  237.8272];        % display y coords of polygon
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
center_x = 267.3066;      % display x coord where center of object should be placed
bottom_y = 581.2234;      % display y coord where bottom of object should be placed

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 6;     % width of crossfade, CHOOSE WISELY
result3 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result3});

% REPEAT ABOVE FOR IMAGE SET 4
im_bg = im2double(imread('https://bodyartguru.com/wp-content/uploads/2021/07/Shaquille-ONeal-1280x720.jpg'));        % background image
im_obj = im2double(imread('https://images.wallpapersden.com/image/download/eminem-singer-rap_amdra2uUmZqaraWkpJRmZ21lrWxnZQ.jpg'));       % source image
poly_x = [749.1738  840.9301  908.6004  914.3351  941.8620  924.6577  899.4247  836.3423  768.6720  695.2670  665.4462  660.8584  664.2993  696.4140  750.3208]; % display x coords of polygon
poly_y = [44.2276   54.5502  132.5430  162.3638  201.3602  273.6183  336.7007  407.8118  419.2814  316.0556  217.4176  176.1272  126.8082   70.6075   43.0806];        % display y coords of polygon
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
center_x = 642.7120;   % display x coord where center of object should be placed
bottom_y = 289.7166;      % display y coord where bottom of object should be placed
padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 6;     % width of crossfade, CHOOSE WISELY
result4 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result4});

% REPEAT ABOVE FOR IMAGE SET 5

im_bg = im2double(imread('https://media.istockphoto.com/photos/empty-room-with-parquet-floor-and-textured-white-walls-picture-id511664338?k=20&m=511664338&s=612x612&w=0&h=Q2gdbWLe5NeQOHjbezJ4jyu9q6yvgMl3zu8tvJzgYcY='));        % background image
im_obj = im2double(imread('https://vetstreet-brightspot.s3.amazonaws.com/a8/c895909e8d11e0a2380050568d634f/file/Border-Collie-2-645mk062111.jpg'));       % source image
poly_x = [179.9556  237.9165  246.8335  377.6169  460.8427  474.2183  413.2851  343.4349  298.8497  251.2921  226.0271  174.0109  141.3151  145.7736   90.7851   74.4372   96.7298  153.2045  179.9556  179.9556]; % display x coords of polygon
poly_y = [46.3410   50.7995   96.8710  102.8157  178.6106  281.1567  367.3548  362.8963  333.1728  364.3825  376.2719  374.7857  345.0622  318.3111  230.6267  105.7880    0.2696   17.9885  40.2811   46.2258];        % display y coords of polygon
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 301.9171;   % display x coord where center of object should be placed
bottom_y = 397.6889;   % display y coord where bottom of object should be placed

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 6;     % width of crossfade, CHOOSE WISELY
result5 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result5});



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These are your functions that implement the blending method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function im_blend = laplacian_blend(im_bg, im_s, mask_s, levels)   
    mask_gaussian = pyr_gaussian(mask_s, levels);
    im_bg_laplacian = pyr_laplacian(im_bg, levels);
    im_s_laplacian = pyr_laplacian(im_s, levels);
    result_pyr = cell([levels, 1]);
    for i = levels:-1:1
         result_pyr{i} = (im_s_laplacian{i}.*mask_gaussian{i}) + (im_bg_laplacian{i}.*(1-mask_gaussian{i}));
    end
    im_blend = pyr_laplacian_collapse(result_pyr);
end


function pyr_G = pyr_gaussian(im, levels)
% Computes Gaussian pyramid of image im over number of levels
    pyr_G = cell([levels, 1]);      % declare cell array of height "levels", and width 1
    
    pyr_G{1} = im;                  % level 1 is the orignal image
    for i=2:levels
        pyr_G{i} = imresize(imgaussfilt(pyr_G{i-1}, 2), 0.5);
    end                             % level i is image at level i-1 filtered with Gaussian(2)
                                    % and then downsampled by factor of 2
end


function pyr_L = pyr_laplacian(im, levels)
% Computes Laplacian pyramid of image im over number of levels
    pyr_G = pyr_gaussian(im, levels);   % first compute the Gaussian pyramid

    pyr_L = cell([levels, 1]);      % declare cell array of height "levels", and width 1
    
    pyr_L{levels} = pyr_G{levels};  % top level of Laplacian pyramid is the same as that of Gaussian pyramid
    for i= (levels-1):-1:1
        pyr_L{i} = pyr_G{i} - imresize(pyr_G{i+1}, size(pyr_G{i}(:,:,1)));
                                    % level i of Laplacian is the difference of
                                    % Gaussian level i and upsampled level i+1
                                    % equalizes size by upsampling G{i+1}
    end
end

    
function im = pyr_laplacian_collapse(pyr)
% computes the image from its Laplacian pyramid
    levels = size(pyr, 1);
    pyr_G = cell([levels, 1]);
    pyr_G{levels} = pyr{levels};
    for i = (levels-1):-1:1
        pyr_G{i} = pyr{i} + imresize(pyr_G{i+1},size(pyr{i}(:,:,1)));
    end
    im = pyr_G{1};
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are complete functions to display Gaussian and
% Laplacian pyramids.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function display_gaussian(pyr)  % code is complete!
% displays the Gaussian pyramid
    figure; montage(pyr);               
end
    
function display_laplacian(pyr) % code is complete!
% displays the Laplacian pyramid
    levels = size(pyr, 1);      
    for i=1:levels-1
        pyr{i} = pyr{i} + 0.5;   % false color all levels except topmost by adding 0.5
    end
    figure; montage(pyr);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are helper functions.  You DO NOT NEED TO MODIFY
% any of the code below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im_s2, mask2] = alignSource(im_s, mask, im_t, center_x, bottom_y, padding)
    % Inputs:  source image, mask, target/background image, ...
    % center_x, bottom_y are the coordinates of the bottom center location on the target image
    % padding is the number of extra rows/coumns to include around the
    % object to allow for feathering/blending.

    % Outputs: an aligned source image and also an aligned blending mask.
    
    % find the bounding box of the mask, and enlarge it by the amount of
    % padding
    [y, x] = find(mask);
    y1 = min(y)-1-padding; y2 = max(y)+1+padding; 
    x1 = min(x)-1-padding; x2 = max(x)+1+padding;
    im_s2 = zeros(size(im_t));

    yind = (y1:y2);
    yind2 = yind - max(y) + round(bottom_y);
    xind = (x1:x2);
    xind2 = xind - round(mean(x)) + round(center_x);
    
    % if the padding exceeds the image boundaries,
    % clip to image boundary
    yind(yind > size(im_s, 1)) = size(im_s, 1);
    yind(yind < 1) = 1;
    xind(xind > size(im_s, 2)) = size(im_s, 2);
    xind(xind < 1) = 1;
   
    yind2(yind2 > size(im_t, 1)) = size(im_t, 1);
    yind2(yind2 < 1) = 1;
    xind2(xind2 > size(im_t, 2)) = size(im_t, 2);
    xind2(xind2 < 1) = 1;

    y = y - max(y) + round(bottom_y);
    x = x - round(mean(x)) + round(center_x);
    ind = y + (x-1)*size(im_t, 1);
    mask2 = false(size(im_t, 1), size(im_t, 2));
    mask2(ind) = true;
    
    im_s2(yind2, xind2, :) = im_s(yind, xind, :);    
end
