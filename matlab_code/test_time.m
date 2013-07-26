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