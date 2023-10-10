cat <<EOF > ~/.ssh/config
host remoteMachine
   HostName $1
   User ubuntu
   identityFile $HOME/.ssh/tfproject.pem
   StrictHostKeyChecking=no
EOF
