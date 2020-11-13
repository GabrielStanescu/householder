function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  y = 0;
  X = 0;
  sol = 0;
  %concatenarea path-ului cu "cats/", respectiv cu "not_cats"
  cats = strcat(path_to_dataset, "cats/");
  not_cats = strcat(path_to_dataset, "not_cats/");
  %aflarea numelor imaginilor
  cats_images = getImgNames(cats);
  not_cats_images = getImgNames(not_cats);
  nrcats = rows(cats_images);
  nrncats = rows(not_cats_images);
  %verific mai intai daca am ca parametru RGB sau HSV
  if histogram == "RGB"
    %parcurg fiecare imagine si apelez functia respectiva
    %pentru a intoarce histograma in vectorul sol
    for i = 1 : nrcats
      image_path = strcat(cats, cats_images(i, 1 : 10));
      sol = rgbHistogram(image_path, count_bins);
      X(i, 1 : 3 * count_bins) = sol;
      y(i) = 1;
    endfor
    for i = 1 : nrncats
      image_path = strcat(not_cats, not_cats_images(i, 1 : 10));
      sol = rgbHistogram(image_path, count_bins);
      X(i + nrcats, 1 : 3 * count_bins) = sol;
      y(i + nrcats) = -1;
    endfor
  else if histogram == "HSV"
    for i = 1 : nrcats
      image_path = strcat(cats, cats_images(i, 1 : 10));
      sol = hsvHistogram(image_path, count_bins);
      X(i, 1 : 3 * count_bins) = sol;
      y(i) = -1;
    endfor
    for i = 1 : nrncats
      image_path = strcat(not_cats, not_cats_images(i, 1 : 10));
      sol = hsvHistogram(image_path, count_bins);
      X(i + nrcats, 1 : 3 * count_bins) = sol;
      y(i + nrcats) = -1;
    endfor
    endif
  endif
endfunction
