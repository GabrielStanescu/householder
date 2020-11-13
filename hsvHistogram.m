function [sol] = hsvHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  [N M D] = size(image);
  %vectorizare
  R = vec(image(:,:,1));
  G = vec(image(:,:,2));
  B = vec(image(:,:,3));
  R = double(R) / 255;
  G = double(G) / 255;
  B = double(B) / 255;
  Cmax = max(max(R, G), B);
  Cmin = min(min(R, G), B);
  delta = Cmax - Cmin;
  %calcularea vectorului V
  V = Cmax;
  S = zeros(N * M, 1);
  %gasirea valorilor nenule din Cmax
  Cnenul = find(Cmax);
  S(Cnenul) = delta(Cnenul) ./ Cmax(Cnenul);
  H = zeros(N * M, 1);
  %gasirea valorilor nule din diferenta Cmax si a culorilor
  Rnul = find(~(Cmax - R));
  Gnul = find(~(Cmax - G));
  Bnul = find(~(Cmax - B));
  H(Rnul) = 60 * mod((G(Rnul) - B(Rnul)) ./ delta(Rnul), 6);
  H(Gnul) = 60 * ((B(Gnul) - R(Gnul)) ./ delta(Gnul) + 2);
  H(Bnul) = 60 * ((R(Bnul) - G(Bnul)) ./ delta(Bnul) + 4);
  H = H / 360;
  %stabilirea intervalului
  interval = linspace(1.01 / count_bins, 1.01, count_bins);
  interval = [0 interval];
  interval(end) ++;
  %calcularea histogramelor
  solH = histc(H, interval)';
  solS = histc(S, interval)';
  solV = histc(V, interval)';
  solH(end) = [];
  solS(end) = [];
  solV(end) = [];
  %concatenarea histogramelor
  sol = [solH solS solV];
  endfunction