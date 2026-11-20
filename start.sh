#!/bin/bash

export PYTHONMALLOC=malloc
export MALLOC_TRIM_THRESHOLD_=65536

python update.py
sed -i 's/self\.user_transmission = False/pass/g' bot/helper/common.py
sed -i 's/self\.split_size = 2097152000/self.split_size = 4190000000/g' bot/helper/common.py
exec python -m bot
