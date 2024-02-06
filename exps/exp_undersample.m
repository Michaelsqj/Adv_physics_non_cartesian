%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Experiment fully sampled VS undersampled image, in Cartesian and non-Cartesian case
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
% 1. Fully sampled Cartesian
% 1.1 generate phantom
im_size = 64;
% img = imresize(double(imread('../phantoms/brain_2d.png')), [im_size, im_size]);
img = double(imread('../phantoms/brain_2d.png'));
% 1.2 generate Cartesian k-space
kspace = cartesian_2d(im_size);
% 1.3 fft to k-space
kdata = fftshift(fft2(img));
% 1.4 save abs of kdata as img
% imwrite(abs(kdata), 'cartesian_2d_fully_sampled.png','png');

%%
kdata_ud = kdata;
kdata_ud(1:3:end,:)=0;
img_ud = ifft2(fftshift(kdata_ud));

%%
im_size=64;
img = zeros(im_size, im_size);
% center of img is one
img(im_size/2, im_size/2) = 1;
kdata = fftshift(fft2(img));
% kdata_ud = kdata(1:3:end,:);
kdata_ud = kdata;
kdata_ud(1:3:end,:)=0;
img_ud = ifft2(fftshift(kdata_ud));


%%
p.n=128;
p.nspokes=40;
kspace=radial_2d(p);

E = xfm_NUFFT([128,128,1,1],[],[],reshape(kspace,[],1,2));  % no density compensation
% img_ud = E.mtimes2(img);
