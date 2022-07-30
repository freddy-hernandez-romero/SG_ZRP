function g=rate(k,alpha)
  
% k un entero no negativo
% gamma entre 0 y 2

if (alpha==1) 
  g= log(k+1);
else
  g = ((k+1)^(1-alpha) -1)/(1-alpha);
endif
  