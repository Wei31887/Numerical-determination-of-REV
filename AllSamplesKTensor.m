function [K_tensor_ave, K_tensor_samples, Kxx, Kyy, Kzz, Krm1] = AllSamplesKTensor(eflow1ux, eflow1uy, eflow1uz, DFN_boundary, samples_length, samples_center, samples_times, ix, iy, iz)
% function to calculate average k tensor, krm1 of all samples.
% Krm1 = 1/3 * (Kxx + Kyy + Kzz)

K_tensor_samples = []; K_tensor_ave = [];
for i = 1 : length(samples_length)
    tem_K_tensor_samples = [];
    tem_K_tensor = [];
    tem_K_tot = zeros(3); % three-dimentional k tensor
    for j = 1 : samples_times
        tem_K = SampleKTensor(eflow1ux, eflow1uy, eflow1uz, DFN_boundary, samples_center(samples_times * (i-1) + j, :), samples_length(i), ix, iy, iz);
        tem_K_tensor_samples = [tem_K_tensor_samples ; tem_K];
        tem_K_tot = tem_K_tot + tem_K_tensor_samples(3*(j-1) + 1 : 3*(j-1) + 3, :);
        Kxx(i, j) = tem_K(1, 1); 
        Kyy(i, j) = tem_K(2, 2); 
        Kzz(i, j) = tem_K(3, 3);
    end   
    tem_K_tensor = (1 / samples_times) * tem_K_tot; 
    K_tensor_ave = [K_tensor_ave, tem_K_tensor]; % calculate K tensor of each size!
    K_tensor_samples = [K_tensor_samples, tem_K_tensor_samples];
    
end
Krm1 = 1/3 * (Kxx + Kyy + Kzz);

end