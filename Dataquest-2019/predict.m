function [y] = predict(y)
  for i = 1 : length(y)
    if y(i,1) >= 0.5
      y(i,1) = 1;
    endif
    if y(i,1) < 0.5
      y(i,1) = 0;
    endif
  endfor
endfunction
