data "template_file" "init" {
	template = "${file("${path.module}/scripts/init.tpl")}"
} 

data "template_file" "config" {
	template="${file("${path.module}/scripts/bootstrap.sh")}"
}

data "template_cloudinit_config" "preparation"{
	gzip = true
	base64_encode = true

	part {
		content_type = "text/cloud-config"
		content = "${data.template_file.init.rendered}"
	}

	part {
		content_type = "text/x-shellscript"
		content = "${data.template_file.config.rendered}"
	}
}