theta = linspace(0,2*pi,1000);
h = animatedline();
axis([0,2*pi,-1,1])

for t = theta
    addpoints(h,t,sin(t));
    drawnow;
end

% t = linspace(0,2*pi,10000);
% y = exp(sin(t));
% h = plot(t,y);
% 
% for k = 1:0.01:10
%    y = exp(sin(t.*k));
%    h.YData = y; 
%    drawnow
% end