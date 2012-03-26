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
if [ -d ".git" ]; then
        echo "Nella cartella dove sei posizionato ora c'è un repository Git."
	echo "Vuoi utilizzarlo? [s/N]"
	echo -n ":"
        read GITI
        if [ "$GITI" = "s" ]; then
                cd ./
		clear
                echo "Repository Git selezionato!"
        fi
else
        true
fi


ESC=0
while [ $ESC = 0 ]; do

echo ""

echo "|================\ "
echo "|  ___  ___ _ _   \ "
echo "| / __|/ __(_) |_  \ "
echo "| \__ \ (_ | |  _|  \ "
echo "| |___/\___|_|\__|   \ "
echo "|=====================\ "
echo "  Git GUI from shell"

	echo ""
	echo "[ 1-D] Cambia directory del repository Git"
	echo "[ 2  ] Imposta directory del repository Git alla cartella attuale"
	echo "[ 3-N] Crea un nuovo repository vuoto"
	echo "[ 4-A] Aggiungi file allo stage"
	echo "[ 5-C] Effettua un commit"
	echo "[ 6-R] Rimuovi un file all'interno del progetto"
	echo "[ 7-M] Rinomina o sposta un file all'interno del progetto"
	echo "[ 8-V] Visualizza i branch locali"
	echo "[ 9  ] Crea un nuovo branch"
	echo "[10-B] Spostati in in branch"
	echo "[11  ] Elimina un Branch"
	echo "[12  ] Aggiungi un repository remoto"
	echo "[13-F] Scarica gli aggiornamenti su di un branch locale"
	echo "[14-P] Aggiorna il repository remoto"
	echo "[15  ] Aggiorna un branch locale con un branch remoto"
	echo "[16  ] Clona un repository remoto"
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
		echo "Sono entrato nella directory";;
		
	2 )	cd ./
		clear
		echo "Repository Git selezionato nella cartella attuale";;

	[3nN] ) clear
		 git init
		 touch README
		 echo "repository creato";;
			
	[4aA] ) echo "Quale file aggiungere allo stage? (* per tutti)"
		 ls
		 echo -n ":"
	         read f
		 clear
		 git add "$f"
		 echo "Stage aggiornato";;
		  
	[5cC] ) echo "Inserisci un messaggio per il commit"
		 echo -n ":"
		 read msg
		 clear
		 git commit -m "$msg"
		 echo "Commit effettuato";;
			
	[6rR] ) echo "Quale file rimuovere?"
		 ls
		 echo -n ":"
		 read r
		 clear
		 git rm "$r"
		 echo "File rimosso";;
			
	[7mM] ) echo "File sorgente"
		 ls
		 echo -n ":"
		 read s
		 echo "File\cartella destinazione"
		 echo -n ":"
		 read d
		 clear
		 git mv "$s" "$d";;
			
	[8vV] ) clear
		 echo "Branch locali:"
		 git branch;;
			
	9 ) echo "Inserisci il nome del nuovo branch"
	    echo -n ":"
	    read ramo
	    clear
	    git branch "$ramo"
	    echo "Nuovo ramo branch";;
		  
	[10bB] ) echo "Inserisci il branch nel quale spostarti"
		 echo -n ":"
		 read b
		 clear
		 git checkout "$b"
		 echo "Ti sei spostato nel branch $b";;
			
	11 ) echo "Inserisci il branch da eliminare"
              echo -n ":"
	      read eb
	      clear
	      git branch -d "$eb"
	      git branch -d -r "$eb" 
	      echo "Branch eliminato";;
		   
	12 ) echo "Inserisci il nome del repo remoto"
	      echo -n ":"
	      read repo
	      echo "Inserisci url"
	      echo -n ":"
              read url
              clear
	      git remote add "$repo" "$url"
	      echo "Repository remoto aggiunto";;
		   
	[13fF] ) echo "Inserisci repository remoto"
              	  echo -n ":"
	     	  read remoto
                  echo "Inserisci branch remoto"
	          echo -n ":"
                  read branch
		  clear
		  git fetch "$remoto" "$branch"
		  echo "Aggiornamenti sul repo scaricati";;
		   
	[14pP] ) echo "Inserisci repository remoto"
		  echo -n ":"
		  read remoto
		  echo "Inserisci branch da inviare"
		  echo -n ":"
		  read branch
		  clear
		  git push -u "$remoto" "$branch"
		  echo "Repository aggiornato";;
		   
	15 ) clear
	      git reset --hard HEAD
	      git pull
	      echo "Branch locale aggiornato";;

	16 ) echo "Inserisci url del repository"
	      read url
	      clear
	      git clone "$url"
	      echo "Repository clonato";;
		   
	[qQeE] ) exit;;
		   
		  
	* ) clear
	    echo "Scelta non valida"
	esac

done

