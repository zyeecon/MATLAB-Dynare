%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'rbchomework';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbchomework.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_partitions = struct();
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'z_ss');
M_.param_names_tex = char(M_.param_names_tex, 'z\_ss');
M_.param_names_long = char(M_.param_names_long, 'z_ss');
M_.param_names = char(M_.param_names, 'n_ss');
M_.param_names_tex = char(M_.param_names_tex, 'n\_ss');
M_.param_names_long = char(M_.param_names_long, 'n_ss');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'i_ss');
M_.param_names_tex = char(M_.param_names_tex, 'i\_ss');
M_.param_names_long = char(M_.param_names_long, 'i_ss');
M_.param_names = char(M_.param_names, 'c_ss');
M_.param_names_tex = char(M_.param_names_tex, 'c\_ss');
M_.param_names_long = char(M_.param_names_long, 'c_ss');
M_.param_names = char(M_.param_names, 'l_ss');
M_.param_names_tex = char(M_.param_names_tex, 'l\_ss');
M_.param_names_long = char(M_.param_names_long, 'l_ss');
M_.param_names = char(M_.param_names, 'k_ss');
M_.param_names_tex = char(M_.param_names_tex, 'k\_ss');
M_.param_names_long = char(M_.param_names_long, 'k_ss');
M_.param_names = char(M_.param_names, 'y_ss');
M_.param_names_tex = char(M_.param_names_tex, 'y\_ss');
M_.param_names_long = char(M_.param_names_long, 'y_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 7;
M_.param_nbr = 18;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('rbchomework_static');
erase_compiled_function('rbchomework_dynamic');
M_.orig_eq_nbr = 7;
M_.eq_nbr = 7;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 0;
 1 5 0;
 0 6 10;
 0 7 11;
 2 8 12;
 0 9 13;]';
M_.nstatic = 2;
M_.nfwrd   = 3;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 2;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(18, 1);
M_.NNZDerivatives = [27; -1; -1];
close all;
M_.params( 1 ) = 0.33;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 3 ) = 0.023;
delta = M_.params( 3 );
M_.params( 4 ) = 0.95;
rho = M_.params( 4 );
time    = 1; 
M_.params( 8 ) = 0.7;
psi = M_.params( 8 );
M_.params( 9 ) = 0.7;
phi = M_.params( 9 );
M_.params( 6 ) = M_.params(8)*(1-M_.params(9))-1;
kappa = M_.params( 6 );
M_.params( 7 ) = (1-M_.params(9))*(1-M_.params(8));
lambda = M_.params( 7 );
M_.params( 5 ) = 0.007/(1-M_.params(1));
sigma = M_.params( 5 );
M_.params( 10 ) = 1;
z_ss = M_.params( 10 );
M_.params( 12 ) = (M_.params(1)*M_.params(2)/(1-M_.params(2)+M_.params(2)*M_.params(3)))^(1/(1-M_.params(1)));
theta = M_.params( 12 );
M_.params( 13 ) = M_.params(10)*M_.params(12)^M_.params(1);
eta = M_.params( 13 );
M_.params( 11 ) = 1/(1+1/(1-M_.params(1))*(1-M_.params(8))/M_.params(8)*(1-M_.params(3)*M_.params(12)^(1-M_.params(1))));
n_ss = M_.params( 11 );
M_.params( 14 ) = M_.params(3)*M_.params(12)*M_.params(11);
i_ss = M_.params( 14 );
M_.params( 15 ) = M_.params(11)*(M_.params(13)-M_.params(3)*M_.params(12));
c_ss = M_.params( 15 );
M_.params( 16 ) = 1-M_.params(11);
l_ss = M_.params( 16 );
M_.params( 17 ) = M_.params(12)*M_.params(11);
k_ss = M_.params( 17 );
M_.params( 18 ) = M_.params(11)*M_.params(13);
y_ss = M_.params( 18 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 6 ) = M_.params(10);
oo_.steady_state( 4 ) = M_.params(11);
oo_.steady_state( 2 ) = M_.params(14);
oo_.steady_state( 7 ) = M_.params(15);
oo_.steady_state( 5 ) = M_.params(16);
oo_.steady_state( 3 ) = M_.params(17);
oo_.steady_state( 1 ) = M_.params(18);
oo_.exo_steady_state( 1 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(5)^2;
steady;
options_.loglinear = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('rbchomework_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbchomework_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbchomework_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbchomework_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbchomework_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbchomework_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbchomework_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
