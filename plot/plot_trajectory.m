function plot_trajectory(kspace)
    % Plot the trajectory
    % kspace: Nshots x Nsamples x Ndim

    % Plot Nshots trajectories with different colors
    % add dot on each point to make it easier to see
    addpath(genpath('.'));
    kspace =  kspace ./ pi ./ 1.2;
    Nshots = size(kspace,1);
    Ndim = size(kspace,3);
        % set axis equal
    axis equal;
    for i = 1:Nshots
        if Ndim == 2
            plot(kspace(i,:,1),kspace(i,:,2),'LineWidth',2,'Marker','.','MarkerSize',10);            
        elseif Ndim == 3
            plot3(kspace(i,:,1),kspace(i,:,2),kspace(i,:,3),'LineWidth',2,'Marker','.','MarkerSize',10);
        end
        hold on;
    end
    % add arrowed lines to show the axes crossing zero
    % add arrow to each axis
    if Ndim == 2
        h = plot([-1 1],[0 0],'k','LineWidth',1.5);
        line2arrow(h);
        h2 = plot([0 0],[-1 1],'k','LineWidth',1.5);
        line2arrow(h2);
    elseif Ndim == 3
        h = plot3([-1 1],[0 0],[0 0],'k','LineWidth',1.5);
        line2arrow(h);
        h = plot3([0 0],[-1 1],[0 0],'k','LineWidth',1.5);
        line2arrow(h);
        h = plot3([0 0],[0 0],[-1 1],'k','LineWidth',1.5);
        line2arrow(h);
    end

    % turn on grid
    grid on;

    % turn of axis, and ticklabels
    axis off;
    % turn of ticks
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    set(gca,'ztick',[]);
    % turn of tick labels
    set(gca,'xticklabel',[]);
    set(gca,'yticklabel',[]);
    set(gca,'zticklabel',[]);
    hold off;
end