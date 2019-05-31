resource "flexibleengine_cce_cluster_v3" "cluster" {
     name = "cce-demo-cluster"
     cluster_type= "${var.cluster_type}"
     billing_mode = 0
     flavor_id= "${var.cluster_flavor_size}"
     cluster_version = "v1.11.3-r1"
     vpc_id= "${flexibleengine_networking_router_v2.router_cce.id}"
     subnet_id= "${flexibleengine_networking_network_v2.network_cce.id}"
     container_network_type= "overlay_l2"
     container_network_cidr = "172.16.0.0/16"
     depends_on = ["flexibleengine_networking_router_interface_v2.interface"]
     
}


resource "flexibleengine_cce_node_v3" "node_1" {
  cluster_id = "${flexibleengine_cce_cluster_v3.cluster.id}"
  name = "cce-demo-node-1"
  flavor_id = "${var.node_flavor_size}"
  iptype = "5_bgp"
  eip_count=1
  availability_zone = "${var.availability_zone}"
  key_pair = "${flexibleengine_compute_keypair_v2.my_keypair.name}"
  root_volume = {
    size = 40
    volumetype = "SATA"
  }
  sharetype = "PER"
  bandwidth_size = 100
  data_volumes = [
    {
      size = 100,
      volumetype = "SATA"
    }
  ]
  
}


resource "flexibleengine_vpc_eip_v1" "eip_cce_cluster" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name = "eip-for-cce-demo-cluster"
    size = 20
    share_type = "PER"
  }
  
}
