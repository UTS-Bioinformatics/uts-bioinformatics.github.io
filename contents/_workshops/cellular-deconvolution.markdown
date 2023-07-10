---
layout: default
title: "Cellular deconvolution"
date: 2023-07-10 00:00:00 +0100
---
# Cellular deconvolution
Cellular deconvolution involves determining the original composition of a samples that have been used for microarray or RNA-Sequencing. It does by using markers genes determined from single cell sequencing. The accuracy of the deconvolution is dependent on the how good the original single cell Sequencing dataset is and in many cases the cell type trying to be determined. In this workshop we will be using deconvolution matrixes made from currently the largest single cell sequencing atlas created by the [HLCA](https://github.com/LungCellAtlas/HLCA), which was recently published in Nature Medicine (PMID: [37291214](https://pubmed.ncbi.nlm.nih.gov/37291214/)).


## Downloading the deconvolution matrixes 
1)	First we will need to download the deconvolution matrixes from the LungCellAtlas paper. You can download it from the manuscript under “Supplementary Table 10” or you can click the following [LINK](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10287567/bin/41591_2023_2327_MOESM6_ESM.zip). You will need to unzip the file and save them somewhere on your desktop. The next steps will depend on which matrix you would like to use and the format of your data.


## Formatting your counts file
2)	We have developed an application that can be used to help format your data correctly for conducting cellular deconvolution or you can organise your data manually. An example of the file can be seen [HERE](/assets/data/2023-07-10-mixture.tsv) (source: [GSE178807](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE178807), by [Ana I Hernández Cordero et al.](https://doi.org/10.1164/rccm.202106-1440OC)). Next open the shiny App.


## CIBERSORTx uploading files
3)	Now you are ready to deconvolute your samples. Go to [CIBERSORTx](https://cibersortx.stanford.edu/) and make a login.

4)	Once logged in on the pulldown menu select Upload Files. We need to upload two files the deconvolution matrix from the HLCA and your expression file. First press the green button “+ add files” and find the deconvolution matrix from the HLCA that you would like to select. Give the file the title “HLCA” and select the File Type “Signature matrix file”.

5)	Next add another file by pressing the green button “+ add files”.  Now find your CPM normalised expression file. Give the file the title “expression” and select the File Type “Mixture”.

6)	Now press the blue “start upload” button next the add file button.  


## Running CIBERSORTx
7)	Go to the menu and select Run CIBERSORTx

8)	For the Select Analysis Module: click “2. Impute Cell Fractions”

9)	For the Select Analysis Mode: click “Custom”

10)	For the Signature matrix file select your file called “HLCA”

11)	For the Mixture file select your file called “expression”

12)	Leave the next three options as default if you are using RNA-Seq data

13)	For Permutations for significance analysis select 100

14)	Finally, press the blue button "Run"


## Analysing the results 
15)	Download the outputfile and upload it to the Shiny App under the deconvolution tab.

16)	Here determine which samples will go in which groups. Select if you would like a paired or unpaired test and the select run.   
