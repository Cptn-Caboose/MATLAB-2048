function [] = plotBoard(A)
A_powers = log(A)/log(2);
A_powers(A_powers==-Inf)=0;

Colormap = [255, 255, 255   % 0
    238, 228, 218           % 2
    237, 224, 200           % 4
    242, 177, 121           % 8
    245, 149, 99            % 16
    246, 124, 95            % 32
    246, 94, 59             % 64
    237, 207, 114           % 128
    237, 204, 97            % 256
    237, 200, 80            % 512
    237, 197, 63            % 1024
    237, 194, 46            % 2048
    60, 58, 50];            % > 2048
Colormap = Colormap./255;

hFig = figure(1);
set(hFig, 'Position', [250 200 600 600])
imagesc(A_powers)
colormap(Colormap)
caxis([0 log(4096)/log(2)])
set(gca, 'XTick', []);
set(gca, 'YTick', []);
for i = 1:size(A,1)
    for j = 1:size(A,2)
        textlabel = sprintf('%i', A(i,j));
        text(j,i,textlabel,'HorizontalAlignment','center','fontsize',35); %text wants text(x,y), not text(i,j)...
    end
end
end