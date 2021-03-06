function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

reg_cost = 0;
reg_grad = grad;

for j = 2:length(theta)
    reg_cost = reg_cost + (lambda / (2  * m)) * theta(j) ^ 2;
    reg_grad(j) = (lambda / m) * theta(j);
end


for i = 1:m
    % accumulate cost
    J = J + (- y(i) * log(sigmoid(theta' * X(i, :)')) - (1 - y(i)) *...
        log(1 - sigmoid(theta' * X(i, :)'))) / m;
    
    % accumulate gradient
    grad = grad + (sigmoid(theta' * X(i, :)') - y(i)) * X(i, :)' / m;
end

J = J + reg_cost;
grad = grad + reg_grad;

% =============================================================

end
