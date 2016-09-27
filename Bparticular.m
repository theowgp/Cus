function res = Bparticular(x, y, i, j)
res = (x(i, :) - x(j, :))*(y(i, :) - y(j, :))';
end

