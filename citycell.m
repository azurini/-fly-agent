function varargout = citycell(file,x,y,z,v)


%每个cell，x或y边的长度为1024，z的高度不限。
%每个建筑物可以被放进一个或多个cell中，其中x或y里较大的边等于1024的倍数，其他边按比例变化。
%v是所占cell的个数，建筑物可以占有v的平方个面积，同样高度不限。

%被倒入的建筑物文件格式必须为stl文件。

fv1=stlread(file);

x=x*1024;
y=y*1024;
s=size(fv1.vertices(:,1));
%%
%归一化

int(1)=max(fv1.vertices(:,1));
int(2)=min(fv1.vertices(:,1));
int(3)=max(fv1.vertices(:,2));
int(4)=min(fv1.vertices(:,2));
int(5)=max(fv1.vertices(:,3));
int(6)=min(fv1.vertices(:,3));

if int(1)-int(2)>int(3)-int(4)
    ym=1024.*(int(3)-int(4))./(int(1)-int(2));
    zm=1024.*(int(5)-int(6))./(int(1)-int(2));
    fv1.vertices(1:s,1)=(fv1.vertices(1:s,1)-int(2)).*1024./(int(1)-int(2));
    fv1.vertices(1:s,2)=(fv1.vertices(1:s,2)-int(4)).*ym./(int(3)-int(4));
    fv1.vertices(1:s,3)=(fv1.vertices(1:s,3)-int(6)).*zm./(int(5)-int(6));
else
    xm=1024.*(int(1)-int(2))./(int(3)-int(4));
    zm=1024.*(int(5)-int(6))./(int(3)-int(4));
    fv1.vertices(1:s,1)=(fv1.vertices(1:s,1)-int(2)).*xm./(int(1)-int(2));
    fv1.vertices(1:s,2)=(fv1.vertices(1:s,2)-int(4)).*1024./(int(3)-int(4));
    fv1.vertices(1:s,3)=(fv1.vertices(1:s,3)-int(6)).*zm./(int(5)-int(6));
end

%%
%位移
%x
fv1.vertices(1:s,1)=fv1.vertices(1:s,1).*v+x;

%y
fv1.vertices(1:s,2)=fv1.vertices(1:s,2).*v+y;

%z
fv1.vertices(1:s,3)=fv1.vertices(1:s,3).*v+z;


%%
%制图

patch(fv1,'FaceColor',[0.8 0.8 1.0], 'EdgeColor','none','FaceLighting','gouraud','AmbientStrength', 0.15);

