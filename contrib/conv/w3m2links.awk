#!/bin/awk -f
#
# This converts w3m bookmarks.html to ELinks bookmarks.lst used by the Lua
# based bookmarks handling (NOT the internal one!).
#
# Feed it by w3m bookmarks.html on stdin.
#
# Done by Stephane Chazelas <stephane.chazelas@free.fr>
#

BEGIN {
    FS="[<>\"]"
        c="return {"
}
$2 == "h2" {
    print c "\n  {\n    category = \""$3"\";"
        c="  },"
}
$2 == "li" {
    print "    { name = \""$7"\", url = \""$5 "\" },"
}
END {
    print "  },\n}"
}
