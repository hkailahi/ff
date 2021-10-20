## TierMaker

Make [tier lists](https://tiermaker.com/create/) from [Sleeper Fantasy Football League](sleeper.app)

Currently just a stupid script + manual step that pulls PNGs from SleeperCDN. Maybe a haskell client later 🤷‍♂️

## Steps

1. Get your League Id
   1. Login to sleeper and pull it from end of url
2. Run the following get commands to retrieving team avatars:
```bash
LEAGUE_ID=726159828883464192

curl -XGET https://api.sleeper.app/v1/league/$LEAGUE_ID/users \
  | jq '[.[] | { name: .display_name, avatar: .avatar}]' \
  | jq '[.[] | "curl -XGET https://sleepercdn.com/avatars/\(.avatar) > \(.name).png"]' \
  | xargs echo
```
3. Execute each command manually
   1. Ex:
```bash
Henelis-MacBook-Pro:tiermaker hkailahi$ LEAGUE_ID=726159828883464192
Henelis-MacBook-Pro:tiermaker hkailahi$ curl -XGET https://api.sleeper.app/v1/league/$LEAGUE_ID/users \
>   | jq '[.[] | { name: .display_name, avatar: .avatar}]' \
>   | jq '[.[] | "curl -XGET https://sleepercdn.com/avatars/\(.avatar) > \(.name).png"]'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 10209    0 10209    0     0  22686      0 --:--:-- --:--:-- --:--:-- 22686
[
  "curl -XGET https://sleepercdn.com/avatars/67206d81d03c9ee856a4e7391699a24e > jdum66.png",
  "curl -XGET https://sleepercdn.com/avatars/9a770500edb4af86802a0899cb6d3e95 > Mitsuo.png",
  "curl -XGET https://sleepercdn.com/avatars/1758aab8f33313832941200a7608c34f > ianvernon92.png",
  "curl -XGET https://sleepercdn.com/avatars/b987f66667023baafadeb2051a35b7c1 > bmmeier.png",
  "curl -XGET https://sleepercdn.com/avatars/0f12917f97d79290f39112f3726e943f > ClutchJeans.png",
  "curl -XGET https://sleepercdn.com/avatars/9cf0ba07b858634478ff0edec78d0412 > nothisispatrick.png",
  "curl -XGET https://sleepercdn.com/avatars/507cfca05e99f10f08d123d57075ac68 > djlopez75.png",
  "curl -XGET https://sleepercdn.com/avatars/4ba072e6248388d12d79bfee723b9155 > hkailahi.png",
  "curl -XGET https://sleepercdn.com/avatars/aebe47e302e42a4847b5c66d57f320af > dangerbunny.png",
  "curl -XGET https://sleepercdn.com/avatars/742a9945bbbe992e56db3884006cd326 > HuntsGhost.png"
]
Henelis-MacBook-Pro:tiermaker hkailahi$ cd output/
Henelis-MacBook-Pro:output hkailahi$ curl -XGET https://sleepercdn.com/avatars/67206d81d03c9ee856a4e7391699a24e > jdum66.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 52568  100 52568    0     0  65627      0 --:--:-- --:--:-- --:--:-- 65546
Henelis-MacBook-Pro:output hkailahi$ curl -XGET https://sleepercdn.com/avatars/9a770500edb4af86802a0899cb6d3e95 > Mitsuo.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  921k  100  921k    0     0  1036k      0 --:--:-- --:--:-- --:--:-- 1034k
....
```
4. Go to https://tiermaker.com/create/ and make a tier list with the downloaded avatar images

