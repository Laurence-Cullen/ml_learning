function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

theta

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    computeCost(X, y, theta)
    
    temp_theta = theta;
    
    predictions = X * theta;
    
    for j = 1:length(theta)
        differential_cost = 0;

        for i = 1:m
            differential_cost = differential_cost + (predictions(i) - y(i)) * X(i,j);
        end
        
        temp_theta(j) = theta(j) - (alpha / m) * differential_cost;
    end
    
    theta = temp_theta;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
