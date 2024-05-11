#! /usr/bash
# redial dbpedia: 0.5, 0.7, 0.9, 1, 3
nhop="0.5"
. scripts/redial-dbpedia.sh

nhop="0.7"
. scripts/redial-dbpedia.sh

nhop="0.9"
. scripts/redial-dbpedia.sh

nhop="1"
. scripts/redial-dbpedia.sh

nhop="3"
. scripts/redial-dbpedia.sh
