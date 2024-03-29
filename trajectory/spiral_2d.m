function [kspace] = spiral_2d()
    % generate 2D spiral trajectory
    % -- Design spiral waveform
%     FOV = 20;   % 20cm
%     rmax = 5;	% 5cm^(-1).  1mm resolution.
% 
%     % Fcoeff = FOV;	% Uniform density
%     Fcoeff = [20 -10]
%     N = 10;		% Interleaves
%     smax = 12.307*1e3;	% G/cm/s
%     gmax = 2.328;	% G/cm
%     T = 1e-5;	% gradient raster time
smax = 15000;	 % 150 T/m/s
gmax = 4;	 % G/cm
T = .000004;	 % Seconds
N = 16;		 % Interleaves
Fcoeff = [51.2 -40] 	% FOV decreases linearly from 24 to 12cm.
res = 1;
rmax = 5/res;		% cm^(-1), corresponds to 1mm resolution.

    [k,g,s,time,r,theta] = vds(smax,gmax,T,N,Fcoeff,rmax);

    kspace = zeros([N, length(k), 2]);
    % rotate spiral for 120 interleaves uniformly in 360 degrees
    for i = 1:N
        kspace(i, :, 1) = squeeze(real(k)*cos(2*pi*(i-1)/N)-imag(k)*sin(2*pi*(i-1)/N));
        kspace(i, :, 2) = squeeze(real(k)*sin(2*pi*(i-1)/N)+imag(k)*cos(2*pi*(i-1)/N));
    end
    kspace = kspace ./ rmax.*pi;
end