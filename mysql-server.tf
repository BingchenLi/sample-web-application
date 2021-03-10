module "MysqlServer" {
  source = "ocal_path_of_module-mysql-server"

  resource_group_name = data.azurerm_resource_group.resource_group.name

  # mysql server
  mysql_server_name   = "ipamacimysql"
  administrator_login = "myadm"

  # private endpoint
  vnet_name   = "vnet"
  subnet_name = "subnet"
  vnet_rg     = "vnet-rg"

  # database
  database_name = ["phpipam"]
}
