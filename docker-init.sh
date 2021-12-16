#!/bin/bash

# First get our public IP
NEW_IP=$(curl -s https://api.ipify.org)
echo "WAN IP: ${NEW_IP}"

# Create our update json object
JSON_CMD=$(cat <<ENDOFDOC
{
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "$DNS_FQDN.",
        "Type": "A",
        "TTL": $DNS_TTL,
        "ResourceRecords": [
          {
            "Value": "$NEW_IP"
          }
        ]
      }
    }
  ]
}
ENDOFDOC
)

aws route53 change-resource-record-sets \
		--hosted-zone-id "$AWS_ZONE_ID" \
    --change-batch "$JSON_CMD"
