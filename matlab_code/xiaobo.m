matrix = load('digit_statistic.data') ;%read file to a matrix



[y] = dwtndn(matrix,'haar');   %multi-dimension transform

[new_matrix] = idwtndn(y,'haar'); %multi-dimension reverse transform