%{

YOUR COMMENTS:

Please include brief comments here describing the effects and quality of
results (3-5 lines).  Include anything else about the images you would like
to share.

(Optional) Also mention if you obtained more compelling results by using a 
different filter shape than a disk.

%}

close('all');   % close all open figures so we start with a clean slate!

I=im2double(imread('couple.jpg'));

% Get foreground mask (part that stays sharp) from the user

% For the given image, a mask is provided as an image
mask = im2double(imread('mask.png'));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 15;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result1a = method1(I, mask, bokeh_shape);
result1b = method2(I, mask, bokeh_shape);
result1 = method3(I, mask, bokeh_shape);

figure; montage({I, result1a, result1b, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% Repeat your method for 5 more sets of images.  But remember that for
% these you must interactively specify the mask ONE TIME.
%
% Work in the Matlab computer app or the full Matlab Online version
% (https://matlab.mathworks.com) first to get the coordinates for alignment
% and cropping.  Then hard-code these in your program before migrating to
% the Matlab Grader website for submission.
%
% -------------------------------------------------------------------------


%Will Smith and Chris Rock
I=im2double(imread('https://bostonglobe-prod.cdn.arcpublishing.com/resizer/uiggKuxfElwIeR2w2Llwx5kzvDM=/960x0/cloudfront-us-east-1.images.arcpublishing.com/bostonglobe/7OW2SJRSAILKEFUTZIIOHBP37A.jpg'));

% Interactively draw the foreground mask as a polygon

%[poly_x, poly_y] = getPolygonForMask(I);
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%    "Command Window below and hard code them inside your code for " + ...
%    "submission via the Grader website.");
poly_x = [580.8681  595.0892  609.3103  621.3436  627.9072  629.0011  630.0950  645.4100  651.9736 662.9129  667.2887  677.1340  681.5098  715.4216  715.4216  721.9852  718.7034  727.4548 736.2063  751.5213  773.3999  795.2785  818.2511  836.8479  829.1904  843.4115  851.0690 852.1629  845.5993  843.4115  833.5661  820.4389  821.5329  822.6268  816.0632  797.4664 764.6485  709.9520  702.2944  707.7641  715.4216  729.6427  735.1124  719.7973  685.8855 679.3219  686.9794  720.8913  656.3493  616.9678  583.0560  519.6221  557.9236  571.0555 561.2065  528.3768  508.6789  497.7356  481.3207  464.9059  447.3966  420.0385  455.0569 468.1888  506.4902  538.2257  560.1122  554.6406  548.0746  542.6030  544.7916 553.5462 580.9044];        % display x coords of polygon
poly_y = [191.1174  191.1174  196.5871  204.2446  218.4657  233.7807  254.5654  261.1290  273.1622 277.5379  291.7590  297.2287  308.1680  337.7041  346.4556  351.9252  354.1131  360.6767 374.8978  395.6824  424.1246  470.0697  496.3241  519.2966  535.7056  548.8327  568.5235 579.4628  584.9324  598.0596  582.7446  571.8053  583.8385  593.6839  591.4960  560.8660 497.4180  429.5943  432.8761  463.5061  500.6998  525.8602  551.0206  571.8053  596.9657 654.9440  674.6348  754.4917  755.5856  673.5408  757.7735  753.6698  557.7854  516.2011 503.0691  518.3897  514.0124  505.2578  524.9557  529.3330  554.5025  556.6911  499.7862 472.4280  403.4855  348.7692  284.2040  277.6380  250.2799  229.4877  218.5444 205.4125 190.0920];        % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.
% poly_x = ;
% poly_y = ;

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 10;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result2 = method3(I, mask, bokeh_shape);

figure; montage({I, result2});



% REPEAT ABOVE FOR IMAGE 3
%image taken from my camera of cat
I=im2double(imread('https://i.imgur.com/GP3zo5s.jpeg'));

% Interactively draw the foreground mask as a polygon

%[poly_x, poly_y] = getPolygonForMask(I);
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%    "Command Window below and hard code them inside your code for " + ...
%    "submission via the Grader website.");
poly_x = [605.1573  617.7379  686.9315  724.6734  760.3185  793.8669  823.2218  838.9476  848.3831 858.8669  873.5444  887.1734  875.6411  890.3185  904.9960  894.5121  884.0282  922.8185 971.0444  973.1411  917.5766  846.2863  810.6411  778.1411  752.9798  726.7702  726.7702 707.8992  695.3185  657.5766  635.5605  604.1089  577.8992  534.9153  504.5121  474.1089 446.8508  398.6250  344.1089  332.5766  317.8992  288.5444  257.0927  242.4153  218.3024 191.0444  175.3185  133.3831  156.4476  201.5282  245.5605  332.5766  393.3831  422.7379 513.9476  551.6895  605.1573  608.3024  602.0121  602.0121  591.5282  592.5766  605.1573];
poly_y = [45.6976   46.7460   96.0202   87.6331   86.5847   23.6815   39.4073  109.6492  125.3750 143.1976  164.1653  229.1653  263.7621  285.7782  309.8911  368.6008  378.0363  409.4879 444.0847  480.7782  492.3105  464.0040  481.8266  505.9395  531.1008  555.2137  583.5202 600.2944  617.0685  619.1653  644.3266  644.3266  631.7460  632.7944  623.3589  620.2137 629.6492  624.4073  584.5685  582.4718  561.5040  553.1169  519.5685  499.6492  490.2137 467.1492  447.2298  425.2137  363.3589  301.5040  251.1815  205.0524  169.4073  163.1169 168.3589  169.4073  181.9879  177.7944  166.2621  139.0040   92.8750   59.3266   46.7460];
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.
% poly_x = ;
% poly_y = ;

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 10;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result2 = method3(I, mask, bokeh_shape);

figure; montage({I, result2});

% REPEAT ABOVE FOR IMAGE 4
%chair in a room
I=im2double(imread('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/small-bedroom-chairs-1628593614.jpg?crop=0.502xw:1.00xh;0,0&resize=640:*'));

% Interactively draw the foreground mask as a polygon

%[poly_x, poly_y] = getPolygonForMask(I);
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%    "Command Window below and hard code them inside your code for " + ...
%    "submission via the Grader website.");
poly_x = [153.6557  182.1918  311.9852  353.4086  366.2959  369.0574  373.6600  377.3421  410.4809 421.5271  435.3349  456.5069  462.0300  483.2020  485.0430  468.4736  467.5531  449.1427 447.3017  439.0170  430.7323  427.9707  267.8002  269.6413  254.9129  249.3898  245.7077 225.4563  207.0459  192.3176  184.9534  179.4303  185.8739  174.8277  171.1456  161.9404 161.9404  135.2453  141.6889  152.7352  155.4967];
poly_y = [159.9801  153.5365  155.3775  166.4238  177.4700  182.9931  254.7937  285.1709  271.3631 270.4426  275.9657  279.6478  285.1709  384.5871  434.2952  434.2952  444.4209  451.7850 520.8241  527.2677  527.2677  452.7056  469.2749  546.5986  551.2012  543.8371  467.4339 467.4339  462.8313  493.2085  495.9700  472.0365  454.5466  447.1824  378.1434  312.7865 298.0582  183.9137  166.4238  160.9007  159.0596];
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.
% poly_x = ;
% poly_y = ;

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 5;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result2 = method3(I, mask, bokeh_shape);

