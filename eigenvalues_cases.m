function eigenvalues_cases(Pmin, Pmax,A,n)
  
% A es el vector de los alpha para los que se van a calcular los valores propios
% por ejemplo  A=[0,0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2]  


a=length(A)

if (n==3)
for i=1:a
 for k=Pmin:Pmax
    eigenvalues_n3(k,A(i))
 end
end
endif

if (n==4)
for i=1:a
 for k=Pmin:Pmax
    eigenvalues_n4(k,A(i))
 end
end
endif




  