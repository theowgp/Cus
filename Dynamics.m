classdef Dynamics
       
    properties
        N;
        d;
        
       alpha;
       beta;
       
       delta;
       
    
    end
    
    
    
    
    
    
    methods
        
        function obj = Dynamics(N, d, alpha, beta, delta)
            obj.N = N;
            obj.d = d;
            obj.alpha = alpha;
            obj.beta = beta;
            obj.delta = delta;
            
        end
        

        
        
        
        function res = fx(obj, x, v)
            res = v;
        end
        
        
        
        
        function res = fv(obj, x, v)
            res = zeros(obj.N, obj.d);

            for i=1:obj.N
                for j=1:obj.N
                    res(i, :) = res(i, :)+  obj.a(norm(x(i, :) - x(j, :))) * (v(j, :) - v(i, :));
                end
                res(i, :) = res(i, :) / obj.N;
            end
            
        end
        
        
        
        function res = f(obj, x, v)
            res = [obj.fx(x, v); obj.fv(x, v)];
        end

        
        
    
        function res = a(obj, r)
            res = 1 / (1+r^2)^obj.delta;
        end
    
        
    
    end 
    
    
    methods(Static)
    end
    
end

