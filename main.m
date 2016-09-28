%% PARAMETERS:
%number of agents
N = 3;
%dimension
d = 2;
%final time
T = 100;
%mesh length
n = 1000;



%% INITIAL CONDITIONS
%initial positions
x0 = initx(N, d, N*1);

%initial velocities
v0 = initv(N, d, 1);




%% CREATE THE DYNAMICS
delta = 0.4;
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
title('evolution of the system');

% % plot animated lines
% for i = 1:N
%     AL(i) = animatedline; 
% end
% axis([-5 10 0 15])
% for k = 1:length(t);
%     % add points to the animated line     
%     for i=1:N
%         addpoints(AL(i), sol(k, 2*i-1), sol(k, 2*i));
%     end
%     % update screen
%     drawnow 
% end




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

%% PLOT 1/2N^2  sumij||xi -xj ||^2 evolution and ||xip - xjp||^2 evolution
ip = 1;
jp = 2;
for i = 1:length(t)
    x = reshape(sol(i, 1 : N*d), [d, N])';
    v = reshape(sol(i, N*d+1 : 2*N*d), [d, N])';
    YB(i) =  B(x, x, N);
    YBp(i) = Bparticular(x, x, ip, jp);
    YdBp(i) = dBparticular(x, v, ip, jp);
end

figure
plot(t, YB);
title('1/2N^2  sumij||xi -xj ||^2');
figure
plot(t, YBp);
title(sprintf('||x%d -x%d ||^2', ip, jp));
figure
plot(t, YdBp);
title(sprintf('d/dt ||x%d -x%d ||^2 = 2 (x%d - x%d)(v%d - v%d)', ip, jp, ip, jp, ip, jp));

% subplot(2,2,3)
% axis([0 11 0 21])
% alYBp = animatedline;
% for k = 1:length(t)
%     x = reshape(sol(k, 1 : N*d), [d, N])';
%     YBp(k) = Bparticular(x, x, 1, 2);
%     addpoints(alYBp, t(k), YBp(k));
%     drawnow
% end
% 
% subplot(2,2,3)
% axis([0 11 0 21])
% alYBp = animatedline;
% for k = 1:length(t)
%     x = reshape(sol(k, 1 : N*d), [d, N])';
%     YBp(k) = Bparticular(x, x, 1, 2);
%     addpoints(alYBp, t(k), YBp(k));
%     drawnow
% end
