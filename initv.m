function v = initv( N, d, maxv )
v = zeros(N, d);

a=2;
b=-1;

for i=1:d
    t = rand(N, 1);
    v(:, i) = (a*t + b) * maxv;
end


% v =  0.5*ones(N, d);
% v = [-0.2 -0.1; 0.1 0.3; 0.5 0.2];

end

