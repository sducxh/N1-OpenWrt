#!/bin/bash

# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile
# Modify default IP
sed -i 's/192.168.1.1/192.168.0.2/g' package/base-files/files/bin/config_generate

# Remove packages
rm -rf ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/packages/net/haproxy
rm -rf ./feeds/packages/net/v2ray-geodata
rm -rf ./package/feeds/luci/luci-app-passwall
rm -rf ./package/feeds/packages/haproxy
rm -rf ./package/feeds/packages/v2ray-geodata

# Add packages
svn co https://github.com/ophub/luci-app-amlogic/trunk package/amlogic
svn co https://github.com/sbwml/v2ray-geodata/trunk package/geodata

svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2