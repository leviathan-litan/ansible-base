@echo off

echo ""
echo "====================================================="
echo "[Ansible Client] / 操作系统配置 / Microsoft Windows"
echo "====================================================="

echo ""
echo "--- 1. [winrm]服务 / 启动"
winrm quickconfig -q

echo ""
echo "--- 2. [winrm]服务 / 查看配置信息 / All"
winrm get winrm/config

echo ""
echo "--- 3. [winrm]服务 / 查看配置信息 / client"
winrm get winrm/config/client

echo ""
echo "--- 4. [winrm]服务 / 查看配置信息 / service"
winrm get winrm/config/service

echo ""
echo "--- 5. [winrm]服务 / 配置 / client"
winrm set winrm/config/client @{AllowUnencrypted="true"}
winrm set winrm/config/client @{TurstedHosts="*"}
winrm set winrm/config/client/auth @{Basic="true"}

echo ""
echo "--- 6. [winrm]服务 / 配置 / service"
winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/service/auth @{Basic="true"}

echo ""
echo "====================================================="
echo "Finished：脚本运行完成"
echo "====================================================="
