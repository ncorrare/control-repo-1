class profile::windows::ecommerceweb (
  $zippath,
  $websitename,
  $sourcerepo,
  $destinationpath,
  $zipname,
  ) {
  require profile::windows::iis
  $zipuri  = "${sourcerepo}/${zipname}"
  $zipfile = "${zippath}\\${zipname}"
  # Create tmp folder
  dsc_file {'tmp folder':
    dsc_ensure          => 'present',
    dsc_type            => 'Directory',
    dsc_destinationpath => $zippath,
  } ->

  # Download the site content
  dsc_xremotefile {'Download WebContent Zip':
    dsc_destinationpath => $zipfile,
    dsc_uri             => $zipuri,
  } ->

  # Extract the website content
  dsc_archive {'Unzip and Copy the WebContent':
    dsc_ensure      => 'present',
    dsc_path        => $zipfile,
    dsc_destination => $destinationpath,
  } ->

  # Create a new Website
  dsc_xwebsite {'BackeryWebSite':
    dsc_ensure       => 'present',
    dsc_name         => $websitename,
    dsc_state        => 'Started',
    dsc_physicalpath => $destinationpath,
  }
  # Add the firewall rule to allow HTTP Access
  dsc_xfirewall { 'Allow HTTP':
    dsc_name      => "FourthCoffee - Allow HTTP",
    dsc_ensure    => 'present',
    dsc_direction => 'Inbound',
    dsc_localport => '80',
    dsc_protocol  => 'TCP',
    dsc_action    => 'Allow',
  }
}
