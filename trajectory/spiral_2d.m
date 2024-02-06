function [kspace] = spiral_2d()
    % generate 2D spiral trajectory
    % -- Design spiral waveform
    FOV = 24;
    rmax = 5;	% 5cm^(-1).  1mm resolution.

    Fcoeff = FOV;	% Uniform density
    N = 120;		% Interleaves
    smax = 15000;	% G/cm/s
    gmax = 5;	% G/cm
    T = .000004;	% 

    [k,g,s,time,r,theta] = vds(smax,gmax,T,N,Fcoeff,rmax);

    kspace(:,:,1)=real(k);
    kspace(:,:,2)=imag(k);
end