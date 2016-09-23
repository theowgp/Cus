function x = initx(N, d, maxx )
x = zeros(N, d);

% random
for i=1:d
    t = rand(N, 1);
    x(:, i) = t * maxx;
end


% % uniform
% for i = 2:N
%     x0(i, 1) = x0(i-1, 1) + 1;
% end

end
