function res = ddBparticular(dynamics, x, v, i, j)
vdot = dynamics.fv(x, v);
res = 2*((v(i, :) - v(j, :))*(v(i, :) - v(j, :))' + (vdot(i, :) - vdot(j, :))*(x(i, :) - x(j, :))');

% eps = 0.1;
% % if norm(v(i, :) - v(j, :))<eps
% %     disp([t norm(v(i, :) - v(j, :))])
% % end
% if abs(res)<eps
%     disp([t res])
% end
end