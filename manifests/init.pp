# == Class: gcc
#
# Manage the gcc package(s).
#
class gcc (
  $package_name   = undef,
  $package_ensure = 'present'
) {

  if $package_name == undef {
    case $::osfamily {
      'RedHat': {
        $package_name_real = [ 'gcc', 'gcc-c++' ]
      }
      'Debian': {
        $package_name_real = [ 'gcc', 'build-essential' ]
      }
      default: {
        $package_name_real = 'gcc'
      }
    }
  } else {
    if is_string($package_name) == false and is_array($package_name) == false {
      fail('package_name must be an array or a string.')
    } else {
      $package_name_real = $package_name
    }
  }

  package { $package_name_real:
    ensure => $package_ensure,
  }
}
