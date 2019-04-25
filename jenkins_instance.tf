resource "flexibleengine_compute_instance_v2" "jenkins_server" {
  region = "eu-west-0"
  availability_zone = "eu-west-0a"
  name            = "my-jenkins-server"
  image_id      = "671d11c3-7c4b-4010-9a19-68e5922e0869"
  flavor_name     = "${var.flavor_name}"
  key_pair      = "${flexibleengine_compute_keypair_v2.my_keypair.name}"
  security_groups = ["${flexibleengine_networking_secgroup_v2.sg_example.id}"]
  user_data = "${data.template_cloudinit_config.preparation.rendered}"

  network {
    uuid = "${flexibleengine_networking_network_v2.network.id}"
  }
  depends_on = ["flexibleengine_networking_router_interface_v2.interface"]
}



resource "flexibleengine_compute_floatingip_associate_v2" "eip_1" {
  floating_ip = "${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address}"
  instance_id = "${flexibleengine_compute_instance_v2.jenkins_server.id}"
}

/*
output "instance_private_address" {
  value = "${flexibleengine_compute_instance_v2.jenkins_server.access_ip_v4}"
}


output "instance_float_address" {
  value = "${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address}"
}
*/

output "SSH" {
  value = "ssh -i KeyPair-CCE-DEMO.pem cloud@${flexibleengine_vpc_eip_v1.eip_1.publicip.0.ip_address}"
}

output "jenkins_credential"{ 
  value = "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
}


