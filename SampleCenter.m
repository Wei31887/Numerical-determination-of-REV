function sample_center = SampleCenter(DFN_size, boundary, sampling_size, sampling_times)
% function to generate the random center of the samples.

%rng(0,'twister');
sample_center = randi([ceil(0.5 * sampling_size), floor(DFN_size - 0.5 * sampling_size)], sampling_times, 3);

end