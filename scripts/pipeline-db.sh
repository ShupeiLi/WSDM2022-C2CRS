#! /usr/bash
# redial dbpedia: 3
nhop="3"
. scripts/redial-dbpedia.sh

# tgredial cn-dbpedia: 0.5, 0.7, 0.9, 1, 3
nhop="0.5"
nkey="0.5"
. scripts/tgredial-cndbpedia.sh

nhop="0.7"
nkey="0.7"
. scripts/tgredial-cndbpedia.sh

nhop="0.9"
nkey="0.9"
. scripts/tgredial-cndbpedia.sh

nhop="1"
nkey="one"
. scripts/tgredial-cndbpedia.sh

nhop="3"
nkey="three"
. scripts/tgredial-cndbpedia.sh
