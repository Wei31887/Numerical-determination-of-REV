function [Qz,Vz]=direcz1_flow(Ai,ndown,nup)

direct_flow_down=ndown(:,7).*ndown(:,10);
direct_flow_down(isnan(direct_flow_down))=0;
total_flow_down=sum(direct_flow_down);

direct_flow_up=nup(:,7).*nup(:,10);
direct_flow_up(isnan(direct_flow_up))=0;
total_flow_up=sum(direct_flow_up);

if total_flow_down==0
    Qz=0;
else if total_flow_up==0
        Qz=0;
    else
        Qz=0.5*(total_flow_down+total_flow_up);
    end
end

Vz=Qz/Ai;

end