resource "flexibleengine_networking_secgroup_v2" "sg_example" {
  name        = "sg_example"
  description = "security group for test"
  
}

resource "flexibleengine_networking_secgroup_rule_v2" "sg_rule_ftp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${flexibleengine_networking_secgroup_v2.sg_example.id}"
  
}

resource "flexibleengine_networking_secgroup_rule_v2" "sg_rule_jenkins" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8080
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${flexibleengine_networking_secgroup_v2.sg_example.id}"

}