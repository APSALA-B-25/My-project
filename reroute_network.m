function reroute_network(ax, faultType, faultLocation)
cla(ax); % clear previous plot
nodes = {'A', 'B', 'C', 'D', 'E'};
x = [1 2 3 4 5];
y = [3 4 3 4 3];

% Draw main network
plot(ax, x, y, 'k-o', 'LineWidth', 2);
hold(ax, 'on');

% Mark fault
faultIdx = find(strcmp(nodes, faultLocation(1))) + 1;
plot(ax, x(faultIdx), y(faultIdx), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Reroute path visualization
rerouteX = [1 2 4 5];
rerouteY = [3 4 4 3];
plot(ax, rerouteX, rerouteY, 'g--', 'LineWidth', 2);

title(ax, sprintf('Rerouted Path after %s Fault at %s', faultType, faultLocation));
xlabel(ax, 'Node Position');
ylabel(ax, 'Network Path');
legend(ax, 'Original Path', 'Fault Point', 'Reroute Path', 'Location', 'best');
grid(ax, 'on');
hold(ax, 'off');
end