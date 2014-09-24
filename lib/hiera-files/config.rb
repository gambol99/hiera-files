#
#   Author: Rohith
#   Date: 2014-09-23 22:27:34 +0100 (Tue, 23 Sep 2014)
#
#  vim:ts=2:sw=2:et
#
module HieraFiles
  module Config
    Default_Configuration = <<EOF
---
:backends:
  - yaml
:logger: noop
:hierarchy:
  - hosts/%{hostname}
  - environment/%{hostname}
  - environment/%{app}
  - apps/%{app}
  - common
:yaml:
  :datadir: hieradata/
EOF
  end
end
