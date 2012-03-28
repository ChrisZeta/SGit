#!/bin/sh

#SGit 
#    Copyright (C) 2012 Chris_Zeta - thewebcha[@]gmail.com
#    Contributor: gianguido - gianguidorama[@]gmail.com
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
#

#
# Directory check: se esiste un repository git nella cartella dove si è posizionati, lo script avvertirà l'utente e
# chiederà se posizionarvici.
#

clear
esc=0
while [ $esc = 0 ]; do
if [ -d ".git" ]
then
    echo "Nella cartella corrente c'è un repository Git."
	echo "Directory impostata!"
	break
else
	echo "Nella cartella corrente non c'è un repository Git." 
	echo "Vuoi crearne uno adesso [s/N]?"
	echo -n ":"
	read c
			if [ $c = "s" ]
			then
				
				while [ $esc = 0 ]; do
					echo "Vuoi crearne uno (N)uovo o effettuare un (C)lone?"
					echo -n ":"
					read u
					case $u in
					"n" | "N" )	clear
								git init
								touch README
								echo "repository creato"
								break;;
					"c" | "C" ) echo "Inserisci url del repository"
								echo -n ":"
								read url
								echo "Inserisci il nome del repository"
								echo -n ":"
								read name
								clear
								git clone "$url"
								echo "Repository clonato"
								cd $name
								break;;
					* ) 		clear
								echo "Scelta non valida";;
					esac
					done
			else
	echo "Inserisci il percorso del tuo repository Git"
	echo -n ":"
	read p
	clear
	cd $p
	echo "Sono entrato in $p!";
	fi
fi
done



while [ $esc = 0 ]; do

echo ""

echo "|================\ "
echo "|  ___  ___ _ _   \ "
echo "| / __|/ __(_) |_  \ "
echo "| \__ \ (_ | |  _|  \ "
echo "| |___/\___|_|\__|   \ "
echo "|=====================\ "
echo "  Git GUI from shell"
echo "  Version 0.51 [Alpha]"

	echo ""
	echo "[ 1-D] Cambia directory del repository Git"
	echo "[ 2-A] Aggiungi file allo stage"
	echo "[ 3-C] Effettua un commit"
	echo "[ 4-R] Rimuovi un file all'interno del progetto"
	echo "[ 5-M] Rinomina o sposta un file all'interno del progetto"
	echo "[ 6-V] Visualizza i branch locali"
	echo "[ 7  ] Crea un nuovo branch"
	echo "[ 8-B] Spostati in in branch"
	echo "[ 9  ] Elimina un Branch"
	echo "[10  ] Aggiungi un repository remoto"
	echo "[11-F] Scarica gli aggiornamenti su di un branch locale"
	echo "[12-P] Aggiorna il repository remoto"
	echo "[13  ] Aggiorna un branch locale con un branch remoto"
	echo "[14  ] Git reset --hard HEAD & pull "
	echo "[15  ] Clona un repository remoto"
	echo "[ Q-E] Esci da SGit"
	echo ""
	echo -n ":"
	read opt

	case $opt in
	
	[1dD] ) echo "Inserisci il percorso del tuo repository Git"
		echo -n ":"
		read p
		clear
		cd $p
		if [ -d ".git" ]
		then
			echo "Nella cartella corrente c'è un repository Git."
			echo "Directory impostata!"
		break
		else
			echo "Nella cartella corrente non c'è un repository Git."      
			echo "Inserisci il percorso del tuo repository Git"
			echo -n ":"
			read p
			clear
			cd $p
			echo "Sono entrato in $p!";
		fi;;
		
	[2aA] ) echo "Quale file aggiungere allo stage? (* per tutti)"
		 ls
		 echo -n ":"
	         read f
		 clear
		 git add "$f"
		 echo "Stage aggiornato";;
		  
	[3cC] ) echo "Inserisci un messaggio per il commit"
		 echo -n ":"
		 read msg
		 clear
		 git commit -m "$msg"
		 echo "Commit effettuato";;
			
	[4rR] ) echo "Quale file rimuovere?"
		 ls
		 echo -n ":"
		 read r
		 clear
		 git rm "$r"
		 echo "File rimosso";;
			
	[5mM] ) echo "File sorgente"
		 ls
		 echo -n ":"
		 read s
		 echo "File\cartella destinazione"
		 echo -n ":"
		 read d
		 clear
		 git mv "$s" "$d";;
			
	[6vV] ) clear
		 echo "Branch locali:"
		 git branch;;
			
	7 ) echo "Inserisci il nome del nuovo branch"
	    echo -n ":"
	    read ramo
	    clear
	    git branch "$ramo"
	    echo "Nuovo ramo branch";;
		  
	[8bB] ) echo "Inserisci il branch nel quale spostarti"
		 echo -n ":"
		 read b
		 clear
		 git checkout "$b"
		 echo "Ti sei spostato nel branch $b";;
			
	9 ) echo "Inserisci il branch da eliminare"
              echo -n ":"
	      read eb
	      clear
	      git branch -d "$eb"
	      git branch -d -r "$eb" 
	      echo "Branch eliminato";;
		   
	10 ) echo "Inserisci il nome del repo remoto"
	      echo -n ":"
	      read repo
	      echo "Inserisci url"
	      echo -n ":"
              read url
              clear
	      git remote add "$repo" "$url"
	      echo "Repository remoto aggiunto";;
		   
	11 | "f" | "F" ) echo "Inserisci repository remoto"
              	  echo -n ":"
	     	  read remoto
                  echo "Inserisci branch remoto"
	          echo -n ":"
                  read branch
		  clear
		  git fetch "$remoto" "$branch"
		  echo "Aggiornamenti sul repo scaricati";;
		   
	12 | "p" | "P" ) echo "Inserisci repository remoto"
		  echo -n ":"
		  read remoto
		  echo "Inserisci branch da inviare"
		  echo -n ":"
		  read branch
		  clear
		  git push -u "$remoto" "$branch"
		  echo "Repository aggiornato";;
		
	13 ) clear
	      git pull
	      echo "Branch locale aggiornato";;
		   
	14 ) clear
	      git reset --hard HEAD
	      git pull
	      echo "Branch locale aggiornato";;

	15 ) echo "Inserisci url del repository"
		 read url
		 echo "Inserisci il nome del repository"
		 echo -n ":"
		 read name
		 clear
		 git clone "$url"
		 echo "Repository clonato"
		 cd $name;;
		   
	[qQeE] ) clear
		  exit;;
		   
		  
	* ) clear
	    echo "Scelta non valida"
	esac

done

