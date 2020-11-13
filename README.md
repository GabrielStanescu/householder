# householder
Predicting a type of image using Supervised Machine Learning

rgbHistogram:
-am vectorizat fiecare matrice data de cele trei culori R G B
-am stabilit intervalele cu linspace
-am stabilit histogramele cu ajutorul functiei predefinite histc

hsvHistogram:
-am vectorizat ca la rgbH fiecare matrice
-V este Cmax
-pentru a calcula S am initializat matricea cu 0 si am cautat in Cmax indicii cu valori nenule. apoi am calculat S folosind formula din cerinta (rgb2hsv)
-pentru a calcula H am initializat matricea cu 0 si am cautat in diferentele dintre Cmax si (R, G si B) valori nule, dupa care am aplicat formulele din cerinta.
-am stabilit intervalele si histogramele asemanator rgbHistogram

preprocess:
-am aflat path-ul fiecarei imagini din setul de date
-am parcurs fiecare imagine din set si am format matricea X care contine vectorul caracteristic (obtinut din apelarea rgbHistogram sau hsvHistogram)
-y ia valoare in functie de tipul de animal (pisica sau altceva)

evaluate:
-am folosit acelasi algoritm ca la preprocess
-diferenta a fost faptul ca am verificat daca ypred este o predictie buna sau nu
