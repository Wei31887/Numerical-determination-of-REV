function [eflown] = AddApertureIntoData(flown)
% function to get the aperture, efficient aperture of fractured rock mass &
% arrange the data from the file.

%% get the velocity of fracture & aperture of fracture
vel_fracture = sqrt(flown(:,5).^2 + flown(:,6).^2 + flown(:,7).^2);
e_fracture = flown(:,8)./ vel_fracture; % aperture
e_fracture(isnan(e_fracture)) = 0;

%% fix z-axis to get the cosine & sine of the aperture and x-axis 
sind = abs(flown(:,7)) ./ vel_fracture; 
sind(isnan(sind)) = 0;
cosd = sqrt(1-(sind).^2);
cosd(isnan(cosd)) = 0;

%% get the efficient aperture on the surface of horizontal & vertical part of rock mass. 
e_horizontal = e_fracture ./ sind;
e_horizontal(isnan(e_horizontal)) = 0;
e_vertical = e_fracture ./ cosd;
e_vertical(isnan(e_vertical)) = 0;

eflown = [flown, e_fracture, e_horizontal, e_vertical];

end