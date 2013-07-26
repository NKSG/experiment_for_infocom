source = load('digit_statistic.data') ;%read file to source

dimension = max( [max(source(:,1)),max(source(:,2)),max(source(:,5)) ] );

i = 1;
while i<dimension
    i = i*2;
end
dimension = i;
%compute the dimension for 

matrix = zeros(dimension,dimension,dimension);

%generate a 5-Dimension zero matrix.

[x,] = size(source);
for i=1:x
    matrix( source(i,1),source(i,2),source(i,5) ) =matrix( source(i,1),source(i,2),source(i,5) ) + source(i,6);
end

N = 5;
% multi-level is N;

[y] =  wavedecnd(matrix,N,'haar');   %Multi-level N-D wavelet decomposition.
%save('decomposition.data','y');
[new_matrix] =waverecnd(y,N,'haar'); %Multi-level N-D wavelet reconstruction.
%save('restruction.data','new_matrix');