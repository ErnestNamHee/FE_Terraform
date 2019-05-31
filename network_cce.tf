/* About VPC CCE Runtime*/
resource "flexibleengine_networking_router_v2" "router_cce" {
  name             = "VPC-Runtime"
  admin_state_up   = "true"
  
}

resource "flexibleengine_networking_network_v2" "network_cce" {
  name           = "VPC-Runtime-Network"
  admin_state_up = "true"
  
}

resource "flexibleengine_networking_subnet_v2" "subnet_cce" {
  name            = "public_subnet"
  network_id      = "${flexibleengine_networking_network_v2.network_cce.id}"
  cidr            = "192.168.0.0/24"
  ip_version      = 4
  dns_nameservers  = ["100.125.0.41","100.126.0.41"]
  
}

resource "flexibleengine_networking_router_interface_v2" "interface_cce" {
  router_id = "${flexibleengine_networking_router_v2.router_cce.id}"
  subnet_id = "${flexibleengine_networking_subnet_v2.subnet_cce.id}"
  
}