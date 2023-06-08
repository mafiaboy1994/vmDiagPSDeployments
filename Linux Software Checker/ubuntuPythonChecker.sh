#!/bin/bash

listSoftware=$(apt list --installed )
#echo  $listSoftware

if [[ "$listSoftware" == *"python"* ]];then
        pythonCheck=1
        #echo "python software found"
else
        pythonCheck=2
        #echo "python software not found"
fi

echo $pythonCheck