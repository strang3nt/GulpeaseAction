#!/bin/bash
cd /github/workspace
mkdir Gulpease
cd Gulpease
wget studio-di-fattibilita.pdf https://github.com/CodeOfDutyJS/documentazione/releases/download/wip%2Fstudio-di-fattibilita/studio-di-fattibilita.pdf 
wget norme-di-progetto.pdf https://github.com/CodeOfDutyJS/documentazione/releases/download/wip%2Fnorme-di-progetto/norme-di-progetto.pdf
wget analisi-dei-requisiti.pdf https://github.com/CodeOfDutyJS/documentazione/releases/download/wip%2Fanalisi-dei-requisiti/analisi-dei-requisiti.pdf
wget piano-di-qualifica.pdf https://github.com/CodeOfDutyJS/documentazione/releases/download/wip%2Fpiano-di-qualifica/piano-di-qualifica.pdf
wget piano-di-progetto.pdf https://github.com/CodeOfDutyJS/documentazione/releases/download/wip%2Fpiano-di-progetto/piano-di-progetto.pdf
ls *.pdf > Gulpease/pdfList.txt
while IFS= read -r document || [ -n "$document" ]
do
    pdftotext $document
    python ../gulpease.py ${document%.*}.txt > Gulpease/${document%.*}-eval.txt
    cat Gulpease/${document%.*}-eval.txt
    sed -e 's/<!-- GULP_'"${document%.*}"' -->.*<!-- end -->/<!-- GULP_'"${document%.*}"' -->'"$(cat Gulpease/${document%.*}-eval.txt)"' al '"$(date +'%Y-%m-%d')"'<!-- end -->/' -i ../README.md
done < "pdfList.txt"
tree .
cd ..
rm -r Gulpease
