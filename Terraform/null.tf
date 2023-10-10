resource "null_resource" "runtime" {
  triggers = {
    always_run = "${timestamp()}"
  }
  
   provisioner "local-exec" {
    command = "chmod +x ../Scripts/inventory.sh"
  }

   provisioner "local-exec" {
    command = "../Scripts/inventory.sh remoteMachine"
  }

   provisioner "local-exec" {
    command = "chmod +x ../Scripts/config.sh"
  }

  provisioner "local-exec" {
    command = "../Scripts/config.sh ${aws_instance.tf-ec2.public_ip}"
  }

  # provisioner "local-exec" {
  #   command = <<EOF
  #       ansible-playbook -i ../Ansible/inventory ../Ansible/config-EC2.yml
  #   EOF
  # }
  # provisioner "local-exec" {
  #     command = <<EOF
  #       chmod u+x ../scripts/nginx.sh
  #       chmod u+x ../scripts/nginx-play.sh
  #       ../scripts/nginx-play.sh ${aws_instance.tf-ec2.public_ip} 
  #     EOF
  #   }
}


    # ../Scripts/inventory.sh remoteMachine
