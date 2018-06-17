# Class: gcc::params
#
# This class manages parameters for the gcc module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class gcc::params {
  case $facts['os']['family'] {
    'RedHat': {
      $gcc_packages = [ 'gcc', 'gcc-c++' ]
    }
    'Debian': {
      $gcc_packages = [ 'gcc', 'build-essential' ]
    }
    'Archlinux': {
      $gcc_packages = ['gcc']
    }
    default: {
      fail("Class['gcc::params']: Unsupported osfamily: ${facts['os']['family']}")
    }
  }
}
