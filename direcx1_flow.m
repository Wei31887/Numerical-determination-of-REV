function [Qx,Vx]=direcx1_flow(Ai,nleft,nright)

direct_flow_left=nleft(:,5).*nleft(:,11);
direct_flow_left(isnan(direct_flow_left))=0;
total_flow_left=sum(direct_flow_left);

direct_flow_right=nright(:,5).*nright(:,11);
direct_flow_right(isnan(direct_flow_right))=0;
total_flow_right=sum(direct_flow_right);

if total_flow_left==0
    Qx=0;
else if total_flow_right==0
        Qx=0;
    else
        Qx=0.5*(total_flow_left+total_flow_right);
    end
end

Vx=Qx/Ai;

end