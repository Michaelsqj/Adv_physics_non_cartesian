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
kdata_ud(1:4:end,:)=0;
kdata_ud(2:4:end,:)=0;
kdata_ud(3:4:end,:)=0;
img_ud = ifft2(fftshift(kdata_ud));

%%
im_size=64;
img = zeros(im_size, im_size);
% center of img is one
img(im_size/2, im_size/2) = 1;
kdata = fftshift(fft2(img));
% kdata_ud = kdata(1:3:end,:);
kdata_ud = kdata;
kdata_ud(4:4:end,:)=0;
kdata_ud(2:4:end,:)=0;
kdata_ud(3:4:end,:)=0;
img_ud = ifft2(fftshift(kdata_ud));


%%
p.n=512;
p.nspokes=64;
kspace=radial_2d(p);

E = xfm_NUFFT([512,512,1,1],[],[],reshape(kspace,[],1,2)); 
img_ud = E.mtimes2(img);
figure;
imshow(abs(img_ud),[]);
delta_in= zeros(p.n);
delta_in(p.n/2+1,p.n/2+1)=1;
 psf=fftshift(ifft2(E.PSF(:,:,1)));
% psf_k=fftshift(fft2(psf));
figure;
imshow(abs(psf),[0,0.001*max(abs(psf(:)))])
% imshow(abs(psf_k),[])

%%
kspace=spiral_2d();
E = xfm_NUFFT([512,512,1,1],[],[],reshape(kspace,[],1,2)); 
img_ud = E.mtimes2(img);
psf=fftshift(ifft2(E.PSF(:,:,1)));
figure;
imshow(abs(img_ud),[]);
figure;
imshow(abs(psf),[0,0.01*max(abs(psf(:)))])