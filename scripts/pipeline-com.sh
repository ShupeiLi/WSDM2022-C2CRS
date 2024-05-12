# redial conceptnet: 0.5, 0.7, 0.9, 1, 2, 3
nhop="0.5"
nkey="0.5"
. scripts/redial-conceptnet.sh

nhop="0.7"
nkey="0.7"
. scripts/redial-conceptnet.sh

nhop="0.9"
nkey="0.9"
. scripts/redial-conceptnet.sh

nhop="1"
nkey="one"
. scripts/redial-conceptnet.sh

nhop="2"
nkey="two"
. scripts/redial-conceptnet.sh

nhop="3"
nkey="three"
. scripts/redial-conceptnet.sh

# tgredial hownet: 0.5, 0.7, 0.9, 1, 2, 3
nhop="0.5"
nkey="0.5"
. scripts/tgredial-hownet.sh

nhop="0.7"
nkey="0.7"
. scripts/tgredial-hownet.sh

nhop="0.9"
nkey="0.9"
. scripts/tgredial-hownet.sh

nhop="1"
nkey="one"
. scripts/tgredial-hownet.sh

nhop="2"
nkey="two"
. scripts/tgredial-hownet.sh

nhop="3"
nkey="three"
. scripts/tgredial-hownet.sh
