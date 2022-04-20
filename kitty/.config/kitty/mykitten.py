from typing import List, Optional
from kitty.boss import Boss
import subprocess
import sys
sys.path.insert(0, '/usr/local/lib/python3.9/site-packages/')
from pyfzf.pyfzf import FzfPrompt

def main(args: List[str]) -> Optional[str]:
    fzf = FzfPrompt('/Users/varal7/.fzf/bin/fzf')
    answer = fzf.prompt(["CSAIL", "MIT"])
    if len(answer) > 0:
        return answer[0]
    return None

def handle_result(args: List[str], answer: Optional[str], target_window_id: int, boss: Boss) -> None:
    if answer is None:
        return

    args = ["security", "find-generic-password", "-l", answer, "-w"]

    password = subprocess.run(args, capture_output=True, text=True, check=True).stdout
    w = boss.window_id_map.get(target_window_id)

    if w is not None:
        w.paste(password)
