#!/usr/bin/env python3

import re
import spacy
nlp = spacy.load("fr_core_news_lg")

import sys
from sys import argv

pathToTextf1="/Users/admin/Desktop/resultspeerspeech/utterances/French_processed/" 


targetchildren=["Anae", "Anais", "Theotime"]
speakers=["adult", "mother", "child"]
addressees=["CDS", "OCDS", "ADS"]

for speaker in speakers:
 for addressee in addressees:
  for targetchild in targetchildren:
   if targetchild == "Anae":
     listFrench=["Anae_215.cha", "Anae_2216.cha", "Anae_2428.cha", "Anae_2529.cha", "Anae_2626.cha", "Anae_284.cha", "Anae_2923.cha", "Anae_2123.cha", "Anae_21122.cha", "Anae_317.cha"]
   if targetchild == "Anais":
     listFrench=["Anais_239a.cha", "Anais_247a.cha", "Anais_247b.cha", "Anais_242a.cha", "Anais_242b.cha", "Anais_2511a.cha", "Anais_2511b.cha", "Anais_2523a.cha", "Anais_2525a.cha", "Anais_2621a.cha", "Anais_28a.cha", "Anais_296b.cha"]
   if targetchild == "Theotime":  				
     listFrench=["Theotime_2111a.cha", "Theotime_239b.cha", "Theotime_2324a.cha", "Theotime_2324b.cha", "Theotime_2422a.cha", "Theotime_252a.cha", "Theotime_263a.cha", "Theotime_273a.cha", "Theotime_2112a.cha"]					 
   for session_ in listFrench:
    file1=open("{}cleanutterance{}{}{}{}.csv".format(pathToTextf1, targetchild, speaker, session_, addressee), 'r')
    textall=file1.readlines()
    output_file=open("{}partofspeechutterance{}{}{}{}.csv".format(pathToTextf1, targetchild, speaker, session_, addressee), "w")
    L=[]
    for s in textall:
     s1=""
     doc=nlp(s)
     for token in doc:
      s1+=(str(token)+" ")
      print(token.pos_) 
      if token.pos_=="DET":
    #   if doc[token.i + 1].pos_ == "ADJ" or doc[token.i + 1].pos_ == "NOUN" :
       s1=s1.replace((str(token) + " "), str(token))
     print(s1)
     output=str(s1) 
     output_file.write(output)
    output_file.close()
#    tex=str(token.text)+ " " + str(doc[token.i+1].text)
