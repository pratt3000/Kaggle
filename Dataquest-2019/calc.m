function [y] = calc(xtest, theta)
  
  y = xtest * theta;
  y = predict(y);
  
endfunction
