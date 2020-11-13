function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cats = strcat(path_to_testset, "cats/");
  not_cats = strcat(path_to_testset, "not_cats/");
  cats_images = getImgNames(cats);
  not_cats_images = getImgNames(not_cats);
  nrcats = rows(cats_images);
  nrncats = rows(not_cats_images);
  percentage = 0;
  if histogram == "RGB"
    for i = 1 : nrcats
      image_path = strcat(cats, cats_images(i, 1 : 10));
      sol = rgbHistogram(image_path, count_bins);
      %rezolvarea sistemului necesar obtinerii predictiei
      ypred = w' * sol;
      if ypred > 0
        percentage ++;
      endif
    endfor
    for i = 1 : nrncats
      image_path = strcat(not_cats, not_cats_images(i, 1 : 10));
      sol = rgbHistogram(image_path, count_bins);
      ypred = w' * sol;
      if ypred < 0
        percentage ++;
      endif
    endfor
  else if histogram == "HSV"
    for i = 1 : nrcats
      image_path = strcat(cats, cats_images(i, 1 : 10));
      sol = hsvHistogram(image_path, count_bins);
      ypred = w' * sol;
      if ypred > 0
        percentage ++;
      endif
    endfor
    for i = 1 : nrncats
      image_path = strcat(not_cats, not_cats_images(i, 1 : 10));
      sol = hsvHistogram(image_path, count_bins);
      ypred = w' * sol;
      if ypred < 0
        percentage ++;
      endif
    endfor
  endif
  endif
endfunction