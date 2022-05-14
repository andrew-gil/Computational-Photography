%% Writeups
% * Video URL
% https://www.youtube.com/watch?v=SBr9bWOxcdE
%
% * Brief description as per instructions
% The naive hdr method with simple averaging multiplies each pixel value of each 
% exposure image by its exposure time and takes the mean of all those for each 
% pixel position in r, g, and b. The resulting image when tonemapped results in a 
% pretty bright image when run on the memorial photoset. 

% The naive hdr method with weighted average does the same as the previous
% method but before normalizing with respect to exposure, we apply a
% function to each pixel, double(128-abs(z-128)), that shrinks edge cases
% and maximises average values. After normalizing, we compute the weighted
% average of all the images.

% The median method filters out the bottom 10 and top 10 percent of pixels.
% After it removes those pixels, it normalizes a valid pixel based on the
% median of the remaining exposures. When calculating the median of an even
% number of exposure's, I set it so that it picks a random exposure from
% the middle two. When odd, it just does the median.

% The highest non saturating method finds the highest exposure for a pixel
% where it is in the bottom 80%, and uses that exposure for normalization. 
% It does htis for every pixel. 

% The advanced hdr method finds 100 random pixel positions and calculates
% an individual response curve for r, g, and b based on that sample. We then 
% use the response curve created from the sample and apply it to the whole
% image to get the log film irradiance at each pixel position. By
% exponetiating each r g b page of log film irradiance into radiance we
% have recovered the HDR image. 

%% Your project code
close all;
pretest_flag = 1; % this line of code is designed to pass the pretest.
%{
images  = ["memorial0061.png"; "memorial0062.png"; "memorial0063.png"; ...
    "memorial0064.png"; "memorial0065.png"; "memorial0066.png"; ...
    "memorial0067.png"; "memorial0068.png"; "memorial0069.png"; ...
    "memorial0070.png"; "memorial0071.png"; "memorial0072.png"; ...
    "memorial0073.png"; "memorial0074.png"; "memorial0075.png"; "memorial0076.png"];

memorialldrs = cat(4, imread(images(1)), imread(images(2)), imread(images(3)), ...
    imread(images(4)), imread(images(5)), imread(images(6)),...
    imread(images(7)), imread(images(8)), imread(images(9)),...
    imread(images(10)), imread(images(11)), imread(images(12)), ...
    imread(images(13)), imread(images(14)), imread(images(15)), imread(images(16)));

memorialexposures = 1./[0.03125, 0.0625, 0.25, 0.5, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024];

naive_hdr_image = makehdr_naive(memorialldrs, memorialexposures);
figure, imshow(tonemap(naive_hdr_image, 'AdjustSaturation',3.0));

naive_hdr_image = makehdr_weightedaverage(memorialldrs, memorialexposures);
figure, imshow(tonemap(naive_hdr_image, 'AdjustSaturation',3.0));

naive_hdr_image = makehdr_median(memorialldrs, memorialexposures);
figure, imshow(tonemap(naive_hdr_image, 'AdjustSaturation',3.0));

naive_hdr_image = makehdr_highestnonsaturatingexposure(memorialldrs, memorialexposures);
figure, imshow(tonemap(naive_hdr_image, 'AdjustSaturation',3.0));

advanced_hdr_image = makehdr_advanced(memorialldrs, memorialexposures);
figure, imshow(tonemap(advanced_hdr_image, 'AdjustSaturation',3.0));
%}
function hdr = makehdr_naive(ldrs, exposures)
    % ldrs is an m x n x 3 x k matrix which can be created with ldrs = cat(4, ldr1, ldr2, ...);
    % exposures is a vector of exposure times (in seconds) corresponding to ldrs
    [exposures,sortexp] = sort(reshape(exposures,1,1,1,[]));
    ldrs = ldrs(:,:,:,sortexp); %Sort exposures from dark to light
    %ldrs = im2double(ldrs);
    ldrs = double(ldrs).*(exposures);
    hdr = mean(ldrs, 4);
