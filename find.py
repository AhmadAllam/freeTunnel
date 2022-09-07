# -*- coding=utf-8 -*-
#qpy:console
from __future__ import print_function
import urllib2, socket, os, glob

def IpTara():
    site= raw_input("Enter the site now :")
    try:
            qw= str(socket.gethostbyname(site))
            print(site+"'ip address of:  "+qw)
    except Exception:
            print(site+"'IP address not found.")
            quit()

    sira= qw.rfind(".")
    ucnokta= qw[:sira+1]
    dosya="host.txt"
    k2= open(dosya, "w")
    for i in range(256):
                    a= str(i)
                    try:
                            print(socket.gethostbyaddr(ucnokta+a)[0])
                            ip= str(socket.gethostbyaddr(ucnokta+a)[2])
                            uznlk= len(ip)
                            ip= ip[2:uznlk-2]
                            print(socket.gethostbyaddr(ucnokta+a)[0]+" ", end="\n", file=k2)
                    except Exception:
                            print(ucnokta+a+" does not have a host.")
    k2.close()

secim= IpTara()
