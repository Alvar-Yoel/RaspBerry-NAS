#!/bin/bash

#
#Colores
#
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#
#Dice Saliendo...
#
function goodbye() {
    # say goodbye
    echo -e "\n\n${purpleColour}[+]${endColour} Saliendo...\n"
}

#
#Cuando das control+C sale del programa
#
trap "goodbye" EXIT

#
#Variables
#
primer="Primer Paso"
segundo="Segundo Paso"

#
#Pregunta al usuario si quiere realizar el primer paso, segundo paso o Salir
#
clear
echo -e "Que quiere realizar ${greenColour}Primer Paso${endColour} el ${turquoiseColour}Segundo Paso${endColour} o ${redColour}Salir${endColour}"
select yn in $primer $segundo "Salir"; do
	case $yn in

#
#Primer paso
#
       $primer )
		clear
        echo -e "Acabas de elegir el ${yellowColour}Primer Paso${endColour}"
		sleep 2
		clear

#
#Actualizar sistema
#
echo -e "${turquoiseColour}[${endColour}${greenColour}+${endColour}${turquoiseColour}]${endColour} Actualizando sistema...\n"
sudo apt update && sudo apt -y upgrade
echo -e "\n${turquoiseColour}[${endColour}${greenColour}+${endColour}${turquoiseColour}]${endColour} Sistema actualizado correctamente\n"
sudo rm -f /etc/systemd/network/99-default.link

#
#Instalando OpenMediaVault
#
echo -e "${turquoiseColour}[${endColour}${greenColour}+${endColour}${turquoiseColour}]${endColour} Esto tardara aprox 30 min en instalarse cuando acabe reniciara el sistema\n"
wget -O – https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
echo -e "${turquoiseColour}[${endColour}${redColour}-${endColour}${turquoiseColour}]${endColour} Reiniciando sistema...\n"
reboot

#
#Cierra el Primer Paso
#
else
      echo -e "\n${redColour}[+]${endColour} Cerrando Script"
      exit 1
   fi
   break
;;

#
#Abre el segundo paso
#
		$segundo )
		clear
		echo -e "${greenColour}[+]${endColour} Acabas de elegir ${turquoiseColour}Segundo Paso{endColour}\n"
		sleep 2
		clear

#
#
#


#
#Cierra la primera pregunta
#
   Salir )
                echo -e "\n${redColour}[-]${endColour} Cerrando Script..."
            exit 1;;
        esac
     done
;;
