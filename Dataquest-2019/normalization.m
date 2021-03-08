function [X] = normalization(X)
  
  for i = 1 : 14
    max = X(1,i);
    min = X(1,i);
    avg = 0;
    for j = 1 : length(X)
      if X(j,i) > max 
        max = X(j,i);
      endif
      if X(j,i) < min 
        min = X(j,i);
      endif
      avg = avg + X(j,i);
    endfor
    avg = avg/length(X);
    for j = 1 : length(X)
      if max - min != 0
      X(j,i) = ( X(j,i) - avg )/ (max - min);
      endif
    endfor
  endfor
endfunction
