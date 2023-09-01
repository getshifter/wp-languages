#!/bin/bash

WP_VERSION=${1:-6.3}

set -xE -o pipefail
curl -s "https://api.wordpress.org/translations/core/1.0/?version=$WP_VERSION" \
 | jq -r '.translations[] | .language + " " + .package' > /tmp/langs

function _extract() {
  wget $2 -O /tmp/$1.zip

  unzip -o /tmp/$1.zip -d /srv/languages
  rm -f /tmp/$1.zip
}

input="/tmp/langs"
while IFS= read -r line
do
  _extract $line
done < "$input"

rm -f /tmp/langs
