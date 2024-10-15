#!/usr/bin/env python
# -*- coding: UTF-8 -*-

# ——————————————————
# 脚本说明：
# xxxxxxxxx
# ——————————————————

# ========================================
# 开始
# ))))))))) 模块包导入

import os
# import subprocess
# import sys

# import logging
# import time


# ))))))))) 类 / 方法

def print_comment(message):
    print("\n%%%%%%%%%%%%%%%%%%%%%%%%%%%% {}".format(message))

def execute_os_command(command):
    # 显示
    print("===========================================")
    print("Executing command: [{}]".format(command))

    # 执行
    print("-------------------------------------")
    exit_code = os.system(command=command)
    print("-------------------------------------")
    print("")

    # 结束阶段
    return exit_code

# ))))))))) 执行阶段

# execute_os_command("hostname")
# execute_os_command("ifconfig en6 | grep -A1 'flags'")

print_comment("[winrm] enable service")
execute_os_command("winrm quickconfig -q")

print_comment("[winrm] config client")
execute_os_command('winrm set winrm/config/client @{AllowUnencrypted="true"}')
execute_os_command('winrm set winrm/config/client @{TrustedHosts="*"}')
execute_os_command('winrm set winrm/config/client/auth @{Basic="true"}')

print_comment("[winrm] config service")
execute_os_command('winrm set winrm/config/service @{AllowUnencrypted="true"}')
execute_os_command('winrm set winrm/config/service/auth @{Basic="true"}')

print_comment("[PowerShell] config execution policy")
execute_os_command('powershell -Command "Set-Executionpolicy remotesigned"')
execute_os_command('powershell -Command "Get-Executionpolicy"')

print_comment("[microsoft windows] hostname")
execute_os_command('wmic computersystem where name="%computername%" call rename name="node1"')

# ))))))))) 结束

# ========================================
# 结束
