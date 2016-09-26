
%% PARAMETERS:
%number of agents
N = 3;
%dimension
d = 2;
%final time
T = 500;
%mesh length
n = 1000;



%% INITIAL CONDITIONS
%initial positions
x0 = initx(N, d, N);

%initial velocities
v0 = initv(N, d, 2);




%% CREATE THE DYNAMICS
delta = 0.45;
dynamics = Dynamics(N, d, delta);


%% SOLVE THE SYSTEM
% create a solver
A = [0 0 0; 0.5 0 0; -1 2 0];
b = [1.0/6.0    2.0/3.0    1.0/6.0];
c = [0  0.5  1];
s = 3;
solver = Solver(A, b, c, s, 2*N*d, T, n);

% adjust the initial condition for the solver
arg0 = [reshape(x0', [N*d, 1]); reshape(v0', [N*d, 1])];

% adjust the dynamics function for the solver
f = @(arg)    reshape(dynamics.f(    reshape(arg(1 : N*d), [d, N])',      reshape(arg(N*d+1 : 2*N*d), [d, N])'   )',        [2*N*d, 1] )';

% solve
[t, sol] = solver.rk(arg0, f);



% %% DEBUGING
%     x0
%     v0
%     
%     arg0
%     
%     farg0 = f(arg0)
% disp('debugging finished');



%% PLOT TRAJECTORIES
for i = 1:N
    plot(sol(:, 2*i-1), sol(:, 2*i));
    hold all
end

% %% PLOT TRAJECTORIES with respect to time for d = 1
% % positions
% for i = 1:N
%     plot(t, sol(:, i));
%     hold all
% end
% % velocities
% figure
% for i = N+1:2*N
%     plot(t, sol(:, i));
%     hold all
% end

%% PLOT 1/2N^2  sumij||xi -xj ||^2 evolution
for i = 1:length(t)
x = reshape(sol(i, 1 : N*d), [d, N])';
% y = reshape(sol(i, N*d+1 : 2*N*d), [d, N])';    
Y(i) =  B(x, x, N);
end
figure
plot(t, Y);