figure; montage({I, result2});
% REPEAT ABOVE FOR IMAGE 5
%pikachu
I=im2double(imread('https://cdn.vox-cdn.com/thumbor/eFEHo8eygHajtwShwT9e_jf7c-c=/0x0:1920x1080/1200x800/filters:focal(722x227:1028x533)/cdn.vox-cdn.com/uploads/chorus_image/image/69323002/Screen_Shot_2021_05_21_at_9.54.00_AM.0.jpeg'));

% Interactively draw the foreground mask as a polygon

%[poly_x, poly_y] = getPolygonForMask(I);
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%    "Command Window below and hard code them inside your code for " + ...
%    "submission via the Grader website.");
poly_x = [442.2051  503.0346  704.8779  732.5276  815.4770  851.4217  843.1267  771.2373  729.7627 724.2327  663.4032  602.5737  544.5092  489.2097  431.1452  411.7903  359.2558  323.3111 315.0161  182.2972   30.2235    5.3387    5.3387   60.6382  185.0622  284.6014  367.5507 406.2604  442.2051];
poly_y = [21.6982   -0.4217   -3.6475   33.4493  185.5230  246.3525  340.3618  376.3065  434.3710 470.3157  495.2005  509.0253  462.0207  450.9608  470.3157  489.6705  379.0714  268.4724 191.0530  287.8272  343.1267  343.1267  304.4171  240.8226  144.0484   99.8088   88.7488 41.7442   22.3894];
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.
% poly_x = ;
% poly_y = ;

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 10;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result2 = method3(I, mask, bokeh_shape);

figure; montage({I, result2});
% REPEAT ABOVE FOR IMAGE 6
%volleyball serve
I=im2double(imread('https://www.volleyball-strength-program.com/images/volleyball-serving-tips.jpg'));

% Interactively draw the foreground mask as a polygon

%[poly_x, poly_y] = getPolygonForMask(I);
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%    "Command Window below and hard code them inside your code for " + ...
%    "submission via the Grader website.");
poly_x = [534.2299  566.3467  604.3029  604.3029  575.1058  528.3905  484.5949  467.0766  475.8358 505.0328  534.2299];
poly_y = [18.7482   24.5876   59.6241  106.3394  153.0547  158.8942  138.4562  100.5000   56.7044 24.5876   15.8285];
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.
% poly_x = ;
% poly_y = ;

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 10;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result2 = method3(I, mask, bokeh_shape);

figure; montage({I, result2});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This are the functions that implement bokeh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = method1(I, mask, filter)
    I_blur = imfilter(I, filter, 'replicate');
    result = I_blur .* (1 - mask) + I .* mask;
end

function result = method2(I, mask, filter)
    bg = I .* (1 - mask);
    bg_blur = imfilter(bg, filter, 'replicate');
    result = bg_blur .* (1 - mask) + I .* mask;
end

function result = method3(I, mask, filter)
    % YOUR CODE HERE
    bg = I .* (1 - mask);
    bg_blur = imfilter(bg, filter, 'replicate');
    mask_blur = imfilter(1-mask, filter, 'replicate');
    val = (bg_blur .* (1 - mask))./(mask_blur .* (1-mask));
    val(isnan(val)) = 0;
    result = val + I .* mask;
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