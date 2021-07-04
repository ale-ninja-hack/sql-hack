#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from urllib2 import Request, urlopen, URLError, HTTPError, os


os.system("clear")


def Space(j):
	i = 0
	while i<=j:
		print(" "),
		i+=1


def BuscarAdmin():
	f = open("links.txt","r");
	link = raw_input("Escribe la url sin poner http o https al principio \n \nejemplo : ejemplo.com o www.ejemplo.com : ")
	print "\n\nLinks encontrados : \n"
	while True:
		sub_link = f.readline()
		if not sub_link:
			break
		req_link = "http://"+link+"/"+sub_link
		req = Request(req_link)
		try:
			response = urlopen(req)
		except HTTPError as e:
			continue
		except URLError as e:
			continue
		else:
			print "ADMIN ENCONTRADO => ",req_link

def Creditos():
	Space(9); print "#####################################" 
	Space(9); print "#      +++ Admin Buscador v1 +++    #" 
	Space(9); print "#     Script by xyks/ale.tryhard    #" 
	Space(9); print "#         TikTok: ale.tryhard       #" 
	Space(9); print "#####################################" 

Creditos()
BuscarAdmin()
