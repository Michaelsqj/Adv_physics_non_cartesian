function [kspace] = cartesian_2d(im_size)
    if nargin <1
        im_size=8;
    end
    % Cartesian grid from -pi to pi
    x = linspace(-pi, pi, im_size);
    y = linspace(-pi, pi, im_size);
    [X, Y] = ndgrid(x, y);
    % concatenate the two grids into one
    kspace = cat(3, Y, X);

end