close('all');   % close all open figures so we start with a clean slate!

im_bg = im2double(imread('swim.jpg'));        % background image
im_obj = im2double(imread('bear.jpg'));       % source image

% Get source region mask (extracted object) from the user
% First draw a polygon on the source image for applying the mask

% [poly_x, poly_y] = getPolygonForMask(im_obj);

% NOTE: For your own image sets, simply uncomment the call to getPolygonForMask(), and
% DO NOT USE the hard-coded polygon coordinates below!
poly_x = [276.4628  324.9961  391.5884  425.4488  453.6659  457.0519  433.3496 442.3791 ...
    441.2504  348.6984  248.2457  222.2860  238.0876  226.8008  222.2860  214.3853  224.5434  248.2457];
poly_y = [255.3512  238.4209  255.3512  250.8364  260.9946  283.5682  329.8442  349.0318 ...
    404.3372  419.0101  404.3372  356.9326  342.2597  308.3992  292.5977  265.5093  250.8364  247.4504];

% Convert polygon to a binary mask
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

% Next, align the source object (im_s) and mask (mask_s) with the background image.  
% Get the bottom center location on the target image by using the function
% getBottomCenterLoc interactively

% [center_x, bottom_y] = getBottomCenterLoc(im_bg);

% NOTE: For your own image sets, simply uncomment the call to getBottomCenterLoc(), and
% DO NOT USE the hard-coded alignment coordinates below!
center_x = 575.9264;
bottom_y = 432.4922;

% Translate both the source image and the object mask for proper alignment
% w.r.t. the background image
% Pad the extracted object by 64 pixels each side to allow for feathering/blending overlap.

padding = 64;
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);  % convert mask from binary to double

% Call the function to blend the images using the mask
result1 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% Repeat your method for 4 more sets of images.  But remember that for
% these you must interactively specify the mask and alignment ONE TIME.
%
% The Matlab Grader website does not allow interactive code.  Therefore,
% you must first develop and run your code either in the Matlab computer
% app, or in the full Matlab Online version (https://matlab.mathworks.com).
% Both of those version allow interactive code, which will allow you to
% specify a mask for object selection and an alignment point in the
% target/background image.
%
% Once you are satisfied with your choice of mask and alignment, copy the
% values of the poly_x and poly_y vectors (which define the vertices of the
% polygon mask), and the values of center_x and bottom_y (which specify the
% alignment) from the output of the Command Window.  Then, hard-code these
% values into your code below, just like it was done for the first image
% set above.
%
% There are two reasons for hard-coding these values.  First, it avoids the
% need to repeatedly interact with the tool to specify the mask and
% alignment while you are fine tuning the blending algorithm.  Second, you
% will be submitting your final work on the Matlab Grader website which
% does not allow interactive code.
%
% -------------------------------------------------------------------------


%%%%% your own images
im_bg = im2double(imread('https://media.istockphoto.com/photos/red-apple-with-leaf-isolated-on-white-background-picture-id185262648?b=1&k=20&m=185262648&s=170667a&w=0&h=2ouM2rkF5oBplBmZdqs3hSOdBzA4mcGNCoF2P0KUMTM='));        % background image
im_obj = im2double(imread('https://media.istockphoto.com/photos/orange-fruit-isolated-on-white-picture-id477836156?k=20&m=477836156&s=170667a&w=0&h=cOOINsrgHi9ocyeEhdJb2luIvtx2KJL3WwrWUs2Hves='));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask

%[poly_x, poly_y] = getPolygonForMask(im_obj);
disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
poly_x = [206.9818  299.2912  346.6606  363.6650  364.8796  338.1584  295.6474  251.9219  216.6985  206.9818];       % display x coords of polygon
poly_y = [73.6796   85.8255  134.4095  206.0708  260.7277  314.1701  346.9642  360.3248  366.3978 73.6796];        % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%[center_x, bottom_y] = getBottomCenterLoc(im_bg);
disp("Copy the values of center_x and bottom_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
center_x = 279.8577;      % display x coord where center of object should be placed
bottom_y = 366.3978;      % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result2 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});


