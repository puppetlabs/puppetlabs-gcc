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
  ensure_packages($gcc::params::gcc_packages)
}
