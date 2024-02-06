function plot_trajectory(kspace)
    % Plot the trajectory
    % kspace: Nshots x Nsamples x Ndim

    % Plot Nshots trajectories with different colors
    % add dot on each point to make it easier to see
    addpath(genpath('.'));
%     kspace =  kspace;
    Nshots = size(kspace,1);
    Ndim = size(kspace,3);
        % set axis equal
    
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
        h1 = plot([-1 1],[0 0],'k','LineWidth',1.5);
        h2 = plot([0 0],[-1 1],'k','LineWidth',1.5);
        line2arrow(h1);
        line2arrow(h2);
    elseif Ndim == 3
        h = plot3([-1 1],[0 0],[0 0],'k','LineWidth',1.5);
        line2arrow(h);
        h = plot3([0 0],[-1 1],[0 0],'k','LineWidth',1.5);
        line2arrow(h);
        h = plot3([0 0],[0 0],[-1 1],'k','LineWidth',1.5);
        line2arrow(h);
    end

    % plot x, y grid in light grey color in 2D in the background
    if Ndim == 2
        for i = -1:0.2:1
            plot([i i],[-1 1],'Color',[0.8 0.8 0.8]);
            plot([-1 1],[i i],'Color',[0.8 0.8 0.8]);
        end
    end

    % turn on grid
    grid on;
    % set axis equal
    axis equal;
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