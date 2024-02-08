function plot_trajectory(kspace)
    % Plot the trajectory
    % kspace: Nshots x Nsamples x Ndim

    % Plot Nshots trajectories with different colors
    % add dot on each point to make it easier to see
    addpath(genpath('.'));
%     kspace =  kspace;
    Nshots = size(kspace,1);
    Ndim = size(kspace,3);
    kspace = kspace ./ 1.2;
        % set axis equal
    figure;
    drawArrow = @(x,y) quiver( x(2),y(2),x(2)-x(1),y(2)-y(1),0 );
    for i = 1:Nshots
        if Ndim == 2
            % specify the color using colormap
            
            plot(kspace(i,:,1),kspace(i,:,2),'LineWidth',2,'Marker','.','MarkerSize',5);      
%             line2arrow(h);
            hold on;
%             drawArrow(squeeze(kspace(i,end-1:end,1)),squeeze(kspace(i,end-1:end,2)));
%             arrow3([squeeze(kspace(i,end-1,1)),squeeze(kspace(i,end-1,2))],[squeeze(kspace(i,end,1)),squeeze(kspace(i,end,2))]);
            hold on;
        elseif Ndim == 3
            plot3(kspace(i,:,1),kspace(i,:,2),kspace(i,:,3),'LineWidth',4);
            hold on;
        end
        hold on;
    end
    % add arrowed lines to show the axes crossing zero
    % add arrow to each axis
    if Ndim == 2
%         h1 = plot([-1 1],[0 0],'k','LineWidth',1.5);
%         hold on;
%         h2 = plot([0 0],[-1 1],'k','LineWidth',1.5);
%         hold on;
% %         line2arrow(h1);
%         arrow3([-1 0],[1,0])
%             hold on;
% %         line2arrow(h2);
% %         vectarrow([0,0],[-1,1])
%         arrow3([0,-1],[0,1]);
        hold on;
    elseif Ndim == 3
        h = plot3([-1 1],[0 0],[0 0],'k','LineWidth',2);
        hold on;
        arrow3([-1 0 0],[1,0,0]);
        hold on;
%         line2arrow(h);
        h = plot3([0 0],[-1 1],[0 0],'k','LineWidth',2);
        hold on;
%         line2arrow(h);
        arrow3([0,-1,0],[0,1,0]);
        hold on;
        h = plot3([0 0],[0 0],[-1 1],'k','LineWidth',2);
        hold on;
        arrow3([0,0,-1],[0,0,1]);
        hold on;
%         line2arrow(h);
    end

    % plot x, y grid in light grey color in 2D in the background
%     if Ndim == 2
%         for i = -1:0.2:1
%             plot([i i],[-1 1],'Color',[0.8 0.8 0.8]);
%             plot([-1 1],[i i],'Color',[0.8 0.8 0.8]);
%         end
%     end

    % turn on grid
    grid off;
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