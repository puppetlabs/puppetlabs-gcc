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
class gcc::params{
  
  case $::osfamily {
    'RedHat': {
       $gcc_packages = ['gcc']
    }
    'Debian': {
       $gcc_packages = [ 'gcc', 'build-essential' ]
    }
  }
}
