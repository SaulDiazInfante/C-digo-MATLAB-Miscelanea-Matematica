% Version matricial para maximizar usando fuerza bruta en una dimension
% [mejor, maximo, tiempo] = BruteForceMax1D(Np, bL, bU, fob)
% Np es el numero de puntos de la discretización del espacio de busqueda
% bL(U) son los limites del espacio de busqueda
% fob es la funcion objetivo, recuerde usar function handle

function [mejor, maximo, tiempo] = BruteForceMax1D(Np, bL, bU, fob)
  tStart = tic;
  X = linspace(bL,bU,Np);
  [mejor, maximo] = best_opM(X', fob);
  tiempo = toc(tStart); 
end

% funcion auxiliar
function [mejor, maximo] = best_opM(X, fob)
	fvals = fob(X);
	[maximo, maxloc] = max(fvals);
	mejor = X(maxloc);
end


