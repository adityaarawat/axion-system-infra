# =========================
# RESOURCE GROUPS
# =========================

rgs = {
  rg1 = {
    name     = "rg-axion-sandbox-ci-01"
    location = "central india"
  }
  rg2 = {
    name     = "rg-axion-sandbox-ci-02"
    location = "central india"
  }
}


# =========================
# VIRTUAL NETWORKS
# =========================

vnets = {
  vnet1 = {
    name                = "vnet-axion-sandox"
    resource_group_name = "rg-axion-sandbox-ci-01"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
  }
}


# =========================
# SUBNETS
# =========================

snets = {

  snet1 = {
    name                 = "axion-ui-subnet"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandox"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "axion-backend-subnet"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandox"
    address_prefixes     = ["10.0.2.0/24"]
  }

  # snet3 = {
  #   name                 = "axion-database-subnet"
  #   resource_group_name  = "rg-axion-sandbox-ci-01"
  #   virtual_network_name = "vnet-axion-sandox"
  #   address_prefixes     = ["10.0.3.0/24"]
  # }
}


# =========================
# PUBLIC IPs
# =========================

pips = {

  pips1 = {
    name                = "axion-ui-pip"
    location            = "central india"
    resource_group_name = "rg-axion-sandbox-ci-01"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pips2 = {
    name                = "axion-backend-pip"
    location            = "central india"
    resource_group_name = "rg-axion-sandbox-ci-01"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  # pips3 = {
  #   name                = "axion-database-pip"
  #   location            = "central india"
  #   resource_group_name = "rg-axion-sandbox-ci-01"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"
  # }
}


# =========================
# NETWORK SECURITY GROUPS
# =========================

nsgs = {

  nsg1 = {
    nsg_name            = "nsg-frontend"
    location            = "central india"
    resource_group_name = "rg-axion-sandbox-ci-01"

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
    nsg_name            = "nsg-backend"
    location            = "central india"
    resource_group_name = "rg-axion-sandbox-ci-01"

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
  #   resource_group_name = "rg-axion-sandbox-ci-01"

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
    name                = "axion-frontend-vm"
    location            = "central india"
    resource_group_name = "rg-axion-sandbox-ci-01"

    subnet_name          = "axion-ui-subnet"
    virtual_network_name = "vnet-axion-sandox"

    nic_name       = "nic-fvm"
    nsg_name       = "nsg-frontend"
    pip_name       = "axion-ui-pip"
    ip_config_name = "ipconfig-fvm"

    vm_size = "Standard_B2ts_v2"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    storage_os_name   = "osdisk-vm-dev-01"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    computer_name  = "axion-fvm"
    admin_username = "aditya"
    admin_password = "Happyty@@321"
  }


  vm2 = {
    name                = "axion-backend-vm"
    location            = "central india"
    resource_group_name = "rg-axion-sandbox-ci-01"

    subnet_name          = "axion-backend-subnet"
    virtual_network_name = "vnet-axion-sandox"

    nic_name       = "nic-bvm"
    nsg_name       = "nsg-backend"
    pip_name       = "axion-backend-pip"
    ip_config_name = "ipconfig-bvm"

    vm_size = "Standard_B2ts_v2"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    storage_os_name   = "osdisk-vm-dev-02"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    computer_name  = "axion-bvm"
    admin_username = "aditya"
    admin_password = "Happyty@@321"
  }


  # vm3 = {
  #   name                = "axion-database-vm"
  #   location            = "central india"
  #   resource_group_name = "rg-axion-sandbox-ci-01"

  #   subnet_name          = "axion-database-subnet"
  #   virtual_network_name = "vnet-axion-sandox"

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
  #   admin_password = "Happyty@@321"
  # }
}

postgresql_servers = {
  pgsql = {
    name                   = "pgsql-axion-sandox-ci-01"
    resource_group_name    = "rg-axion-sandbox-ci-01"
    location               = "central india"
    administrator_login    = "aditya"
    administrator_password = "Yolo@@321"
    database_name          = "axiondb"
    zone                   = "1"
  }
}

