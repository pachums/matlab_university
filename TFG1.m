#GRAFICA AL FINAL NO USADA
cla reset
x=0:0.01:1;
y1=-4*x+1;
y2=3*x-1;
hold on;
p1 = plot(x,y1);
p2 = plot(x,y2);

set(p1,'Color','blue','LineWidth',1)
set(p2,'Color','blue','LineWidth',1)

z=0:0.001:2/7;
pp1=plot(z,3*z-1);
set(pp1,'Color','red','LineWidth',3)
z=2/7:0.01:1;
pp2=plot(z,-4*z+1);
set(pp2,'Color','red','LineWidth',3)

x1 = 0.11; y1 = 0.7; txt1 = ' -4p+1'; text(x1,y1,txt1,'FontSize',14)
x1 = 0.5; y1 = 0.93; txt1 = '3p-1'; text(x1,y1,txt1,'FontSize',14)
axis("auto")
grid('on')