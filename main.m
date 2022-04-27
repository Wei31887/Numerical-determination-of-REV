clear; clc;
%% ------input the datas of flow------

data_bc_x = importdata('0_2x.dat',' ');
data_bc_y = importdata('0_2y.dat',' ');
data_bc_z = importdata('0_2z.dat',' ');

dh = -48; % head difference between two opposite boundaries (input)
DFN_size = 48; % DFN model length (input)
% A = DFN_size ^ 2;
head_gradient = [dh / DFN_size, dh / DFN_size, dh / DFN_size]; % [ix, iy, iz]
ix = dh / DFN_size; iy = dh / DFN_size; iz = dh / DFN_size; 

%% ------Calculate apertures, efficient appertures and put them into data------

[eflow1ux] = AddApertureIntoData(data_bc_x); 
[eflow1uy] = AddApertureIntoData(data_bc_y); 
[eflow1uz] = AddApertureIntoData(data_bc_z);

%% -------Extract samples from the DFN model & capture the boundaries of the samples------

DFN_boundary = [0, DFN_size, 0, DFN_size, 0, DFN_size];
model = 1; % numbers of DFN model
H = (2/3) * DFN_size;
% samples_length = [H/100, H/32, H/10, H/8, H/4, H/3, H/2, 20, H];    % extractions sizes from DFN model.
samples_length = [H/8];
samples_times = 9;       % numbers of extraction of each size from DFN model

% generate the random center of samples
samples_center = [];
% for i = 1 : length(samples_length)
%     samples_center = [samples_center ; SampleCenter(DFN_size, DFN_boundary, samples_length(i), samples_times)];
% end

samples_center = [SampleCenter(DFN_size, DFN_boundary, samples_length, samples_times)];


%% ------Calculate K tensor and Krm1 (1/3*(Kxx+Kyy+Kzz)) of the extractions of DFN------

[K_tensor_ave, K_tensor_samples, Kxx, Kyy, Kzz, Krm1] = AllSamplesKTensor(eflow1ux, eflow1uy, eflow1uz, DFN_boundary, samples_length, samples_center, samples_times, ix, iy, iz);

%% ------Collect statistic of K tensor and generate errorbar of it------

len = model * samples_times;
mean_Krm1 = mean(Krm1, 2);
std_Krm1 = std(Krm1, 0, 2);
std_error_Krm1 = std_Krm1 / sqrt(len);
COV_Krm1 = (std_Krm1 ./ mean_Krm1) * 100;

% figure
Errorbar(samples_times, Krm1, samples_length, len, mean_Krm1, std_Krm1, std_error_Krm1, COV_Krm1);


