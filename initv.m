function v = initv(N, d, maxv)
v = zeros(N, d);

% % random
% a=2;
% b=-1;
% 
% for i=1:d
%     t = rand(N, 1);
%     v(:, i) = (a*t + b) * maxv;
% end


% v =  0.5*ones(N, d);


% % N = 2, d = 1
% v = [-0.1; 0.1];

v = [1 2;  0 0;  1 1];
end

