function eigenvalues_n3(P,alpha)

%P; %Numero de particulas
%alpha 

%Lista de vertices
List=[];
for  i1=0:P
  for i2=0:P
    for i3=0:P
      if (i1+i2+i3==P)
        List=[List;[i1,i2,i3]];    
      end
    end
  end
end

%Matrix G fuera de diagonal
N=length(List);
G=sparse(N,N);
for i=1:N
  for j=1:N
    vi=List(i,:);
    vj=List(j,:);
    d=vi-vj;
    maxd=max(d);
    mind=min(d);
    sumd=sum(abs(d));
    if( maxd==1 && mind==-1 && sumd==2)
      n1=find(d==1);
      n2=find(d==-1);
      n3=abs(n1-n2);
      % si son n sitios colocar abajo n-1 en vez de 2
      if( n3==1 || n3==2)
      G(i,j)=rate(vi(n1),alpha);
      G(j,i)=rate(vj(n2),alpha);
      end
    end
  end
end

d2=-sum(G,2);

for i=1:N
G(i,i)=d2(i);
end

lambda=real(eig(G));
[lambda,Ilambda]=sort(lambda,'descend');

fullname=["eigenvalues_n=3_k=" num2str(P) "_alpha=" num2str(alpha) ".mat"];


save(fullname,"lambda")


