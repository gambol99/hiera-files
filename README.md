Hiera-Files
===================

Description
-------------

Used to generate a one or more file/configuration files from a hiera based data source

Usage
-------------

The bin/cfg command can be used to generate the rendered file;

  [jest@starfury hiera-files] $ bin/cfg --help

  Usage: cfg [options]
      -h, --help                       display this usage menu
          --dry-run                    perform a dry-run of the configuration generation
      -c, --config CONFIG              an alternative hiera configuration file
      -v, --verbose                    switch on verbose mode
  
      commands : -------------------------------------------------------------
      render (ren)                     render the configuration files from hiera data
      ------------------------------------------------------------------------
  
      render : description: render the configuration files from hiera data
      ------------------------------------------------------------------------
  
      -f, --filter FILTER              a filter to the files in the directory (defaults: *.erb)
      -d, --directory DIRECTORY        the directory containing the configuration files (defaults: ./)
      -h, --hiera DIRECTORY            override the directory holding the hiera data (defaults: ./hieradata)
      -b, --base DIRECTORY             write the generated files into this directory (defaults: ./)
      -s, --scope FILE                 a yaml backed file contains the scope
      -e, --entry KEY=VALUE            add a entry into the scope
      -w, --write                      write generated configuration files to disk: config.conf.erb -> config.conf

#### <i class="icon-pencil"></i> Example

Assumptions; 
  

 1. We have a collection of configuration files located in ./config/
 2. We have the hiera data located in ./data
 3. We want to write out the rendered files to ./generated

    [jest@starfury hiera-files] $ ./cfg ren -d ./configs/ -h ./data -b ./generated


