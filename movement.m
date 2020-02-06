function varargout = movement(t)


%% 创建运动对象

   [fv1,h1,s1]=flyagent('Drone_2.0_Complete_Indoor_02.stl',[1,0,0.9]);
   [fv2,h2,s2]=flyagent('Drone_2.0_Complete_Indoor_02.stl',[1,0,0.8]);
   [fv3,h3,s3]=flyagent('Drone_2.0_Complete_Indoor_02.stl',[1,0,0.7]);
   [fv4,h4,s4]=flyagent('Drone_Complete_outdoor_02.stl',[1,0,0.6]);
   [fv5,h5,s5]=flyagent('Drone_Complete_outdoor_02.stl',[1,0,0.5]);
   [fv6,h6,s6]=flyagent('Drone_Complete_outdoor_02.stl',[1,0,0.4]);
   
%% 初始化

    v=flyproxy;
    
    %axis('image');
    axis([-1000,4000,-100,4000,-1000*pi,1000*pi])
    view([-135 35]);
    
%% 开始运动循环

   for i=1:1:t
       
       % 设置运动对象
       set(h1,'xdata',fv1.vertices(1:s1,1),'ydata',fv1.vertices(1:s1,2),'zdata',fv1.vertices(1:s1,3));
       set(h2,'xdata',fv2.vertices(1:s2,1),'ydata',fv2.vertices(1:s2,2),'zdata',fv2.vertices(1:s2,3));
       set(h3,'xdata',fv3.vertices(1:s3,1),'ydata',fv3.vertices(1:s3,2),'zdata',fv3.vertices(1:s3,3));
       set(h4,'xdata',fv4.vertices(1:s4,1),'ydata',fv4.vertices(1:s4,2),'zdata',fv4.vertices(1:s4,3));
       set(h5,'xdata',fv5.vertices(1:s5,1),'ydata',fv5.vertices(1:s5,2),'zdata',fv5.vertices(1:s5,3));
       set(h6,'xdata',fv6.vertices(1:s6,1),'ydata',fv6.vertices(1:s6,2),'zdata',fv6.vertices(1:s6,3));
       
       drawnow limitrate;                %刷新屏幕     
       pause(0.0005)                     %暂停一下   
       
       % 更新运动规则
        fv1.vertices(1:s1,:)=fv1.vertices(1:s1,:)+v(i,:,1);
%        fv2.vertices(1:s2,:)=fv2.vertices(1:s2,:)+v(i,:,2);
%        fv3.vertices(1:s3,:)=fv3.vertices(1:s3,:)+v(i,:,3);
%        fv4.vertices(1:s4,:)=fv4.vertices(1:s4,:)+v(i,:,4);
%        fv5.vertices(1:s5,:)=fv5.vertices(1:s5,:)+v(i,:,5);
%        fv6.vertices(1:s6,:)=fv6.vertices(1:s6,:)+v(i,:,6);
       
   end



