#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:13204352:4378ea447f29b740a8a79e2dc5da70bf30a6e10d; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:9935744:0c85d80876b98d7d864a2b141cd13b50db553c03 EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 4378ea447f29b740a8a79e2dc5da70bf30a6e10d 13204352 0c85d80876b98d7d864a2b141cd13b50db553c03:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
