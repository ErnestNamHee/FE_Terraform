#cloud-config
write_files:
- encoding: b64
  content: |
    #create it first
  owner: root:root
  path: /etc/docker/test_file
  permissions: '0750'

final_message: "The system is finally up, after $UPTIME seconds"