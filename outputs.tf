output "mysql_server_pe_ip_address" {
  value = module.MysqlServer.mysql_server_pe_ip_address
}

output "mysql_fqdn" {
  value = module.MysqlServer.mysql_fqdn
}

output "mysql_server_administrator_login" {
  value = module.MysqlServer.mysql_server_administrator_login
}

output "mysql_server_administrator_login_password" {
  value = module.MysqlServer.mysql_server_administrator_login_password
}

output "database_name" {
  value = module.MysqlServer.database_name
}

output "container_group" {
  value = module.ContainerGroup.container_group
}

output "container_group_ip_address" {
  value = module.ContainerGroup.container_group_ip_address
}

output "mount_storage_account" {
  value = module.ContainerGroup.mount_storage_account
}

output "mount_file_shares" {
  value = module.ContainerGroup.mount_file_shares
}

output "mount_storage_account_key" {
  value = module.ContainerGroup.mount_storage_account_key
}

output "network_profile_id" {
  value = module.ContainerGroup.network_profile_id
}
