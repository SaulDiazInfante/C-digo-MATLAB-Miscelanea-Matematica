Código-MATLAB-Miscelanea-Matematica
======================================
Aquí mantenemos un repostiorio con el código MATLAB utilizado para generar las figuras 
del artículo 
**"Del algoritmo de programación dinámica a los procesos Markovianos de decisión"**.
Los archivos para generar la figura del problema de pesca son:
1. fishery.m
2. fishery_main.m
3. dpm.m

Los archivos mencionados en 1-3 son una versión modificada de los ejemplos presentado en
***O. Sundstrom y L. Guzzella, A generic dynamic programming matlab function, en
Control Applications,(CCA) & Intelligent Control, (ISIC), 2009 IEEE, IEEE, 2009,
1625–1630.***
fishery.m contiene la fución para evaluar el lado derecho de la ecuación diferencial logísitca,
en fishery_main.m  se crean los archivos de datos y las graficas provicionales, dpm.m implementa una función para el 
algoritmo de programación dinámica mencionada en la referencia. Detalles y mas ejemplos sobre la funcón dpm en 
http://www.idsc.ethz.ch/research-guzzella-onder/downloads.html