end

function hdr = makehdr_weightedaverage(ldrs, exposures)
    % ldrs is an m x n x 3 x k matrix which can be created with ldrs = cat(4, ldr1, ldr2, ...);
    % exposures is a vector of exposure times (in seconds) corresponding to ldrs
    w = @(z) double(0.5-abs(z-0.5));
    [exposures,sortexp] = sort(reshape(exposures,1,1,1,[]));
    ldrs = ldrs(:,:,:,sortexp); %Sort exposures from dark to light

    wldrs = w(double(ldrs));
    ldrs = double(ldrs).*exposures;
    hdr = sum(wldrs.*ldrs,4)./sum(wldrs,4);
end

function hdr = makehdr_median(ldrs, exposures)
    % ldrs is an m x n x 3 x k matrix which can be created with ldrs = cat(4, ldr1, ldr2, ...);
    % exposures is a vector of exposure times (in seconds) corresponding to ldrs
    [exposures,sortexp] = sort(reshape(exposures,1,1,1,[]));
    ldrs = ldrs(:,:,:,sortexp); %Sort exposures from dark to light
    ldrs = im2double(ldrs);
    %remove outliers from exposures
    %exposures = exposures(exposures<.9*max(exposures) & exposures > .1*max(exposures));
    %if even number of exposures, pick random one from middle
    hdr = zeros(size(ldrs));
    
    for y = 1:size(ldrs,1)
        for x = 1:size(ldrs,2)
            for c = 1:3
                high = 0;
                low = 1;
                for i = size(ldrs,4):-1:1
                    if (ldrs(y,x,c,1:i)<.9 & ldrs(y,x,c,1:i) > .1 & all(hdr(y,x,c,:) == 0))
                        high = high+1;
                        low = i;
                        %hdr(y,x,c,i) = ldrs(y,x,c,i)*exposures(:,:,:,i);
                    end
                end
                tempexposures = exposures(:,:,:,low:low+high);
                if (mod(size(tempexposures,4),2) == 0)
                    hdr(y,x,c,:) = ldrs(y,x,c,:).*tempexposures(:,:,:,round(rand())+size(tempexposures,4)/2);
                else
                    hdr(y,x,c,:) = ldrs(y,x,c,:).*median(exposures);
                end
            end
        end
    end
    
    %if (mod(size(exposures,4),2) == 0)
    %    ldrs = ldrs.*exposures(:,:,:,round(rand())+size(exposures,4)/2);
    %else
    %    ldrs = ldrs.*median(exposures);
    %end
    hdr = mean(ldrs, 4);
end

function hdr = makehdr_highestnonsaturatingexposure(ldrs, exposures)
    % ldrs is an m x n x 3 x k matrix which can be created with ldrs = cat(4, ldr1, ldr2, ...);
    % exposures is a vector of exposure times (in seconds) corresponding to ldrs
    [exposures,sortexp] = sort(reshape(exposures,1,1,1,[]));
    ldrs = ldrs(:,:,:,sortexp); %Sort exposures from dark to light
    ldrs = im2double(ldrs);
    hdr = zeros(size(ldrs));
    for i = size(ldrs,4):-1:1
        for y = 1:size(ldrs,1)
            for x = 1:size(ldrs,2)
                for c = 1:3
                    if (ldrs(y,x,c,i)<204 && all(hdr(y,x,c,:) == 0))
                        hdr(y,x,c,i) = ldrs(y,x,c,i)*exposures(:,:,:,i);
                    end
                end

            end
        end
    end
    hdr = sum(hdr, 4);
