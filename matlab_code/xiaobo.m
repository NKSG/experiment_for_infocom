source = load('digit_statistic.data') ;%read file to source

%source(:,3) = source(:,3)/1000+1;
source(:,4) = int8(source(:,4)/100+1);
  
%dimension1 = max( [max(source(:,1)),max(source(:,2)),max(source(:,3)),max(source(:,4)),max(source(:,5)) ] );
dimension1 = max(source(:,1));
dimension2 = max(source(:,2));
%dimension3 = max(source(:,3));
dimension4 = max(source(:,4));
dimension5 = max(source(:,5));

%dimension = max( [max(source(:,1)),max(source(:,2)) ]);
i = 1;
while i<dimension1
    i = i*2;
end
dimension1 = i;
i = 1;
while i<dimension2
    i = i*2;
end
dimension2 = i;
%i = 1;
% while i<dimension3
%     i = i*2;
% end
%dimension3 = i
i = 1;
while i<dimension4
    i = i*2;
end
dimension4 = i;
i = 1;
while i<dimension5
    i = i*2;
end
dimension5 = i;
%compute the dimension for 

%matrix = zeros(dimension,dimension,dimension);
matrix = zeros(dimension1,dimension2, dimension4,dimension5);
% generate a 5-Dimension zero matrix.

[x,] = size(source);

    Timestart = tic();
    %for i=1:x
     %   matrix( source(i,1),source(i,2),source(i,5) ) =matrix( source(i,1),source(i,2),source(i,5) ) + source(i,6);
    %end
    for i=1:x
        matrix( source(i,1),source(i,2),source(i,4),source(i,5) )=matrix( source(i,1),source(i,2),source(i,4),source(i,5) ) + source(i,6);
    end



    N = 3;
    % multi-level is N;

    %E
    global E;
    E =1.25;

    [y] =  wavedecnd(matrix,N,'haar');   %Multi-level N-D wavelet decomposition.
    %save('decomposition.data','y');
    [new_matrix] =waverecnd(y,N,'haar'); %Multi-level N-D wavelet composition.
    %save('restruction.data','new_matrix');

