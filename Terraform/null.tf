resource "null_resource" "runtime" {
  triggers = {
    always_run = "${timestamp()}"
  }
  
  provisioner "local-exec" {
    command = <<EOF
      chmod +x ../Scripts/inventory.sh && chmod +x ../Scripts/config.sh
    EOF
  }

  provisioner "local-exec" {
    command = <<EOF
      ../Scripts/config.sh ${aws_instance.tf-ec2.public_ip}
    EOF
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
