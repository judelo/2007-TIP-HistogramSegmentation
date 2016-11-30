function max_entrop = max_entropy(h,a,b,e,inc)

% Compute the maximum entropy of the histogram h(a:b) for the increasing or decreasing hypothesis 
% inc = boolean value indicating if we test the increasing or
% decreasing hypothesis
% h = histogram
% e = parameter used to compute the entropy

% See 

%   Copyright (c) 2016 Julie Delon


g=h(a:b);
decreas=pool_adjacent_violators(g,inc);
L=length(g);

% integrate signals
g       = cumsum(g);
decreas = cumsum(decreas);
  
% meaningfullness threshold
N = g(L);
seuil=(log(L*(L+1)/(2))+e*log(10))/N; 

% search the most meaningfull segment (gap or mode)
max_entrop=0.;
for i=1:L
    for j = i:L
      if (i==1) 
          r=g(j);
      else
          r = g(j) - g(i-1);
      end
	  r=r/N;
	  if (i==1) 
          p = decreas(j);
      else
          p = decreas(j) - decreas(i-1);
      end
	  p=p/N;
      
	  v=entrop(r,p); 
      
	if(v>max_entrop) 
        max_entrop=v; 
    end
    
    end 
end

max_entrop=(max_entrop-seuil)*N;

  
function v = entrop(x,y)
% function computing the entropy between x and y. x and y must be in the interval [0,1]

if (x==0.) v=-log10(1-y);
elseif (x==1.0) v = -log10(y);
else v= (x*log10(x/y)+(1.0-x)*log10((1.0-x)/(1.0-y)));
end    
    
    

