/*
output "instance_private_address" {
  value = "${flexibleengine_compute_instance_v2.jenkins_server.access_ip_v4}"
}


output "instance_float_address" {
  value = "${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address}"
}
*/

output "SSH_DEBUG" {
  value ="Debug in jenkins --- ssh -i KeyPair-CCE-DEMO.pem cloud@${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address} ---"
}

output "change_pem_file_mode" {
  value = "Todo : Do command --- 'chmod 400 Keypair-CCE-DEMO.pem' --- "
}

output "bind_master_EIP" {
  value = "Todo : bind the EIP ${flexibleengine_vpc_eip_v1.eip_cce_cluster.publicip.0.ip_address} to the CCE Master in the console"
}

output "jenkins_credential"{ 
  value = "Todo : Get the admin password: --- ssh -i KeyPair-CCE-DEMO.pem -t cloud@${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address} 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword' ---  Go to ${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address}:8080 to intall plugins and set credentials"
}

