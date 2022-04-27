function [data_left,data_right,data_front,data_back,data_down,data_up] = SampleBoundary(flow,boundary,center,Li)
% function to determine boundaries of the sample.

if center(1)-0.5*Li<boundary(1)
    disp('exceed left boundary');
    return
end

if center(1)+0.5*Li>boundary(2)
    disp('exceed right boundary');
    return
end

if center(2)-0.5*Li<boundary(3)
    disp('exceed front boundary');
    return
end

if center(2)+0.5*Li>boundary(4)
    disp('exceed back boundary');
    return
end

if center(3)-0.5*Li<boundary(5)
    disp('exceed down boundary');
    return
end

if center(3)+0.5*Li>boundary(6)
    disp('exceed up boundary');
    return
end

left=find(flow(:,2)>=center(1)-0.5*Li & flow(:,2)<=center(1)-0.5*Li+1 & flow(:,3)>=center(2)-0.5*Li & flow(:,3)<=center(2)+0.5*Li & flow(:,4)>=center(3)-0.5*Li & flow(:,4)<=center(3)+0.5*Li); % left side
right=find(flow(:,2)>=center(1)+0.5*Li-1 & flow(:,2)<=center(1)+0.5*Li & flow(:,3)>=center(2)-0.5*Li & flow(:,3)<=center(2)+0.5*Li & flow(:,4)>=center(3)-0.5*Li & flow(:,4)<=center(3)+0.5*Li); % right side
front=find(flow(:,2)>=center(1)-0.5*Li & flow(:,2)<=center(1)+0.5*Li & flow(:,3)>=center(2)-0.5*Li & flow(:,3)<=center(2)-0.5*Li+1 & flow(:,4)>=center(3)-0.5*Li & flow(:,4)<=center(3)+0.5*Li); % front side
back=find(flow(:,2)>=center(1)-0.5*Li & flow(:,2)<=center(1)+0.5*Li & flow(:,3)>=center(2)+0.5*Li-1 & flow(:,3)<=center(2)+0.5*Li & flow(:,4)>=center(3)-0.5*Li & flow(:,4)<=center(3)+0.5*Li); % back side
down=find(flow(:,2)>=center(1)-0.5*Li & flow(:,2)<=center(1)+0.5*Li & flow(:,3)>=center(2)-0.5*Li & flow(:,3)<=center(2)+0.5*Li & flow(:,4)>=center(3)-0.5*Li & flow(:,4)<=center(3)-0.5*Li+1); % down side
up=find(flow(:,2)>=center(1)-0.5*Li & flow(:,2)<=center(1)+0.5*Li & flow(:,3)>=center(2)-0.5*Li & flow(:,3)<=center(2)+0.5*Li & flow(:,4)>=center(3)+0.5*Li-1 & flow(:,4)<=center(3)+0.5*Li); % up side

if isempty(left)
    data_left=zeros(1,11);
else
    for i=1:length(left)
        data_left(i,:)=flow(left(i),:);
    end
end

if isempty(right)
    data_right=zeros(1,11);
else
    for i=1:length(right)
        data_right(i,:)=flow(right(i),:);
    end
end

if isempty(front)
    data_front=zeros(1,11);
else
    for i=1:length(front)
        data_front(i,:)=flow(front(i),:);
    end
end

if isempty(back)
    data_back=zeros(1,11);
else
    for i=1:length(back)
        data_back(i,:)=flow(back(i),:);
    end
end

if isempty(down)
    data_down=zeros(1,11);
else
    for i=1:length(down)
        data_down(i,:)=flow(down(i),:);
    end
end

if isempty(up)
    data_up=zeros(1,11);
else
    for i=1:length(up)
        data_up(i,:)=flow(up(i),:);
    end
end

end