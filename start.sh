#!/bin/bash

export PYTHONMALLOC=malloc
export MALLOC_TRIM_THRESHOLD_=65536

python update.py
python -c '
import glob
for p in glob.glob("/wzvenv/lib/python*/site-packages/pyrogram/raw/core/tl_object.py"):
    s = open(p).read().replace("raise KeyError(constructor_id) from e", "return None")
    open(p, "w").write(s)
for p in glob.glob("/wzvenv/lib/python*/site-packages/pyrogram/client.py"):
    s = open(p).read().replace("for peer in peers:", "if not isinstance(peers, list): return\n        for peer in peers:")
    open(p, "w").write(s)
'
sed -i 's/self\.user_transmission = False/pass/g' bot/helper/common.py
sed -i 's/self\.split_size = 2097152000/self.split_size = 4190000000/g' bot/helper/common.py
exec python -m bot
