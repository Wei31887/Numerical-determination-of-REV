function [K] = SampleKTensor(eflowx, eflowy, eflowz, boundary, center, Li, ix, iy, iz)
% function to get the k tensor of each fractured rock mass.

%% 
[xleft, xright, xfront, xback, xdown, xup] = SampleBoundary(eflowx, boundary, center, Li);
[yleft, yright, yfront, yback, ydown, yup] = SampleBoundary(eflowy, boundary, center, Li);
[zleft, zright, zfront, zback, zdown, zup] = SampleBoundary(eflowz, boundary, center, Li);

%% Flow each side
Ai = Li^2;

[Qxx,Vxx] = direcx1_flow(Ai,xleft,xright); [Qyx,Vyx]=direcy1_flow(Ai,xfront,xback); [Qzx,Vzx]=direcz1_flow(Ai,xdown,xup);
[Qxy,Vxy] = direcx1_flow(Ai,yleft,yright); [Qyy,Vyy]=direcy1_flow(Ai,yfront,yback); [Qzy,Vzy]=direcz1_flow(Ai,ydown,yup);
[Qxz,Vxz] = direcx1_flow(Ai,zleft,zright); [Qyz,Vyz]=direcy1_flow(Ai,zfront,zback); [Qzz,Vzz]=direcz1_flow(Ai,zdown,zup);

Vx = [Vxx ; Vyx ; Vzx]; Vy = [Vxy ; Vyy ; Vzy]; Vz = [Vxz ; Vyz ; Vzz];

%%
Kx = Vx / ix; Ky = Vy / iy; Kz = Vz / iz;
K = [Kx, Ky, Kz];

end
