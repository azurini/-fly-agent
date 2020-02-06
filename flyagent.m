function [fv,h,s] = flyagent(filename,color)

   %h = animatedline('color',color,'linestyle',':');%船新版本
   h = line('color',color,'linestyle',':','EraseMode','xor');%运动中隐形的颜色、点形、大小和擦除方式 
   
   fv=stlread(filename);
   
   s=size(fv.vertices(:,1));
    
   
