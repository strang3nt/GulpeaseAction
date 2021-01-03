# Calcolare l'indice di Leggibilita' di un PDF
# aimriccardop & atk23 (aka AnnaP) x TEAM_N0

import textract
import sys
import re

nf = sys.argv[1]
testo = str(textract.process(nf))

parole  = len(re.findall(r'\w+', testo))
lettere = len(re.findall(r'\w', testo)) + len(re.findall(r'\W', testo))
punti = len(re.findall('[.]+\s', testo)) + len(re.findall('[;]+\s', testo)) - len(re.findall('[.]+\s+[.]', testo))

indiceG=89+((300*punti)-(10*lettere))/parole

if parole!=0:
    if indiceG>100:
        indiceG=100

    print(str(int(round(indiceG))))

else:
    print("Errore nel calcolo dell'indice Gulpease")
