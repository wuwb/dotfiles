#!/usr/bin/env zsh

proxy() {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export all_proxy="socks5://127.0.0.1:7890"
  echo "HTTP Proxy on"
}
proxy-ss() {
  export http_proxy="socks5://127.0.0.1:1080"
  export https_proxy="socks5://127.0.0.1:1080"
  echo "ShadowSockets proxy on"
}

unproxy() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo "HTTP Proxy off"
}


