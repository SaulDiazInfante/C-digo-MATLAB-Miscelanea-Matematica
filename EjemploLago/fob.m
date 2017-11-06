% Ejemplo, caso determinista, tomado de: 
% W. D. Dechert y S. O’Donnell, «The stochastic lake game: A numerical 
% solution», Journal of Economic Dynamics and Control, vol. 30, núm. 9, 
% 2006, 1569–1587.
%Funcion a optimizar. Con el fin de hacer mas eficiente el codigo se 
%programo la funcion objetivo de tal forma que acepte una matriz con 
%renglones dados por a=xvec, aunque en este caso a (xvec) es de rango uno.

function fval = fob(xvec)
  global VAdat_G;
  global x_G;
  
 fval = fob1(VAdat_G, x_G, xvec);
end

%--------------------------------------------------------------------------
%Funciones auxiliares.
%x es un numero, a es un vector, puede ser bra o ket pero es mejor  
%tener en mente un ket.
function fval = fob1(VA,x,a)
  global beta_G;
  
  global xmin;
  global xmax;
  
  fxa = f(x,a);
  rxa = r(x,a);
  
  big  = 1.e10;

  fval = rxa + beta_G*NewV(VA,fxa);
  
  fval(fxa < xmin | fxa > xmax) = -big;
end

function fval = f(x,a)
  global b_G;
  global q_G;

  fval = b_G*x + x^q_G/(1.0 + x^q_G + 1000*eps) + a;
end

function fval = r(x,a)
  global k_G;
  
  fval = log(a + 1000*eps) - k_G*x*x;
end

%Interpolacion de VA en xq. La primera columna de VA son las x's, la se-
%gunda son los valores de V(x); xq puede ser bra o ket
function fval = NewV(VA,xq)
  x    = VA(:,1);
  v    = VA(:,2);
  big  = 1.e10;
  fval = interp1(x, v, xq);
  xmin = min(x);
  xmax = max(x);
  
  %Penalizacion, se quiere maximizar, en caso de minimizar usar +bib
  fval(xq < xmin | xq > xmax) = -big; 
end
