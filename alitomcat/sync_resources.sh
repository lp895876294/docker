#!/bin/bash

# if app_profile is empty , do nothing 
if [ -z "$app_profile" ] ; then

	echo "env app_profile can not be empty ." >> sync.log 

elif [ "$START_SYNC" != "1" ] ; then
	
	echo "sync is not needed ."  >> sync.log

else 
    echo "app_profile = $app_profile" >> sync.log
    

	# unzip ROOT.war to temp folder
	unzip -o -d $TOMCAT_HOME/temp "$TOMCAT_HOME/webapps/ROOT.war"
	
	# set sync root folder
	syncROOT="$TOMCAT_HOME/temp" 

    for (( j=0 ; j<=20 ; j++ )) ;
    do
		#sync directory
		syncdir="LOCAL_SYNC_DIR"

		# gt 0 , add postfix
		if [ $j -gt 0 ]; then
			syncdir="LOCAL_SYNC_DIR_$j" 
		fi
		
		#get value from env
		eval syncdir=\$$syncdir ;

		#if syncdir is empty or not exist , do nothing
		if [ -z "$syncdir" ] || [ ! -e "$syncROOT/$syncdir"  ] ; then
			continue ;
		fi

		#sync dir
		syncdir="$syncROOT/$syncdir" ;

        echo "local sync dir $j : $syncdir "  >> sync.log

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
				echo "host dir $i is emtpy"  >> sync.log
                continue
            fi

            echo "begin sync \"$syncdir\" to $hostdir with password \"$hostpwd\""  >> sync.log
        
            #use scp command to copy or override files
            sshpass -p $hostpwd scp -r -o StrictHostKeyChecking=no $syncdir $hostdir  

        done

	done
fi

echo "==================sync complete=================="  >> sync.log

read -p "press 'enter' to continue ~"  
