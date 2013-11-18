#! /bin/sh

ENDPOINT="http://www.wikipathways.org/wpi/webservice/webservice.php/"

VALUE=WP100
if [ -n "${1}" ]; then
    PATHWAY=${1}
fi

curl --silent --data @- --header 'Content-Type: application/soap+xml; charset=utf-8' --user-agent "" ${ENDPOINT}<<EOF |xmllint --format -
<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <getPathwayInfo xmlns="http://www.wikipathways.org/webservice">
      <pwId>${PATHWAY}</pwId>
    </getPathwayInfo>
  </soap12:Body>
</soap12:Envelope>
EOF

