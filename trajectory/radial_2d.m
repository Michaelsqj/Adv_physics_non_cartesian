function [kspace] = radial_2d(p)
    % 2D radial trajectory
    % parse inputs with inputParser
    if nargin<1
        p.a='';
    end
    if isfield(p, 'n')
        n = p.n;
    else
        n = 8;
    end
    if isfield(p, 'nspokes')
        nspokes = p.nspokes;
    else
        nspokes = 8;
    end
    if isfield(p, 'OS')
        OS = p.OS;
    else
        OS = 2;
    end
    if isfield(p, 'distrb')
        distrb = p.distrb;
    else
        distrb = 'GA';
    end

    % golden angle
    GoldenAngle = 111.246117975;
    kspace = zeros(nspokes, n*OS, 2);
    kspace(:, :, 1) = repmat(reshape(linspace(-pi, pi, n*OS), [1, n*OS, 1]), [nspokes, 1, 1]);
    if strcmp(distrb, 'GA')
        for ii = 1:nspokes
            kspace(ii, :, 2) = linspace(-pi, pi, n*OS) * cosd(GoldenAngle * (ii-1));
            kspace(ii, :, 1) = linspace(-pi, pi, n*OS) * sind(GoldenAngle * (ii-1));
        end
    elseif strcmp(distrb, 'UNI')
        for ii = 1:nspokes
            kspace(ii, :, 2) = linspace(-pi, pi, n*OS) * cosd(180/nspokes * (ii-1));
            kspace(ii, :, 1) = linspace(-pi, pi, n*OS) * sind(180/nspokes * (ii-1));
        end
    end
            
    
end