  provider "flexibleengine" {
  user_name = "XXXXXXXXXXXXX"
  domain_name = "XXXXXXXXX"
  tenant_name = "XXXXXXXXXXXXX"
  access_key = "XXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
  
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
  region = "eu-west-0"
  }

  resource "flexibleengine_compute_keypair_v2" "my_keypair" {
  name = "KeyPair-CCE-TEMP"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwIcVgyy6zTCm8hdkg6t1Xi1h053JGHYV1hEW8j7T8OtaEQOp1jRHUo0CmVpuxvg2ZnqFwP9Jvv6caJ2cpo5F36FD0GLee0FbkH6vl2WBMT85ryN5hVZ2us1ChHiRBP2IYtoVfxdlK1eahUkBH431O39PuAQUR9BDM54Xt6+nyXgBncIGWxb6XiKDgN+UPSiEBw76wMYZ11b7UCJmvFRrxGIu+K6JLifcAt0YYnSne9dqd1OEQjFPVZyC6D2T8ucW8YlHKU4SOAMivwfSMzJutwCgXF0TqMu0Pv4GiX1dIdkTQ9hN7WGGr9ARid/1KpG2Ivdvp4Tnrt8pEzSuG43lN Generated-by-Nova"
  }
