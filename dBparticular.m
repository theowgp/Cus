function res = dBparticular(x, v, i, j)
res = 2*(x(i, :) - x(j, :))*(v(i, :) - v(j, :))';
end

