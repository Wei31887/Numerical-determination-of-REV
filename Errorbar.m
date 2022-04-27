function Errorbar(samples_times, Krm1, samples_length, len, mean_Krm1, stdK1, std_error_Krm1, COV_K1)
% function to figure the statistic properties of KREV, K1

% generate the same size matrix of the sampling times to collect statistic
sampling_size = [];
for i = 1 : samples_times
    for j = 1 : length(samples_length)
    sampling_size(j, i) = samples_length(j);
    end
end

figure (1)
semilogy(sampling_size,Krm1,'^','MarkerEdgeColor','b','MarkerFaceColor','b');
set(gca, 'Fontname', 'Times New Roman','FontSize',12);
xlabel('Sampling size, L (m)','Fontname','Times New Roman','FontSize',12);
ylabel('Hydraulic conductivity, K_{1}^{rm} (log scale) (m/s)','Fontname','Times New Roman','FontSize',12);
title('K_{1}^{rm} Versus Sampling Size (Data)','Fontname','Times New Roman','FontSize',16);

figure (2)
errorbar(samples_length,mean_Krm1,std_error_Krm1,'ob','LineWidth',1); 
e.LineWidth = 1;
% ylim([5*10^-7 5*10^-6]);
set(gca, 'YScale', 'log');
set(gca, 'Fontname', 'Times New Roman','FontSize',12);
xlabel('Sampling size, L (m)','Fontname','Times New Roman','FontSize',12);
ylabel('Hydraulic conductivity, K_{1}^{rm} (log scale) (m/s)','Fontname','Times New Roman','FontSize',12);
title('K_{1}^{rm} Versus Sampling Size (Mean + Standard Error)','Fontname','Times New Roman','FontSize',16);

figure (3)
plot(samples_length,COV_K1,'-^b','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','b')
% hold on
% plot(sampling_L,accept1,'--r','LineWidth',1)
% plot(sampling_L,accept2,'-.g','LineWidth',1)
% hold off
% ylim([0 100]); yticks(0:10:100);
set(gca, 'Fontname', 'Times New Roman','FontSize',12);
xlabel('Sampling size, L (m)','Fontname','Times New Roman','FontSize',12);
ylabel('Coefficient of variation, COV (%)','Fontname','Times New Roman','FontSize',12);
title('COV of K_{1}^{rm} Versus Sampling Size','Fontname','Times New Roman','FontSize',16);
% legend('COV of K_{1}^{rm}','Acceptable variation: COV = 30','Acceptable variation: COV = 25');
% legend('Location','best'); legend('Orientation','horizontal');


% figure (4)
% semilogy(sampling_size,Krm1,'^','MarkerEdgeColor','b','MarkerFaceColor','b');
% set(gca, 'Fontname', 'Times New Roman','FontSize',12);
% xlabel('Sampling size, L (m)','Fontname','Times New Roman','FontSize',12);
% ylabel('Hydraulic conductivity, K_{1}^{rm} (log scale) (m/s)','Fontname','Times New Roman','FontSize',12);
% 
% 
% figure (5)
% errorbar(samples_length, mean_Krm1, std_error_Krm1,'ob','LineWidth',1); 
% e.LineWidth = 1;
% % ylim([5*10^-7 5*10^-6]);
% set(gca, 'YScale', 'log');
% set(gca, 'Fontname', 'Times New Roman','FontSize',12);
% xlabel('Sampling size, L (m)','Fontname','Times New Roman','FontSize',12);
% ylabel('Hydraulic conductivity, K_{1}^{rm} (log scale) (m/s)','Fontname','Times New Roman','FontSize',12);
% 
% 
% figure (6)
% plot(samples_length, COV_K1,'-^b','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','b')
% % hold on
% % plot(sampling_L,accept1,'--r','LineWidth',1)
% % plot(sampling_L,accept2,'-.g','LineWidth',1)
% % hold off
% % ylim([0 100]); yticks(0:10:100);
% set(gca, 'Fontname', 'Times New Roman','FontSize',12);
% xlabel('Sampling size, L (m)','Fontname','Times New Roman','FontSize',12);
% ylabel('Coefficient of variation, COV (%)','Fontname','Times New Roman','FontSize',12);
% % legend('COV of K_{1}^{rm}','Acceptable variation: COV = 30','Acceptable variation: COV = 25');
% % legend('Location','best'); legend('Orientation','horizontal');

end
