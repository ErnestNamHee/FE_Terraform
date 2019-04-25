#cloud-config
write_files:
- encoding: b64
  content: |
    #create it first
  owner: root:root
  path: /etc/docker/daemon.json
  permissions: '0750'