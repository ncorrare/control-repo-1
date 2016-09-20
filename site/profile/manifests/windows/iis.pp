class profile::windows::iis {
  dsc_windowsfeature {'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
  } ->
  dsc_windowsfeature {'AspNet45':
     dsc_ensure => 'present',
     dsc_name   => 'Web-Asp-Net45',
  } ->
   dsc_xwebsite {'Stop DefaultSite':
    dsc_ensure       => 'present',
    dsc_name         => 'Default Web Site',
    dsc_state        => 'Stopped',
    dsc_physicalpath => 'C:\inetpub\wwwroot',
  }
}
