cat <<EOF > ~/.ssh/config
host remoteMachine
   HostName $1
   User ubuntu
   identityFile $HOME/.ssh/key.pem
   StrictHostKeyChecking=no
EOF
