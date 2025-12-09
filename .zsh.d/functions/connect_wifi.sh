connect_wifi() {
  # 引数が2つ(SSIDとパスワード)であるか確認
  if [ $# -ne 2 ]; then
    echo "Usage: connect_wifi <SSID> <PASSWORD>"
    return 1
  fi

  local ssid="$1"
  local pass="$2"

  echo "Connecting to SSID: $ssid"

  # networksetup は失敗すると "Could not find network" を返すことがある
  # それを grep で検知し、成功するまでループする
  while networksetup -setairportnetwork en0 "$ssid" "$pass" 2>&1 | grep -q "Could not find network"; do
    echo "retry..."
    # sleep は不要との指定のため入れていない
  done

  echo "connected"
}