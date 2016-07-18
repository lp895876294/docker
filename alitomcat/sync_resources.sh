#!/bin/bash

# if app_profile is empty , do nothing 
if [ -z "$app_profile" ] ; then

	echo "env app_profile can not be empty ."

elif [ "$START_SYNC" != "1" ] ; then
	
	echo "sync is not needed ."

else 
    echo "app_profile = $app_profile"
    
    #get local sync directory
    if [ -z "$LOCAL_SYNC_DIR" ]; then
        
        syncdir="$TOMCAT_HOME/webapps/ROOT/resources"
    
    else

        syncdir="$LOCAL_SYNC_DIR"
   
    fi
    
    if [ -e "$syncdir" ] ; then
        echo "local sync dir : $syncdir "

        #begin sync files
        for (( i=0 ; i<=20 ; i++ )) ;
        do
            #get value from env
            hostpwd="`echo $app_profile | tr [a-z] [A-Z]`_HOST_PWD"
            
            # 0 has no postfix
            if [ $i -gt 0 ]; then
                hostpwd="${hostpwd}_$i"
            fi

            # get variable from env
            eval hostpwd=\$$hostpwd

            hostdir="`echo $app_profile | tr [a-z] [A-Z]`_HOST_DIR"
            
            # 0 has no postfix
            if [ $i -gt 0 ]; then
                hostdir="${hostdir}_$i"
            fi

            # get variable from env
            eval hostdir=\$$hostdir
        
            #if host password or host directory is empty , do nothing 
            if [ -z "$hostpwd" ] || [ -z "$hostdir" ] ; then
		echo "$i is emtpy"
                continue
            fi

            echo "begin sync to $hostdir with password \"$hostpwd\""
        
            #use scp command to copy or override files
            sshpass -p $hostpwd scp -r -o StrictHostKeyChecking=no $syncdir $hostdir  

        done

    else

        echo "local dir \"$syncdir\" is not exist"
    
    fi

fi

read -p "press 'enter' to continue ~"
