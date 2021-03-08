function [acc] = accuracy(theta, X, y)
  count = 0;
  ynew = zeros(length(y),1);
  for i = 1 : length(y)
    h = X(i,:)*theta;
    ynew(i,1) = sigmoid(h);
  endfor
  y = predict(y);
  ynew = predict(ynew);
  for i = 1 : length(y)
    if (ynew(i,1) - y(i,1)) == 0
      count = count + 1;
    endif
  endfor
  acc = count / length(y);
endfunction
