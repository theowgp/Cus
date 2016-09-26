function x = initx(N, d, maxx )
x = zeros(N, d);

% % random
% for i=1:d
%     t = rand(N, 1);
%     x(:, i) = t * maxx;
% end


% % uniform
% for i = 2:N
%     x(i, 1) = x(i-1, 1) + 1;
% end

% % N = 2, d = 1
% x = [-10; 10];

x = [-1 0; 0 0; 1 0];
end
