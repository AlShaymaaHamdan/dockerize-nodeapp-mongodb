cat <<EOF > ~/.ssh/config
host remoteMachine
   HostName $1
   User ubuntu
   identityFile ../Terraform/tfproject.pem
   StrictHostKeyChecking=no
EOF