#gcc

####Table of Contents

1. [Overview](#overview)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Parameters](#parameters)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

##Overview

Installs the 'gcc' package.

##Usage

```puppet
  include ::gcc
```

To override the package name,

```puppet
  class { '::gcc':
    package_name => 'my-gcc',
  }
```

##Parameters

---
#### package_name (type: Array or String)
Name of package(s) for gcc. When the value is `undef`, the packages will
be based on the platform.

- *Default*: undef

---
####package_ensure (type: String)
Value of `ensure` attribute for gcc package.

- *Default*: 'present'

##Limitations

Supports Puppet v3 and v4 against a matrix of Ruby versions documented
in .travis.yml on the following platforms.

* EL 5
* EL 6
* EL 7
* SLES/SLED 10
* SLES/SLED 11
* SLES/SLED 12
* Ubuntu 12.04
* Ubuntu 14.04
* Ubuntu 16.04

##Development

To contribute, fork
[https://github.com/puppetlabs/puppetlabs-gcc.git](https://github.com/puppetlabs/puppetlabs-gcc.git),
gcc a branch for your changes, and file a pull request.

##Contributors

Thank you to all of our [https://github.com/puppetlabs/puppetlabs-gcc/graphs/contributors](contributors).
