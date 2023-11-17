function createfigure(XData1, YData1, XData2, YData2, XData3, YData3, XData4, YData4, XData5, YData5, YData6, YData7, YData8)
%CREATEFIGURE(XData1, YData1, XData2, YData2, XData3, YData3, XData4, YData4, XData5, YData5, YData6, YData7, YData8)
%  XDATA1:  line xdata
%  YDATA1:  line ydata
%  XDATA2:  line xdata
%  YDATA2:  line ydata
%  XDATA3:  line xdata
%  YDATA3:  line ydata
%  XDATA4:  line xdata
%  YDATA4:  line ydata
%  XDATA5:  line xdata
%  YDATA5:  line ydata
%  YDATA6:  line ydata
%  YDATA7:  line ydata
%  YDATA8:  line ydata

%  由 MATLAB 于 13-Oct-2023 17:29:53 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1,...
    'Position',[0.151428571428571 0.485811904761905 0.753571428571429 0.391569047619048]);
hold(axes1,'on');

% 创建 line
line(XData1,YData1,'Visible','off','Parent',axes1);

% 创建 hggroup
hggroup1 = hggroup('DisplayName','H','Parent',axes1);

% 创建 line
line(XData2,YData2,'Parent',hggroup1,'Color',[0 0.447 0.741]);

% 创建 hggroup
hggroup2 = hggroup('DisplayName','H','Parent',axes1);

% 创建 line
line(XData3,YData3,'Parent',hggroup2,'Color',[0.85 0.325 0.098]);

% 创建 hggroup
hggroup3 = hggroup('DisplayName','H','Parent',axes1);

% 创建 line
line(XData4,YData4,'Parent',hggroup3,'Color',[0.929 0.694 0.125]);

% 创建 ylabel
ylabel('幅值 (dB)','HitTest','off','FontSize',11);

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[1 1000000]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[-234.320106808172 7.9467479264691]);
box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'ContextMenu','XColor',[0.4 0.4 0.4],'XMinorTick','on','XScale',...
    'log','XTickLabel','','YColor',[0.4 0.4 0.4]);
% 创建 axes
axes2 = axes('Parent',figure1,...
    'Position',[0.151428571428571 0.11 0.753571428571429 0.347240476190476]);
hold(axes2,'on');

% 创建 line
line(XData5,YData5,'Visible','off','Parent',axes2);

% 创建 hggroup
hggroup4 = hggroup('DisplayName','H','Parent',axes2);

% 创建 line
line(XData2,YData6,'Parent',hggroup4,'Color',[0 0.447 0.741]);

% 创建 hggroup
hggroup5 = hggroup('DisplayName','H','Parent',axes2);

% 创建 line
line(XData3,YData7,'Parent',hggroup5,'Color',[0.85 0.325 0.098]);

% 创建 hggroup
hggroup6 = hggroup('DisplayName','H','Parent',axes2);

% 创建 line
line(XData4,YData8,'Parent',hggroup6,'Color',[0.929 0.694 0.125]);

% 创建 ylabel
ylabel('相位 (deg)','HitTest','off');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes2,[1 1000000]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes2,[-272.7 2.7]);
box(axes2,'on');
hold(axes2,'off');
% 设置其余坐标区属性
set(axes2,'ContextMenu','FontSize',13,'LineWidth',1.5,'XColor',...
    [0.4 0.4 0.4],'XMinorTick','on','XScale','log','YColor',[0.4 0.4 0.4],...
    'YTick',[-270 -180 -90 0]);
% 创建 xlabel
xlabel('频率  (rad/s)','HitTest','off','Units','pixels',...
    'HorizontalAlignment','center',...
    'FontSize',11,...
    'Visible','on');

% 创建 title
title('Bode Diagram','HitTest','off','Units','pixels',...
    'HorizontalAlignment','center',...
    'FontSize',11);

