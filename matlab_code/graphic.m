
%%%%%%%%%%%%%%%%%%%%        E = 0.1
err = [1.3255,0.7577,0.513,0.3471,0.1605];
re_err = [0.0022,0.0017,0.0015,0.0028,0.0012];

err1 = [1.3255,0.7577,0.513,0.3471,0.1605];
re_err1 = [0.0022,0.0017,0.0015,0.0028,0.0012];

x = 1:5;
figure(1);

plot(x,err,'b-^','LineWidth',1,'MarkerSize',9);
axis([0.5,5,0,2]);
set(gca, 'XTick', [1,2,3,4,5]); 
title('average absolute error');
xlabel('items');
ylabel('average absolute error');
legend('absolute error','Location','best')



figure(2)
plot(x,re_err,'b-^','LineWidth',1,'MarkerSize',9);
axis([0.5,5,0,0.005]);
title('average relative error');
xlabel('items');
ylabel('average relative error');
legend('relative error','Location','best')







%%%%%%%%%%%%%%%%%%%   E= 0.5
err = [6.46,5.128,2.973,0.84,0.3607];
re_err = [0.0077,0.0031,0.0111,0.0099,0.0039];

err1 = [1.3255,0.7577,0.513,0.3471,0.1605];
re_err1 = [0.0022,0.0017,0.0015,0.0028,0.0012];

x = 1:5;
figure(3);

plot(x,err,'b-^','LineWidth',1,'MarkerSize',9);
axis([0.5,5,0,8]);
set(gca, 'XTick', [1,2,3,4,5]); 
title('average absolute error');
xlabel('items');
ylabel('average absolute error');
legend('absolute error','Location','best')


figure(4)

plot(x,re_err,'b-^','LineWidth',1,'MarkerSize',9);
axis([0.5,5,0,0.015]);
title('average relative error');
xlabel('items');
ylabel('average relative error');
legend('relative error','Location','best')








%%%%%%%%%%%%%%%%%%%        E = 1.0
err = [13.5152,9.015,4.7979,2.2041,0.7202];
re_err = [0.0234,0.0213,0.0144,0.0335,0.0137];

err1 = [1.3255,0.7577,0.513,0.3471,0.1605];
re_err1 = [0.0022,0.0017,0.0015,0.0028,0.0012];

x = 1:5;
figure(5);

plot(x,err,'b-^','LineWidth',1,'MarkerSize',9);
axis([1,5,0,14]);
set(gca, 'XTick', [1,2,3,4,5]); 
title('average absolute error');
xlabel('items');
ylabel('average absolute error');
legend('DiffWave','Location','best')

%'Dwork'

figure(6)

plot(x,re_err,'b-^','LineWidth',1,'MarkerSize',9);
axis([1,5,0,0.04]);
title('average relative error');
xlabel('items');
ylabel('average relative error');
legend('relative error','Location','best')




%%%%%%%%%%%%%%%%%%%              E  = 1.5
err = [19.2961,14.186,8.6361,2.731,0.7614];
re_err = [0.0366,0.0266,0.0162,0.0463,0.0184];

err1 = [1.3255,0.7577,0.513,0.3471,0.1605];
re_err1 = [0.0022,0.0017,0.0015,0.0028,0.0012];

x = 1:5;
figure(7);

plot(x,err,'b-^','LineWidth',1,'MarkerSize',9);
axis([1,5,0,20]);
set(gca, 'XTick', [1,2,3,4,5]); 
title('average absolute error');
xlabel('items');
ylabel('average absolute error');
legend('absolute error','Location','best')



figure(8)

plot(x,re_err,'b-^','LineWidth',1,'MarkerSize',9);
axis([1,5,0,0.05]);
title('average relative error');
xlabel('items');
ylabel('average relative error');
legend('relative error','Location','best')
%%%%%%%%%%%%%%%%%%%
