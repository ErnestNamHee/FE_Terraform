#cloud-config
write_files:
- content: |
    #/bin/bash
    cat << EOF >> /tmp/output.txt
    Hello from dependent script!
    EOF
  owner: root:root
  path: /usr/local/bin/deps.sh
  permissions: '0750'
- content: |
    {
      "insecure-registries":["registry.eu-west-0.prod-cloud-ocb.orange-business.com"]
    }
  owner: root:root
  path: /etc/docker/daemon.json
  permissions: '0777'
- content: |
    # installed by cloud-init
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
  path: /etc/yum.repos.d/kubernetes.repo
  permissions: '0444'
  owner: root
yum_repos:
  docker-ce:
    baseurl: https://download.docker.com/linux/centos/7/$basearch/stable
    enabled: true
    gpgcheck: true
    gpgkey: https://download.docker.com/linux/centos/gpg
package_upgrade: true
ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwIcVgyy6zTCm8hdkg6t1Xi1h053JGHYV1hEW8j7T8OtaEQOp1jRHUo0CmVpuxvg2ZnqFwP9Jvv6caJ2cpo5F36FD0GLee0FbkH6vl2WBMT85ryN5hVZ2us1ChHiRBP2IYtoVfxdlK1eahUkBH431O39PuAQUR9BDM54Xt6+nyXgBncIGWxb6XiKDgN+UPSiEBw76wMYZ11b7UCJmvFRrxGIu+K6JLifcAt0YYnSne9dqd1OEQjFPVZyC6D2T8ucW8YlHKU4SOAMivwfSMzJutwCgXF0TqMu0Pv4GiX1dIdkTQ9hN7WGGr9ARid/1KpG2Ivdvp4Tnrt8pEzSuG43lN Generated-by-Nova
packages:
 - wget
 - yum-utils 
 - device-mapper-persistent-data
 - vm2
 - docker-ce
 - docker-ce-cli
 - containerd.io
 - git
 - kubectl
 - java-1.8.0-openjdk-devel