end
function hdr = makehdr_advanced(ldrs, exposures)
    % ldrs is an m x n x 3 x k matrix which can be created with ldrs = cat(4, ldr1, ldr2, ...);
    % exposures is a vector of exposure times (in seconds) corresponding to ldrs
    [exposures,sortexp] = sort(reshape(exposures,1,1,1,[]));
    ldrs = ldrs(:,:,:,sortexp); %Sort exposures from dark to light
    
    %randomly sample 100 pixels
    [rows, columns] = size(ldrs(:,:,1,1));
    %100 random pixel indexes
    randPixelLocations = round(rand(100, 1)*rows*columns);
    for i = 1:size(ldrs, 4)
        tempR = ldrs(:,:,1,i);
        tempR = tempR(:);
        tempG = ldrs(:,:,2,i);
        tempG = tempG(:);
        tempB = ldrs(:,:,3,i);
        tempB = tempB(:);
        Zr(:,i) = tempR(randPixelLocations);
        Zg(:,i) = tempG(randPixelLocations);
        Zb(:,i) = tempB(randPixelLocations);
        %find B
        B(i) = log(exposures(:,:,:,i));
    end
    w = @eq4;
    %w = @(z) double(128-abs(z-128));
    [gR, ~] = gsolve(Zr, B, 25, w);
    [gG, ~] = gsolve(Zg, B, 25, w);
    [gB, ~] = gsolve(Zb, B, 25, w);
    figure, plot(gR, 1:size(gR))
    hold on;
    plot(gG, 1:size(gG))
    plot(gB, 1:size(gB))
    hold off;
    logshutterspeed = log(exposures);
    logradianceR = sum(w(ldrs(:,:,1,:)).*(gR(ldrs(:,:,1,:)+1)-logshutterspeed), 4)./sum(w(ldrs(:,:,1,:)),4);
    logradianceG = sum(w(ldrs(:,:,2,:)).*(gG(ldrs(:,:,2,:)+1)-logshutterspeed), 4)./sum(w(ldrs(:,:,2,:)),4);
    logradianceB = sum(w(ldrs(:,:,3,:)).*(gB(ldrs(:,:,3,:)+1)-logshutterspeed), 4)./sum(w(ldrs(:,:,3,:)),4);
    hdr(:,:,1) = exp(logradianceR);
    hdr(:,:,2) = exp(logradianceG);
    hdr(:,:,3) = exp(logradianceB);
end

function w = eq4(z) 
    if z<=128
        w = double(z);
    else
        w = double(256-z);
    end
end
% Given a set of pixel values observed for several pixels in several
% images with different exposure times, this function returns the
% imaging system's response function g as well as the log film irradiance
% values for the observed pixels.
%
% Assumes:
%
% Zmin = 0
% Zmax = 255
%
% Arguments:
%
% Z(i,j) is the pixel values of pixel location number i in image j
% B(j) is the log delta t, or log shutter speed, for image j
% l is lamdba, the constant that determines the amount of smoothness
% w(z) is the weighting function value for pixel value z
% 
% Returns:
%
% g(z) is the log exposure corresponding to pixel value z
% lE(i) is the log film irradiance at pixel location i
%
function [g,lE] = gsolve(Z,B,l,w)
    n = 256;
    A = zeros(size(Z,1)*size(Z,2)+n+1,n+size(Z,1));
    b = zeros(size(A,1),1);
    %% Include the data?fitting equations
    k = 1;
    for i=1:size(Z,1)
        for j=1:size(Z,2)
            wij = w(Z(i,j)+1);
            A(k,Z(i,j)+1) = wij; A(k,n+i) = -wij; b(k,1) = wij * B(j);
            k=k+1;
        end
    end
    %% Fix the curve by setting its middle value to 0
    A(k,129) = 1;
    k=k+1;
    %% Include the smoothness equations
    for i=1:n-2
        A(k,i)=l*w(i+1); A(k,i+1)=-2*l*w(i+1); A(k,i+2)=l*w(i+1);
        k=k+1;
    end
    %% Solve the system using SVD
    x = A\b;
    g = x(1:n);
    lE = x(n+1:size(x,1));
end