% REPEAT ABOVE FOR IMAGE SET 3
im_bg = im2double(imread('https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Paume_de_main.jpeg/800px-Paume_de_main.jpeg'));        % background image
im_obj = im2double(imread('https://cdn.mos.cms.futurecdn.net/UKVU6RwT7zgtCuLkQDRyKV.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask

%[poly_x, poly_y] = getPolygonForMask(im_obj);
disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
poly_x = [401.8825  532.7581  637.8272  510.6382  352.1129  154.8779  289.4401  403.7258];      % display x coords of polygon
poly_y = [237.8272  245.2005  348.4263  451.6521  455.3387  374.2327  269.1636  237.8272];        % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%[center_x, bottom_y] = getBottomCenterLoc(im_bg);
disp("Copy the values of center_x and bottom_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
center_x = 267.3066;      % display x coord where center of object should be placed
bottom_y = 581.2234;      % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result3 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result3});

% REPEAT ABOVE FOR IMAGE SET 4
im_bg = im2double(imread('https://bodyartguru.com/wp-content/uploads/2021/07/Shaquille-ONeal-1280x720.jpg'));        % background image
im_obj = im2double(imread('https://images.wallpapersden.com/image/download/eminem-singer-rap_amdra2uUmZqaraWkpJRmZ21lrWxnZQ.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask

%[poly_x, poly_y] = getPolygonForMask(im_obj);
disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
poly_x = [749.1738  840.9301  908.6004  914.3351  941.8620  924.6577  899.4247  836.3423  768.6720  695.2670  665.4462  660.8584  664.2993  696.4140  750.3208]; % display x coords of polygon
poly_y = [44.2276   54.5502  132.5430  162.3638  201.3602  273.6183  336.7007  407.8118  419.2814  316.0556  217.4176  176.1272  126.8082   70.6075   43.0806];        % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%[center_x, bottom_y] = getBottomCenterLoc(im_bg);
disp("Copy the values of center_x and bottom_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
center_x = 642.7120;   % display x coord where center of object should be placed
bottom_y = 289.7166;      % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result4 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result4});

% REPEAT ABOVE FOR IMAGE SET 5

im_bg = im2double(imread('https://media.istockphoto.com/photos/empty-room-with-parquet-floor-and-textured-white-walls-picture-id511664338?k=20&m=511664338&s=612x612&w=0&h=Q2gdbWLe5NeQOHjbezJ4jyu9q6yvgMl3zu8tvJzgYcY='));        % background image
im_obj = im2double(imread('https://vetstreet-brightspot.s3.amazonaws.com/a8/c895909e8d11e0a2380050568d634f/file/Border-Collie-2-645mk062111.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask

%[poly_x, poly_y] = getPolygonForMask(im_obj);
disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
poly_x = [179.9556  237.9165  246.8335  377.6169  460.8427  474.2183  413.2851  343.4349  298.8497  251.2921  226.0271  174.0109  141.3151  145.7736   90.7851   74.4372   96.7298  153.2045  179.9556  179.9556]; % display x coords of polygon
poly_y = [46.3410   50.7995   96.8710  102.8157  178.6106  281.1567  367.3548  362.8963  333.1728  364.3825  376.2719  374.7857  345.0622  318.3111  230.6267  105.7880    0.2696   17.9885  40.2811   46.2258];        % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%[center_x, bottom_y] = getBottomCenterLoc(im_bg);
disp("Copy the values of center_x and bottom_y from the " + ...
    "Command Window below and hard code them inside your code for " + ...
    "submission via the Grader website.");
center_x = 301.9171;   % display x coord where center of object should be placed
bottom_y = 397.6889;   % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result5 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result5});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is your function that implements the blending method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function im_cut_and_paste = cut_and_paste(im_bg, im_s, mask_s)
    mask_s = blurGauss(mask_s);
    masked_im = im_s .* mask_s;
    inv_mask = ~mask_s;
    inv_mask = im2double(inv_mask);
    im_cut_and_paste = im_bg.*inv_mask + masked_im;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are helper functions.  You DO NOT NEED TO MODIFY
% any of the code below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [poly_x, poly_y] = getPolygonForMask(im)
    % Asks user to draw polygon around input image.  
    disp('Draw polygon around source object in clockwise order, q to stop');
    fig=figure; hold off; imagesc(im); axis image;
    poly_x = [];
    poly_y = [];
    while 1
        figure(fig)
        [x, y, b] = ginput(1);
        if b=='q'
            break;
        end
        poly_x(end+1) = x;
        poly_y(end+1) = y;
        hold on; plot(poly_x, poly_y, '*-');
    end
    close(fig);
end


function [center_x, bottom_y] = getBottomCenterLoc(im_t)
    disp('choose target bottom-center location');
    fig=figure; hold off; imagesc(im_t); axis image;
    figure(fig)
    [center_x, bottom_y, ~] = ginput(1);
    close(fig);
end


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
