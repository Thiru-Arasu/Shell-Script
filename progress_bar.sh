#!/bin/bash
_spin=('-' '\' '|' '/')

# Example in sleep command
cat<<'EOF'> yourscript.sh
    #!/bin/bash
    sleep 10
EOF

# The task will be run in the background
/bin/bash yourscript.sh &
PID=`echo $!`
echo "Task has been initiated!!!"
echo -n "Waiting to Complete ${_spin[0]}"
i=1
while [[ true ]]; do
        # Check whether the process is running or not
        if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
            echo -ne  "\b \nCompleted" 
            break
        else
            echo -ne "\b${_spin[i]}"
            sleep 0.01
            i=$((i+1)); [[ "$i" -eq 4 ]] && i=0
        fi
done
