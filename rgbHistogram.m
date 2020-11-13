function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  %stabilirea intervalului de valori
  interval = linspace(0, 256, count_bins + 1);
  %vectorizare
  R = double(vec(image(:,:,1)));
  G = double(vec(image(:,:,2)));
  B = double(vec(image(:,:,3)));
  n = rows(R);
  %histogramele in functie de culori
  solR = histc(R, interval)';
  solG = histc(G, interval)';
  solB = histc(B, interval)';
  %eliminarea ultimului element deoarece acesta va fi 0
  solR(end) = [];
  solG(end) = [];
  solB(end) = [];
  %concatenarea vectorilor
  sol = [solR solG solB];
end