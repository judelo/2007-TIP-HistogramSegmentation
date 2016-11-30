function g = pool_adjacent_violators(h,inc)
% Compute the isotonic regression of an histogram h.
% inc = boolean value saying if we want the non-decreasing (inc = 1) or
% decreasing regression
    
%   Copyright (c) 2016 Julie Delon


if (inc ==0)
    g = h; 
    for i =1:length(h)
      som  = g(i);
	for j = i-1:-1:1
	  if(j==1 || (g(j)*(i-j) >=som))
	    som=som/(i-j);
	      for k=j+1:i 
              g(k)=som;
	      
          end
          break;
	  
      end
    som =som+ g(j);   
    end
    end
end

if (inc ==1)
   g = h; 
    for i =length(h)-1:-1:1
      som  = g(i);
	for j = i+1:length(h)
	  if(j==length(h) || (g(j)*(j-i) >=som))
	    som=som/(j-i);
	      for k=i:j-1 
              g(k)=som;
	      
          end
          break;
      end
	  som=som+ g(j);     
    end
    end
end
    
end