%     s = size(matrix);
%     b = 1/E;
%     u = rand(s)-ones(s)*0.5;                        %
%     noise = -b*u./abs(u).*log(1-2*abs(u));         % 
%     new_matrix = matrix + noise;
    toc(Timestart)  % time
    
    
    Timestart = tic();
    % matrix1 = zeros(dimension1,dimension2, dimension4,dimension5);
    % for i=1:x
    %     matrix1( source(i,1),source(i,2),source(i,4),source(i,5) )= 1;
    % end
    % new_matrix = new_matrix1.*matrix1;



    %
    s = size(matrix);     % s = [128,128,...]
    d = 4;    % d = 2,3,4,5

    count = 100;           % run count times, get the average value

    %%%%%%%%%% one dimension lookup
    err = zeros(1,d);
    re_err = zeros(1,d);
    error = 0;
    relative_error =0;
    for c=1:count
        a={};
        b={};
        for j=1:d
            tuple =randi(s(j),2,1);
            b = { b{1:length(b)}, max(tuple) };
            a = { a{1:length(a)}, min(tuple) };
        end


        total1 = sum(sum(sum(sum(matrix(a{1}:b{1},:,:,:))))) ;
        total2 = sum(sum(sum(sum(new_matrix(a{1}:b{1},:,:,:)))));
        error =error + abs(total1-total2)/4;
        relative_error =relative_error + abs(total1-total2)/(4*max([30,total2]));

        total3 = sum(sum(sum(sum(matrix(:,a{2}:b{2},:,:))))) ;
        total4 = sum(sum(sum(sum(new_matrix(:,a{2}:b{2},:,:)))));
        error =error + abs(total3-total4)/4;
        relative_error =relative_error + abs(total3-total4)/(4*max([30,total4]));
        
        total5 = sum(sum(sum(sum(matrix(:,:,a{3}:b{3},:))))) ;
        total6 = sum(sum(sum(sum(new_matrix(:,:,a{3}:b{3},:)))));
        error =error + abs(total3-total4)/4;
        relative_error =relative_error + abs(total3-total4)/(4*max([30,total6]));
        
        total7 = sum(sum(sum(sum(matrix(:,:,:,a{4}:b{4}))))) ;
        total8 = sum(sum(sum(sum(new_matrix(:,:,:,a{4}:b{4})))));
        error =error + abs(total3-total4)/4;
        relative_error =relative_error + abs(total3-total4)/(4*max([30,total8]));


    end
    err(1) = error/count;
    re_err(1)= relative_error/count;


    %%%%%%%%%% two dimension lookup
    error = 0;
    relative_error =0;
    for c=1:count
        a={};
        b={};
        for j=1:d
            tuple =randi(s(j),2,1);
            b = { b{1:length(b)}, max(tuple) };
            a = { a{1:length(a)}, min(tuple) };
        end
        total1 = sum(sum(sum(sum(matrix(a{1}:b{1},:,a{3}:b{3},:))))) ;
        total2 = sum(sum(sum(sum(new_matrix(a{1}:b{1},:,a{3}:b{3},:))))); %
        error =error + abs(total1-total2)/6;
        relative_error =relative_error + abs(total1-total2)/(6*max([30,total2]));
        
        total3 = sum(sum(sum(sum(matrix(a{1}:b{1},a{2}:b{2},:,:))))) ;
        total4 = sum(sum(sum(sum(new_matrix(a{1}:b{1},a{2}:b{2},:,:))))); %
        error =error + abs(total3-total4)/6;
        relative_error =relative_error + abs(total3-total4)/(6*max([30,total4]));
        
        total5 = sum(sum(sum(sum(matrix(a{1}:b{1},:,:,a{4}:b{4}))))) ;
        total6 = sum(sum(sum(sum(new_matrix(a{1}:b{1},:,:,a{4}:b{4}))))); %
        error =error + abs(total5-total6)/6;
        relative_error =relative_error + abs(total5-total6)/(6*max([30,total6]));
       
        total7 = sum(sum(sum(sum(matrix(:,a{2}:b{2},a{3}:b{3},:))))) ;
        total8 = sum(sum(sum(sum(new_matrix(:,a{2}:b{2},a{3}:b{3},:))))); %
        error =error + abs(total7-total8)/6;
        relative_error =relative_error + abs(total7-total8)/(6*max([30,total8]));
        
        total9 = sum(sum(sum(sum(matrix(:,a{2}:b{2},:,a{4}:b{4}))))) ;
        total10 = sum(sum(sum(sum(new_matrix(:,a{2}:b{2},:,a{4}:b{4}))))); %
        error =error + abs(total9-total10)/6;
        relative_error =relative_error + abs(total9-total10)/(6*max([30,total10]));
        
        total11 = sum(sum(sum(sum(matrix(:,:,a{3}:b{3},a{4}:b{4}))))) ;
        total12 = sum(sum(sum(sum(new_matrix(:,:,a{3}:b{3},a{4}:b{4}))))); %
        error =error + abs(total11-total12)/6;
        relative_error =relative_error + abs(total11-total12)/(6*max([30,total2]));

    end
    err(2) = error/count;
    re_err(2)= relative_error/count;


    %%%%%%%%%% three dimension lookup
    error = 0;
    relative_error =0;
    for c=1:count
        a={};
        b={};
        for j=1:d
            tuple =randi(s(j),2,1);
            b = { b{1:length(b)}, max(tuple) };
            a = { a{1:length(a)}, min(tuple) };
        end


        total1 = sum(sum(sum( sum( matrix(a{1}:b{1},a{2}:b{2},:,a{4}:b{4}))))); %
        total2 = sum(sum(sum( sum( new_matrix(a{1}:b{1},a{2}:b{2},:,a{4}:b{4}))))); %
        error =error + abs(total1-total2)/4;
        relative_error =relative_error + abs(total1-total2)/(4*max([30,total2]));
        
        total3 = sum(sum(sum( sum( matrix(a{1}:b{1},a{2}:b{2},a{3}:b{3},:))))); %
        total4 = sum(sum(sum( sum( new_matrix(a{1}:b{1},a{2}:b{2},a{3}:b{3},:))))); %
        error =error + abs(total3-total4)/4;
        relative_error =relative_error + abs(total3-total4)/(4*max([30,total4]));
        
        total5 = sum(sum(sum( sum( matrix(:,a{2}:b{2},a{3}:b{3},a{4}:b{4}))))); %
        total6 = sum(sum(sum( sum( new_matrix(:,a{2}:b{2},a{3}:b{3},a{4}:b{4}))))); %
        error =error + abs(total5-total6)/4;
        relative_error =relative_error + abs(total5-total6)/(4*max([30,total6]));
        
        total7 = sum(sum(sum( sum( matrix(a{1}:b{1},:,a{3}:b{3},a{4}:b{4}))))); %
        total8 = sum(sum(sum( sum( new_matrix(a{1}:b{1},:,a{3}:b{3},a{4}:b{4}))))); %
        error =error + abs(total7-total8)/4;
        relative_error =relative_error + abs(total7-total8)/(4*max([30,total8]));
    end
    err(3) = error/count;
    re_err(3)= relative_error/count;

    %%%%%%%%%% four dimension lookup
    error = 0;
    relative_error =0;
    for c=1:count
        a={};
        b={};
        for j=1:d
            tuple =randi(s(j),2,1);
            b = { b{1:length(b)}, max(tuple) };
            a = { a{1:length(a)}, min(tuple) };
        end


        total1 = sum(sum(sum(sum(matrix(a{1}:b{1},a{2}:b{2},a{3}:b{3},a{4}:b{4}))))); %
        total2 = sum(sum(sum(sum(new_matrix(a{1}:b{1},a{2}:b{2},a{3}:b{3},a{4}:b{4}))))); %
        error =error + abs(total1-total2);
        relative_error =relative_error + abs(total1-total2)/max([30,total2]);
    end
    err(4) = error/count;
    re_err(4)= relative_error/count;


    
    toc(Timestart)  % time

























