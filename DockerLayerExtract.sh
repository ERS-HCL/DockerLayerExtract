#!/bin/bash
# Routine to extract specific layer from Docker FS
tmpDir="/home/roche/test/demo1/tmp"
read -p "Enter term to search for : " fname
read -p "Enter Tar File where Docker Image is archived : " tarFile

newtarFile=$(echo new_${tarFile})

#echo $newtarFile;

echo "Extracting tar file.."

if [ ! -z "$fname" -a "$tarFile" != " " ];
then
	mkdir -p "$tmpDir"
	tar -xvf $tarFile -C $tmpDir
	cd "$tmpDir"
		for a in */layer.tar; 
		do 
		if tar -tf $a | grep -rl "$fname" ${PWD};then
			var=$(grep -rl "$fname" *);
			
		break
		fi
		done
		tar -cvzf $newtarFile *.json repositories $var ;
		cd ..
		cp $tmpDir/$newtarFile .
		rm -rf $tmpDir	
		echo "Extraction completed..." $newtarFile
fi
