function plotgap2(Pmin, Pmax, A,n)
  
% A es el vector de los alpha para los que se van a calcular los valores propios
% por ejemplo  A=[0,0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2]  

alpha_fix=2
  
%alpha=3; 
%Pmax = 50; %hasta cual P la grafica
%Pmin=1; % desde cual P

% Para usar esta funcion debe generarse los autovalores
% con eigenvalues_cases(Pmin, Pmax,A)

a=length(A);
l=Pmin:Pmax;

if(n==3)
for i=1:a
  
  alpha=A(i)

 for k=Pmin:Pmax
    fullname=["eigenvalues_n=3_k=" num2str(k) "_alpha=" num2str(alpha) ".mat"];
    load(fullname)
    Gap(k)=-lambda(2);
 end
 
 curva=3^2*(1+l/3).^(alpha_fix);
 
 Q=curva.*Gap;
 
 c(i)=min(1./Q);
 C(i)=max(1./Q);
 
 %plot(1./Q)


 plot(l,1./Gap,'r','LineWidth',8) %plot 1/Gap 
 title(['n=3, \alpha_{fix}=2, \alpha= ', num2str(alpha), ', c=',num2str(c(i)),', C=',num2str(C(i)),])
 xlabel ("number of particles (k)");
 %ylabel ('relaxation time W_\alpha(n, k )');
 grid on
  h=get(gcf, 'currentaxes');
  set(h, 'FontSize', 15, 'LineWidth', 1);
 hold on
 plot(l,c(i)*curva,'b','LineWidth',8, 'Linestyle', ":") %plot curva
 plot(l,C(i)*curva,'g','LineWidth',8, 'Linestyle', ":") %plot curva
 leg = legend ('W_\alpha(n, k )','c n^2 {(1+ k/n)}^{2}','C n^2 {(1+ k/n)}^{2}');
 %legend (leg, "location", "northeastoutside");
 hh=legend (leg, "location", "northwest");
 set(hh,"fontsize", 8)
 hold off

 graph_name=["W_(n,P)_n=3_Pmin=" num2str(Pmin) "_Pmax=" num2str(Pmax) "_alpha=" num2str(alpha) "_\alpha_fix"".jpg"];
 print(graph_name)


end

c_min_vector=["c_min_vector_n=3_Pmin=" num2str(Pmin) "_Pmax=" num2str(Pmax)  ".mat"];
save(c_min_vector,"c")

c_max_vector=["c_max_vector_n=3_Pmin=" num2str(Pmin) "_Pmax=" num2str(Pmax)  ".mat"];
save(c_max_vector,"C")

endif

if(n==4)
for i=1:a
  
  alpha=A(i)

 for k=Pmin:Pmax
    fullname=["eigenvalues_n=4_k=" num2str(k) "_alpha=" num2str(alpha) ".mat"];
    load(fullname)
    Gap(k)=-lambda(2);
 end
 
 curva=3^2*(1+l/3).^(alpha);
 
 Q=curva.*Gap;
 
 c(i)=min(1./Q);
 C(i)=max(1./Q);
 
 %plot(1./Q)


 plot(l,1./Gap,'r','LineWidth',8) %plot 1/Gap 
 title(['n=4, \alpha= ', num2str(alpha), ', c=',num2str(c(i)),', C=',num2str(C(i)),])
 xlabel ("number of particles (k)");
 %ylabel ('relaxation time W_\alpha(n, k )');
 grid on
  h=get(gcf, 'currentaxes');
  set(h, 'FontSize', 15, 'LineWidth', 1);
 hold on
 plot(l,c(i)*curva,'b','LineWidth',8, 'Linestyle', ":") %plot curva
 plot(l,C(i)*curva,'g','LineWidth',8, 'Linestyle', ":") %plot curva
 leg = legend ('W_\alpha(n, k )','c n^2 {(1+ k/n)}^{\alpha}','C n^2 {(1+ k/n)}^{\alpha}');
 %legend (leg, "location", "northeastoutside");
 hh=legend (leg, "location", "northwest");
 set(hh,"fontsize", 8)
 hold off

 graph_name=["W_(n,P)_n=4_Pmin=" num2str(Pmin) "_Pmax=" num2str(Pmax) "_alpha=" num2str(alpha) "_low"".jpg"];
 print(graph_name)


end

c_min_vector=["c_min_vector_n=4_Pmin=" num2str(Pmin) "_Pmax=" num2str(Pmax)  ".mat"];
save(c_min_vector,"c")

c_max_vector=["c_max_vector_n=4_Pmin=" num2str(Pmin) "_Pmax=" num2str(Pmax)  ".mat"];
save(c_max_vector,"C")

endif



