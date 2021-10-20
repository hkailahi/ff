#!/bin/bash

LEAGUE_ID=726159828883464192

curl -XGET https://api.sleeper.app/v1/league/$LEAGUE_ID/users \
  | jq '[.[] | { name: .display_name, avatar: .avatar}]' \
  | jq '[.[] | "curl -XGET https://sleepercdn.com/avatars/\(.avatar) > \(.name).png"]' \
  | xargs echo
