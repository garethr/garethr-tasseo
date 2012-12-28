Puppet module for installing the Tasseo graphite dashboard.

This module is also available on the [Puppet
Forge](https://forge.puppetlabs.com/garethr/tasseo)

[![Build
Status](https://secure.travis-ci.org/garethr/garethr-tasseo.png)](http://travis-ci.org/garethr/garethr-tasseo)
[![Dependency
Status](https://gemnasium.com/garethr/garethr-tasseo.png)](http://gemnasium.com/garethr/garethr-tasseo)

## Usage

The module includes a single class:

    include 'tasseo'

This installs tasseo and starts it running on port 5000 and connects to a Graphite instance running on localhost:8081.

## Configuration

It's very likely you'll want to override at least the URL where graphite can be found.

    class { 'tasseo':
      port         => 5001,
      graphite_url => 'http://graphite.example.com',
    }
