% test MADMM function
clear all;close all;
%% Dependencies
addpath(genpath('./../Code/'))
addpath(genpath('./../Data/'))
addpath(genpath('./../Utils/'))
addpath(genpath('./../../3D_shapes_tools/'))
addpath(genpath('./../../manopt/'))

%% params:
N = 10; % num rows
M = 20; % num cols
lambda = 2;
rho = 1;

% set data term: f(x) = 0.5*|AX-B|_F^2
A = rand(N);
B = rand(N,M);

functions.fun_f = @(X)0.5*sum( sum( (A*X - B).^2 ) );
functions.dfun_f = @(X)A'*(A*X - B)

% % % check grad
% problem.M = euclideanfactory(N, M);
% problem.cost = fun_f;
% problem.egrad = dfun_f;
% x0 = rand(N,M);
% checkgradient(problem);


% set the l2 term for the Z parameter replacement
functions.fun_h = @(X,Z,U)0.5*sum( sum( ( X-Z+U ).^2 ) );  
functions.dhdx = @(X,Z,U)X+U-Z
functions.dhdz = @(X,Z,U)Z-X-U


% % % check grad
% Z = rand(N,M);
% U = rand(N,M);
% problem.M = euclideanfactory(N, M);
% problem.cost = @(X)fun_h(Z,X,U);
% problem.egrad = @(X)dfun_h(Z,X,U);
% x0 = rand(N,M);
% checkgradient(problem);

%% test the MADMM implementation for the L2,1 norm
x0 = rand(N,M);
params.lambda = lambda;
params.rho = rho;
params.manifold = euclideanfactory(N, M);
params.is_plot = 1;
madmm_l21(x0,functions,params)

