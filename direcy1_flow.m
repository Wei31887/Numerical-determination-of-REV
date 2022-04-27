function [Qy,Vy]=direcy1_flow(Ai,nfront,nback)

direct_flow_front=nfront(:,6).*nfront(:,11);
direct_flow_front(isnan(direct_flow_front))=0;
total_flow_front=sum(direct_flow_front);

direct_flow_back=nback(:,6).*nback(:,11);
direct_flow_back(isnan(direct_flow_back))=0;
total_flow_back=sum(direct_flow_back);

if total_flow_front==0
    Qy=0;
else if total_flow_back==0
        Qy=0;
    else
        Qy=0.5*(total_flow_front+total_flow_back);
    end
end

Vy=Qy/Ai;

end