resource "flexibleengine_networking_router_v2" "router_jenkins" {
  name             = "VPC-Jenkins"
  admin_state_up   = "true"
  
}

resource "flexibleengine_networking_network_v2" "network_jenkins" {
  name           = "VPC-Jenkins-Network"
  admin_state_up = "true"
  
}

resource "flexibleengine_networking_subnet_v2" "subnet_jenkins" {
  name            = "public_subnet"
  network_id      = "${flexibleengine_networking_network_v2.network_jenkins.id}"
  cidr            = "192.168.0.0/24"
  ip_version      = 4
  dns_nameservers  = ["100.125.0.41","100.126.0.41"]
  
}

/*DNS servers are fixed for all?????*/

resource "flexibleengine_networking_router_interface_v2" "interface" {
  router_id = "${flexibleengine_networking_router_v2.router_jenkins.id}"
  subnet_id = "${flexibleengine_networking_subnet_v2.subnet_jenkins.id}"
  
}

/*How to add a CIDR range for VPC???? I only created a range with vpc resource instead of router*/

resource "flexibleengine_vpc_eip_v1" "eip_1" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name = "test"
    size = 20
    share_type = "PER"
  }
  
}




