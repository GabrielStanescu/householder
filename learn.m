function [w] = learn(X, y)
  %avem ecuatia X*w=y
  X = [X ones(rows(X), 1)];
  [Q R] = Householder(X);
  %avem ecuatia Q*R*w=y
  y = Q' * y';
  %avem ecuatia R*w=Q'*y
  %rezolvarea cu sst a sistemului R*w=y
  w = SST(R, y);
end
