import re
import os
import vim

def get_targets(path):
    ws = []
    if not os.path.exists(path):
        return ws

    with open(path) as f:
        for line in f.readlines():
            ws += re.findall(r"^(\w+):.*", line)
    return ws

def fill_buffer_with_targets():
    l = "\n".join(get_targets("Makefile"))
    vim.command("exec 'badd makefile_buf'")
    vim.command("exec 'sb makefile_buf'")
    vim.command("exec 'setlocal buftype=nofile'")
    vim.command("let @l = '" + l + "'")
    vim.command("0put l")

def test_m1():
    assert get_targets("m1") == ["main", "test"]
    assert get_targets("m50") == []

if __name__ == '__main__':
    fill_buffer_with_targets()
