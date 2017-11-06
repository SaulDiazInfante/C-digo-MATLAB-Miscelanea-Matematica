close all;
clear all;
clc;

%Archivo con la funcion objetivo y el metodo de optimizacion.
addpath('Funciones')

% Ejemplo, caso determinista, tomado de: 
% W. D. Dechert y S. O’Donnell, «The stochastic lake game: A numerical 
% solution», Journal of Economic Dynamics and Control, vol. 30, núm. 9, 
% 2006, 1569–1587.

%Parametros constantes para el ejemplo mencionado.
global b_G q_G k_G beta_G xmin xmax  NX Niter;
 b_G    = 0.52;
 q_G    = 2;
 k_G    = 0.33;
 beta_G = 0.997;
 xmin   = 0;
 xmax   = 2.5;
 NX     = 500;
 Niter  = 3000;

%Variables globales
global x_G;
global VAdat_G;

%Parametros para la optimizacion
Np   = 5000;
bL   = xmin;
bU   = xmax;

%discretizacion del espacio
xdat = linspace(xmin, xmax, NX);

%Inicializacion aleatoria de V
VAdat_G = rand(NX,2);
VAdat_G(:,1) = xdat;

%Inicializacion de la politica
Adat = zeros(NX,2);
Adat(:,1) = xdat;

Vv = zeros(1,NX);
Av = zeros(1,NX);

%La solucion de la ecuacion de Bellman
tStart = tic;
epsilon=0.00001;
for ii = 1:Niter
  vdataux = VAdat_G(:,2);
  adataux = Adat(:,2);
    
  for jj = 1:NX
    x_G = xdat(jj);
    [mejor, maximo, ~] = BruteForceMax1D(Np, bL, bU, @fob);
    Vv(jj) = maximo;
    Av(jj) = mejor(1);
  end
  
  VAdat_G(:,2) = Vv;
  verror = sum((Vv'-vdataux).^2)/NX;
  Adat(:,2)  = Av;
  aerror = sum((Av'-adataux).^2)/NX;
  
  %Para mostrar el avance. Se puede cambiar el paso en el numero de 
  %iteraciones, a imprimir
  if(mod(ii,30) == 0) 
    fprintf('iter = %d; a_error= %.5f v_error= %.5f \n',ii,aerror,verror);
  end
  
  if(verror <= epsilon)
      break;
  end
  
end
fprintf('iter = %d; a_error= %.5f v_error= %.5f \n',ii,aerror,verror);

%Tiempo de calculo en segundos
tElapsed = toc(tStart);
fprintf('tiempo = %.5f segundos\n',tElapsed);

%Graficando la solucion
plot(Adat(:,1),Adat(:,2),'.')
ylim([0,0.3])

figure;
plot(VAdat_G(:,1),VAdat_G(:,2),'.')

%Guardando los datos
its = num2str(ii);
fn1 = strcat('aDat',its,'.dat');
fn2 = strcat('VvDat',its,'.dat');

save(fn1, 'Adat', '-ascii')
save(fn2, 'VAdat_G', '-ascii')
