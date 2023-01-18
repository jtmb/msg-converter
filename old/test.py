#!/usr/bin/python
import platform
import extract_msg

# vars

print(platform.node())
print(platform.processor())
print(platform.platform())

msg = extract_msg.openMsg("app/test.msg")

