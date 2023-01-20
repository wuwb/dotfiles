# 关闭 tm 限流
sudo sysctl debug.lowpri_throttle_enabled=0
# 开启 tm 限流
sudo sysctl debug.lowpri_throttle_enabled=1
