#!/bin/bash

# Ensure expect package is installed
if [[ -z `command -v expect` ]]; then
        echo "Expect command is not installed!!!"; exit 1;
fi

# Sample interaction mode script
cat <<'EOF'> /tmp/hello-world
#!/bin/bash
echo "Enter the word: "
read word
echo "Result: $word"
EOF
chmod 755 /tmp/hello-world

# Expect command
cat <<'EOF'> /tmp/expect.sh
expect -c "
set 1 [lindex $argv 0]

# Actual command
spawn /tmp/hello-world
expect \"Enter the word: \"
send \"$1\n\";

expect eof "
EOF

/bin/bash /tmp/expect.sh "Your text" 
rm /tmp/expect.sh /tmp/hello-world
