variable "flavor_name" {
	default = "c1.large"
	description = "Choose a type for the instance"
}

variable "external_cce_cluster_ip" {
	default = "1.2.3.4"
	description = "Necessary if only creating jenkins"
}




variable "cluster_flavor_size" {
	default = "cce.s1.small"
	description = "Cluster size specification, s1 means singe node master, s2 means HA mode master, t1 means phisical single node ... check terraform flexibleengine cce for a closer look"
}

variable "node_flavor_size" {
	default = "s1.medium"
	description = "Node type"
}

variable "cluster_type" {
	default = "VirtualMachine"
	description = "VirtualMachine or BareMetal, your call"
}

variable "availability_zone" {
	default = "eu-west-0a"
	description = "az"
}


