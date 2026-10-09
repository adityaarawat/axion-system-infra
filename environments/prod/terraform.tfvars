# =========================
# RESOURCE GROUPS
# =========================

rgs = {
  rg1 = {
    name     = "rg-axion-prod-ci-01"
    location = "central india"
  }
  rg2 = {
    name     = "rg-axion-prod-ci-02"
    location = "central india"
  }
}


# =========================
# VIRTUAL NETWORKS
# =========================

vnets = {
  vnet1 = {
    name                = "vnet-axion-prod"
    resource_group_name = "rg-axion-prod-ci-01"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
  }
}


# =========================
# SUBNETS
# =========================

snets = {

  snet1 = {
    name                 = "axion-prod-ui-subnet"
    resource_group_name  = "rg-axion-prod-ci-01"
    virtual_network_name = "vnet-axion-prod"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "axion-prod-backend-subnet"
    resource_group_name  = "rg-axion-prod-ci-01"
    virtual_network_name = "vnet-axion-prod"
    address_prefixes     = ["10.0.2.0/24"]
  }

  # snet3 = {
  #   name                 = "axion-database-subnet"
  #   resource_group_name  = "rg-axion-prod-ci-01"
  #   virtual_network_name = "vnet-axion-prod"
  #   address_prefixes     = ["10.0.3.0/24"]
  # }
}


# =========================
# PUBLIC IPs
# =========================

pips = {

  pips1 = {
    name                = "axion-prod-ui-pip"
    location            = "central india"
    resource_group_name = "rg-axion-prod-ci-01"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pips2 = {
    name                = "axion-prod-backend-pip"
    location            = "central india"
    resource_group_name = "rg-axion-prod-ci-01"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  # pips3 = {
  #   name                = "axion-database-pip"
  #   location            = "central india"
  #   resource_group_name = "rg-axion-prod-ci-01"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"
  # }
}


# =========================
# NETWORK SECURITY GROUPS
# =========================

nsgs = {

  nsg1 = {
    nsg_name            = "nsg-prod-frontend"
    location            = "central india"
    resource_group_name = "rg-axion-prod-ci-01"

    security_rules = {

      rule1 = {
        name                       = "allow-http"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      rule2 = {
        name                       = "allow-https"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }


  nsg2 = {
    nsg_name            = "nsg-prod-backend"
    location            = "central india"
    resource_group_name = "rg-axion-prod-ci-01"

    security_rules = {

      rule1 = {
        name                       = "allow-8080"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      rule2 = {
        name                       = "allow-22"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }


  # nsg3 = {
  #   nsg_name            = "nsg-database"
  #   location            = "central india"
  #   resource_group_name = "rg-axion-prod-ci-01"

  #   security_rules = {

  #     rule1 = {
  #       name                       = "allow-postgresql"
  #       priority                   = 100
  #       direction                  = "Inbound"
  #       access                     = "Allow"
  #       protocol                   = "Tcp"
  #       source_port_range          = "*"
  #       destination_port_range     = "5432"
  #       source_address_prefix      = "*"
  #       destination_address_prefix = "*"
  #     }

  #     rule2 = {
  #       name                       = "allow-mysql"
  #       priority                   = 110
  #       direction                  = "Inbound"
  #       access                     = "Allow"
  #       protocol                   = "Tcp"
  #       source_port_range          = "*"
  #       destination_port_range     = "3306"
  #       source_address_prefix      = "*"
  #       destination_address_prefix = "*"
  #     }
  #   }
  # }
}


# =========================
# VIRTUAL MACHINES
# =========================

vms = {

  vm1 = {
    name                = "axion-prod-frontend-vm"
    location            = "central india"
    resource_group_name = "rg-axion-prod-ci-01"

    subnet_name          = "axion-prod-ui-subnet"
    virtual_network_name = "vnet-axion-prod"

    nic_name       = "nic-prod-fvm"
    nsg_name       = "nsg-prod-frontend"
    pip_name       = "axion-prod-ui-pip"
    ip_config_name = "ipconfig-prod-fvm"

    vm_size = "Standard_B2ts_v2"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    storage_os_name   = "osdisk-vm-prod-01"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    computer_name  = "axion-prod-fvm"
    admin_username = "aditya"
    admin_password = "Happyty@@321"
  }


  vm2 = {
    name                = "axion-prod-backend-vm"
    location            = "central india"
    resource_group_name = "rg-axion-prod-ci-01"

    subnet_name          = "axion-prod-backend-subnet"
    virtual_network_name = "vnet-axion-prod"

    nic_name       = "nic-prod-bvm"
    nsg_name       = "nsg-prod-backend"
    pip_name       = "axion-prod-backend-pip"
    ip_config_name = "ipconfig-prod-bvm"

    vm_size = "Standard_B2ts_v2"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    storage_os_name   = "osdisk-vm-prod-02"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    computer_name  = "axion-prod-bvm"
    admin_username = "aditya"
    admin_password = "Happyty@@321"
  }


  # vm3 = {
  #   name                = "axion-database-vm"
  #   location            = "central india"
  #   resource_group_name = "rg-axion-prod-ci-01"

  #   subnet_name          = "axion-database-subnet"
  #   virtual_network_name = "vnet-axion-prod"

  #   nic_name       = "nic-dvm"
  #   nsg_name       = "nsg-database"
  #   pip_name       = "axion-database-pip"
  #   ip_config_name = "ipconfig-dvm"

  #   vm_size = "Standard_B2s"

  #   publisher = "Canonical"
  #   offer     = "0001-com-ubuntu-server-jammy"
  #   sku       = "22_04-lts"
  #   version   = "latest"

  #   storage_os_name   = "osdisk-vm-dev-03"
  #   caching           = "ReadWrite"
  #   create_option     = "FromImage"
  #   managed_disk_type = "Standard_LRS"

  #   computer_name  = "axion-dvm"
  #   admin_username = "aditya"
  #   admin_password = "REPLACE_WITH_SECURE_PRODUCTION_VM_PASSWORD"
  # }
}

postgresql_servers = {
  pgsql = {
    name                   = "pgsql-axion-prod-ci-01"
    resource_group_name    = "rg-axion-prod-ci-01"
    location               = "central india"
    administrator_login    = "aditya"
    administrator_password = "Yolo@@321"
    database_name          = "axionproddb"
    zone                   = "1"
  }
}

