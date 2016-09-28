function res = dBparticular(x, v, i, j)
res = 2*(x(i, :) - x(j, :))*(v(i, :) - v(j, :))';

% eps = 0.1;
% % if norm(v(i, :) - v(j, :))<eps
% %     disp([t norm(v(i, :) - v(j, :))])
% % end
% if abs(res)<eps
%     disp([t res])
% end
end

