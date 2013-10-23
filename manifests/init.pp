# Class: gcc
#
# This class installs gcc
#
# Parameters:
#
# Actions:
#   - Install the gcc package
#
# Requires:
#
# Sample Usage:
#
class gcc {
  include gcc::params
  ensure_packages(any2array($gcc::params::gcc_package))
}
