source = load('digit_statistic.data') ;%read file to source

source(:,4) = int8(source(:,4)/100+1);

matrix = zeros(dimension1,dimension2, dimension4,dimension5);

for i=1:x
    matrix( source(i,1),source(i,2),source(i,4),source(i,5) )=matrix( source(i,1),source(i,2),source(i,4),source(i,5) ) + source(i,6);
end

E = 0.5;
r = E;
noise = ones(size(matrix))*r*rand(1);
new_matrix = matrix + noise;

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
    error =error + abs(total1-total2);
    relative_error =relative_error + abs(total1-total2)/max([30,total2]);
    
  
    
    
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
    
    
    total1 = sum(sum(sum(sum(matrix(a{1}:b{1},a{2}:b{2},:,:))))) ;
    total2 = sum(sum(sum(sum(new_matrix(a{1}:b{1},a{2}:b{2},:,:))))); %
    error =error + abs(total1-total2);
    relative_error =relative_error + abs(total1-total2)/max([30,total2]);
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
    
    
    total1 = sum(sum(sum( sum( matrix(a{1}:b{1},a{2}:b{2},a{3}:b{3},:))))); %
    total2 = sum(sum(sum( sum( new_matrix(a{1}:b{1},a{2}:b{2},a{3}:b{3},:))))); %
    error =error + abs(total1-total2);
    relative_error =relative_error + abs(total1-total2)/max([30,total2]);
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









