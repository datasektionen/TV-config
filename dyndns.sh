#!/bin/sh

# The record must be created before this script is ran
zone_id="68e442a4b3ebbac100c845a888326ddb"
record_id="74eca818cb8c6665ce8e4815d1b87943"
public_interface=wlp3s0

curl -X PATCH \
    "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id" \
    -H "Authorization: Bearer $CLOUDFLARE_APITOKEN"\
    -H "Content-Type: application/json" \
    -d '{"content":"'$(ip a s "$public_interface" | awk '/inet /{gsub(/\/.*/, "", $2); print $2}')'"}' \
    | jq
