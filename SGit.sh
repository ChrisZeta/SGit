#!/bin/sh

clear
ESC=0
while [ $ESC = 0 ]; do

echo ""

echo "|================\ "
echo "|  ___  ___ _ _   \ "
echo "| / __|/ __(_) |_  \ "
echo "| \__ \ (_ | |  _|  \ "
echo "| |___/\___|_|\__|   \ "
echo "|=====================\ "
echo "  Git UI from shell"

	echo ""
	echo "[ 1-D] Imposta\cambia directory"
	echo "[ 2-N] Crea un nuovo repository vuoto"
	echo "[ 3-A] Aggiungi file allo stage"
	echo "[ 4-C] Effettua un commit"
	echo "[ 5-R] Rimuovi un file all'interno del progetto"
	echo "[ 6-M] Rinomina o sposta un file all'interno del progetto"
	echo "[ 7-V] Visualizza i branch locali"
	echo "[ 8  ] Crea un nuovo branch"
	echo "[ 9-B] Spostati in in branch"
	echo "[10  ] Elimina un Branch"
	echo "[11  ] Aggiungi un repository remoto"
	echo "[12-F] Scarica gli aggiornamenti su di un branch locale"
	echo "[13-P] Aggiorna il repository remoto"
	echo "[14  ] Aggiorna un branch locale con un branch remoto"
	echo "[ Q-E] Esci da SGit"
	echo ""
	echo -n ":"
	read opt

	case $opt in
	[1dD] ) echo "Inerisci il percorso della directory dalla tua home"
			echo -n ":"
			read p
			p="$HOME/$p"
				if [ "${p:(-1):1}" != "/" ]; then
					p="$p/"
				fi
			clear
			cd "$p"	
			echo "Sono entrato nella directory";;
			
	[2nN] ) clear
			git init
			touch README
			echo "repository creato";;
			
	[3aA] ) echo "Quale file aggiungere allo stage? (* per tutti)"
			echo -n ":"
		    read f
		    clear
		    git add "$f"
		    echo "Stage aggiornato";;
		  
	[4cC] ) echo "Inserisci un messaggio per il commit"
			echo -n ":"
			read msg
			clear
			git commit -m "$msg"
			echo "Commit effettuato";;
			
	[5rR] ) echo "Quale file rimuovere?"
			echo -n ":"
			read r
			clear
			git rm "$r"
			echo "File rimosso";;
			
	[6mM] ) echo "File sorgente"
			echo -n ":"
			read s
			echo "File\cartella destinazione"
			echo -n ":"
			read d
			clear
			git mv "$s" "$d";;
			
	[7vV] ) clear
			echo "Branch locali:"
			git branch;;
			
	8 ) echo "Inserisci il nome del nuovo branch"
		  echo -n ":"
		  read ramo
		  clear
		  git branch "$ramo"
		  echo "Nuovo ramo branch";;
		  
	[9bB] ) echo "Inserisci il branch nel quale spostarti"
			echo -n ":"
			read b
			clear
			git checkout "$b"
			echo "Ti sei spostato nel branch $b";;
			
	10 ) echo "Inserisci il branch da eliminare"
		   echo -n ":"
		   read eb
		   clear
		   git branch -d "$eb"
		   git branch -d -r "$eb" 
		   echo "Branch eliminato";;
		   
	11 ) echo "Inserisci il nome del repo remoto"
	       echo -n ":"
		   read repo
		   echo "Inserisci url"
		   echo -n ":"
		   read url
		   clear
		   git remote add "$repo" "$url"
		   echo "Repository remoto aggiunto";;
		   
	[12fF] ) echo "Inserisci del repository"
		     echo -n ":"
		     read repo
		     clear
		     git fetch "$repo"
		     echo "Aggiornamenti sul repo scaricati";;
		   
	[13pP] ) echo "Inserisci repository remoto"
		   echo -n ":"
		   read remoto
		   echo "Inserisci branch da inviare"
		   echo -n ":"
		   read branch
		   clear
		   git push -u "$remoto" "$branch"
		   echo "Repository aggiornato";;
		   
	14 ) echo "Inserisci repository remoto"
		   echo -n ":"
		   read remoto
		   echo "Inserisci branch remoto"
		   echo -n ":"
		   read branch
		   clear
		   git pull "$remoto" "$branch"
		   echo "Branch locale aggiornato";;
		   
	[qQeE] ) exit;;
		   
		  
	* ) echo "Scelta non valida"
	esac

done
exit
