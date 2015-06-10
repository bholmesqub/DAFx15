function [xOut,varargout] = numericalsolver(func, funcd, x0, iMethod, varargin)
% NUMERICALSOLVER   Find the root of a nonlinear function
%   root = numericalsolver(FUNCTION, DERIVATIVE, x0, METHOD) finds the root
%   of the FUNCTION supplied by it's handle.
%
%   The solver requires the analytical DERIVATIVE to find the root.
%
%   x0 represents the initial iterate from which to start the solver.
%
%   METHOD selects the specific method to apply, out of:
%
%           - Newton's method
%           - Damped Newton's method
%           - Chord method
%           - Capped Step applied to Newton's method
%
%   Filetype:   Function
%   Author:     Ben Holmes
%   Date:       21/05/2015

%% Set default values

tol  = 10e-12;  % Exit tolerance
nmax = 200;     % Maximum Iterations

%% Method Parsing

% Enumerated methods
methods = struct(...
    'NEWTON',       1,...
    'DAMPEDNEWTON', 2,...
    'CHORD',        3,...
    'CAPPED',       4 ...
    );

% Parse method
switch(iMethod)
    case 'newton'
        method = methods.NEWTON;
    case 'damped newton'
        method = methods.DAMPEDNEWTON;
    case 'chord'
        method = methods.CHORD;
    case 'capped step'
        method = methods.CAPPED;
    otherwise
        error('Unrecognised method: %s', iMethod);
end

%% Varargin Parsing

% Varargin contents:
%   tolerance               (tol)
%   maximum iterations      (nmax)
%   step size limitation    (sLim)

% Check to see if each parameter has a corresponding value
if mod(size(varargin),2)
    error('Mismatched input arguments');
end

% Initialise step limit as negative for error checking.
sLim = -1;

varIndex = 1;   % Index to varargin array.

% Loop through pairs of arguments.
while varIndex<length(varargin)
    switch(varargin{varIndex})
        case 'tolerance'
            tol = varargin{varIndex+1};
        case 'iterations'
            nmax = varargin{varIndex+1};
        case 'step limit'
            sLim = varargin{varIndex+1};
        otherwise
            error('Unrecognised parameter');
    end
    varIndex = varIndex+2;
end

%% Varargout Check

% Maximum of 5 output arguments.
if nargout>5
    error('Too many output arguements supplied.');
end

%% Check if step limiting is required and supplied

if method == methods.CAPPED
    if sLim < 0
        error('Capped Step selected, but no limit supplied');
    end
end

%% Initialise Variables

% Array lengths are set to maximum necessary.
n       = length(x0);       % Number of dimensions.
x       = zeros(n,nmax);    % Vector of current iterate.
res     = zeros(n,nmax);    % Vector of residual.
subIter = zeros(1,nmax);    % Array storing sub iterations.

it       = 1;               % Set the iteration count to 1.
x(:,1)   = x0;              % Set the initial iterate.
res(:,1) = func(x(:,1));    % Find the initial residual.

%% Methods
switch method
    case methods.NEWTON,
        %% Newtons Method
        % Find difference first to see if iterations are needed.
        dif = funcd(x(:,it))\func(x(:,it));
        
        % While the difference between two samples is higher than the
        % tolerance, and the iterations are less than the limit.
        while norm(dif)>tol && it<(nmax)
            % Go to next step
            it = it + 1;
            
            % Set x(n+1)
            x(:,it) = x(:,it-1) - dif;
            
            % Set residual(n+1)
            res(:,it) = func(x(:,it));
            
            % Calculate new difference (J^-1)*F
            dif = funcd(x(:,it))\res(:,it);
        end
        
    case methods.DAMPEDNEWTON,
        %% Damped Newtons
        % Find difference first to see if iterations are needed
        dif = funcd(x(:,it))\func(x(:,it));
        
        % While the difference between two samples is higher than the
        % tolerance, and the iterations are less than the limit
        while norm(dif)>tol && it<(nmax)
            % Go to next step
            it = it + 1;
            
            % Set x(n+1)
            x(:,it) = x(:,it-1) - dif;
            
            % Set error(n+1)
            res(:,it) = func(x(:,it));
            
            % Reset damping factor
            dampening = 1;
            
            % Reset number of sub-iterations
            dampCount = 0;
            
            % While the new residual (error) is worse than the last:
            while ((res(:,it).')*res(:,it) > (res(:,it-1).')*res(:,it-1))...
                    && dampCount < 3
                
                % Half the step size
                dampening = dampening*0.5;
                
                % Increment number of sub-iterations
                dampCount = dampCount + 1;
                
                % Recalculate the new x value
                x(:,it) = x(:,it-1) - dampening.*dif;
                
                % Recalculate the error
                res(:,it) = func(x(:,it));
            end
            subIter(it-1) = dampCount;
            
            % Calculate new difference (J^-1)*F
            dif = funcd(x(:,it))\res(:,it);
        end
        
    case methods.CHORD,
        %% Chord
        % Calculate the jacobian only once
        jac = funcd(x(:,1));
        
        % Calculate new difference (J^-1)*F
        dif = jac\func(x(:,it));
        
        % While the difference between two samples is higher than the
        % tolerance, and the iterations are less than the limit:
        while norm(dif)>tol && it<(nmax)
            % Go to next step
            it = it + 1;
            
            % Set x(n+1)
            x(:,it) = x(:,it-1) - dif;
            
            % Set error(n+1)
            res(:,it) = func(x(:,it));
            
            % Calculate new difference (J^-1)*F
            dif = jac\res(:,it);
        end
        
    case (methods.CAPPED)
        %% Newton's with Capped Step
        % Find difference first to see if iterations are needed.
        dif = funcd(x(:,it))\func(x(:,it));
        
        % Using MATLAB's term-based to adjust each step accordingly.
        dif = (abs(dif) >= sLim) .* sign(dif) .* sLim +...
            (abs(dif) <  sLim) .* dif;
        
        % While the difference between two samples is higher than the
        % tolerance, and the iterations are less than the limit.
        while norm(dif)>tol && it<(nmax)
            % Go to next step
            it = it + 1;
            
            % Set x(n+1)
            x(:,it) = x(:,it-1) - dif;
            
            % Set error(n+1)
            res(:,it) = func(x(:,it));
            
            % Calculate new difference (J^-1)*F
            dif = funcd(x(:,it))\res(:,it);
            
            % Using MATLAB's term-based to adjust each step accordingly.
            dif = (abs(dif) >= sLim) .* sign(dif) .* sLim +...
                (abs(dif) <  sLim) .* dif;
        end
        
end

%% Outputs

% Set last value of x to be the output.
xOut = x(:,it);

% If there are 2 outputs, output iterations.
if nargout>1
    varargout{1} = it-1;
end

% If there are 3 outputs, output subiterations.
if nargout>2
    varargout{2} = subIter;
end

% If there are 4 outputs, output residuals.
if nargout>3
    varargout{3} = res;
end

% If there are 5 outputs, output all x vals.
if nargout>4
    varargout{4} = x;
end

end
