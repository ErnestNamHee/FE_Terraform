resource "flexibleengine_networking_router_v2" "router" {
  name             = "vpc_for_jenkins"
  admin_state_up   = "true"
}

resource "flexibleengine_networking_network_v2" "network" {
  name           = "vpc_network"
  admin_state_up = "true"
}

resource "flexibleengine_networking_subnet_v2" "subnet" {
  name            = "public_subnet"
  network_id      = "${flexibleengine_networking_network_v2.network.id}"
  cidr            = "192.168.0.0/24"
  ip_version      = 4
  dns_nameservers  = ["100.125.0.41","100.126.0.41"]
}

/*DNS servers are fixed for all?????*/

resource "flexibleengine_networking_router_interface_v2" "interface" {
  router_id = "${flexibleengine_networking_router_v2.router.id}"
  subnet_id = "${flexibleengine_networking_subnet_v2.subnet.id}"
}

resource "flexibleengine_vpc_v1" "vpc_v1" {
  name = "vpc_for_jenkins_2"
  cidr = "192.168.0.0/16"
}

resource "flexibleengine_vpc_subnet_v1" "subnet_v1" {
  name = "public_subnet"
  cidr = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
  vpc_id = "${flexibleengine_vpc_v1.vpc_v1.id}"
  dns_list = ["100.125.0.41","100.126.0.41"]
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