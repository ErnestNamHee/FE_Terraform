resource "flexibleengine_dns_zone_v2" "private_zone" {
	name = "local."
	description = "used to inject the cce master ip to the domain"
	ttl = 3000
	zone_type = "private"
	router = [
		{
			router_region = "eu-west-0"
			router_id = "${flexibleengine_networking_router_v2.router_jenkins.id}"
		}
	]
	
}

resource "flexibleengine_dns_recordset_v2" "rs_for_cce_master" {
	zone_id = "${flexibleengine_dns_zone_v2.private_zone.id}"
	name = "kubernetes.default.svc.cluster.local."
	description = "Thanks god dns record helps me to solve this issue"
	ttl = 3000
	type = "A"
	records = ["${flexibleengine_vpc_eip_v1.eip_cce_cluster.publicip.0.ip_address}"]
	
}
/*
resource "flexibleengine_dns_recordset_v2" "rs_for_cce_master_external" {
	zone_id = "${flexibleengine_dns_zone_v2.private_zone.id}"
	name = "kubernetes.default.svc.cluster.local."
	description = "Thanks god dns record helps me to solve this issue"
	ttl = 3000
	type = "A"
	records = ["${var.external_cce_cluster_ip}"]

}
*/