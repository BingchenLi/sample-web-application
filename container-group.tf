module "ContainerGroup" {
  source = "local_path_of_module-container-group"

  project                    = "phpipam"
  rg                         = data.azurerm_resource_group.resource_group.name
  mount_storage_account_name = "sa-phpipam"
  mount_file_share_name      = ["phpipam-share-1"]
  vnet_name                  = "vnet"
  subnet_name                = "container-group" # need to be created in advance and should set 'delegate : containerGroup'
  vnet_rg                    = "vnet-rg"

  containers_config = {
    # container : phpipam-web
    "phpipam-web" = {
      image = "phpipam/phpipam-www:latest"

      ports = [
        {
          port     = 80
          protocol = "TCP"
        }
      ]

      volume = [
        {
          name       = "phpipam-www-mnt"
          mount_path = "/mnt"
          share_name = "phpipam-share-1"
        }
      ]

      environment_variables = {
        "IPAM_DATABASE_HOST" = module.MysqlServer.mysql_fqdn
        "IPAM_DATABASE_USER" = module.MysqlServer.mysql_server_administrator_login
        "IPAM_DATABASE_PASS" = module.MysqlServer.mysql_server_administrator_login_password
        "IPAM_DATABASE_NAME" = module.MysqlServer.database_name[0]
        "IPAM_DATABASE_PORT" = 3306
      }
    }

    # container : phpipam-cron
    "phpipam-cron" = {
      image = "phpipam/phpipam-cron:latest"

      environment_variables = {
        "IPAM_DATABASE_HOST" = module.MysqlServer.mysql_fqdn
        "IPAM_DATABASE_USER" = module.MysqlServer.mysql_server_administrator_login
        "IPAM_DATABASE_PASS" = module.MysqlServer.mysql_server_administrator_login_password
        "IPAM_DATABASE_NAME" = module.MysqlServer.database_name[0]
        "IPAM_DATABASE_PORT" = 3306
      }
    }
  }
}
