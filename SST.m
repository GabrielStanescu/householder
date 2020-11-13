function [x] = SST(A, b)
  [N, M] = size(A);
  x=zeros(N, 1);
  for i = N : -1 : 1
    for j = (i + 1) : M
      x(i) = (b(i) - A(i, j) * x(j)) / A(i, i);
    endfor
  endfor
end
    