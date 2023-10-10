cat <<EOF > ~/.ssh/config
host remoteMachine
   HostName $1
   User ubuntu
   identityFile /root/project/Terraform/tfproject.pem
   StrictHostKeyChecking=no
EOF
