function [J, grad] = costFunction(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
  m = length(y); % number of training examples

% You need to return the following variables correctly 
  J = 0;
  grad = zeros(size(theta));
  z = X*theta;
  h = sigmoid(z);
  
  
  thetaReg = theta;
  thetaReg(1,:) = [];
  X_new = X;
  X_new(:,1) = [];
  
  reg = (lambda./(2*m))*(thetaReg' * thetaReg);
  J = (1./m * ( (-1) * ((y' * log(h)) + ((1-y)' * log(1-h))))) + reg; 
  # separate and join
  grad =  (((1/m) * (X_new'  * (h - y))) + (lambda/m)*thetaReg) ;
  grad = [(1/m)*((X(:,1))'*(h-y));grad];
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



%options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
%[theta, J, exit_flag] =fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Plot Boundary


% =============================================================

end
