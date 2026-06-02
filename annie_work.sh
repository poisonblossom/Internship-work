func_log(){
	#create first log
	cd /var/log
	cat auth.log> log1.log
	
	
	
	sleep 50

	# second function
	cd /var/log
        cat auth.log> log2.log
	
	
	
	
	diff -y log1.log log2.log> analysis.log
	echo "ANALYSIS log"
	cat analysis.log
	sleep 10
	# alert generation 

	dialog --msgbox "ANALYSIS DONE, SUCCESSFUL LOGINS" 7 50 --timeout 5
}

func_log 


# process monitoring 
fun_pro(){
	ps aux> process1.txt
	
	sleep 40
	ps aux> process2.txt
	
	
	diff -y process1.txt process2.txt> compare.txt
	cat compare.txt



}
fun_pro



# network inspection 
grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c
FAILED_COUNT=${FAILED_COUNT:-0}
if [ "$FAILED_COUNT" -gt 0 ]; then
    echo "Failed login detected!"
else
    echo " Everything is okay here."
fi


