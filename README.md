Código-MATLAB-Miscelanea-Matematica
======================================
Aquí mantenemos un repositorio con el código MATLAB utilizado para generar las figuras del artículo:  

**"Del algoritmo de programación dinámica a los procesos Markovianos de decisión"**.

Los archivos para generar la Figura 2 del Ejemplo 2.2 son:
1. fishery.m
2. fishery_main.m
3. dpm.m

Los archivos mencionados en 1-3 son una versión modificada de los ejemplos presentado en [1].

El archivo fishery.m contiene la función para evaluar el lado derecho de la ecuación diferencial logísitca,
en fishery_main.m  se crean los archivos de datos y las gráficas provicionales, dpm.m implementa una función para el 
algoritmo de programación dinámica mencionada en la referencia. Detalles y mas ejemplos sobre la función dpm en [2].

Para la Figura 3 del Ejemplo 4.1, resolvemos la forma determinista presentada en [3]. 

La carpeta "EjemploLago" contiene 
1. FiguraLago.m
2. BruteForceMax1D.m
3. fob.m

El archivo FiguraLago.m genera los datos de la Figura 3, fob.m contiene la función objetivo a optimizar y en
BruteForceMax1D.m implementamos un método de optimización de búsqueda exhaustiva (fuerza bruta). El archivo 
"FiguraLago.m" resuelve la ecuación de Bellman para el ejemplo citado.
El código está pensado pensado para tener una fácil traducción al lenguaje C.




***[1] O. Sundstrom y L. Guzzella, A generic dynamic programming matlab function, en
Control Applications,(CCA) & Intelligent Control, (ISIC), 2009 IEEE, IEEE, 2009,
1625–1630.***

***[2] http://www.idsc.ethz.ch/research-guzzella-onder/downloads.html***

***[3] W. D. Dechert y S. O’Donnell, «The stochastic lake game: A numerical 
solution», Journal of Economic Dynamics and Control, vol. 30, núm. 9, 
2006, 1569–1587.***
