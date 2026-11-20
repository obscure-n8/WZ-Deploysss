#!/bin/bash

export PYTHONMALLOC=malloc
export MALLOC_TRIM_THRESHOLD_=65536

python update.py
find bot/ -type f -name "*.py" -exec sed -i 's/quote=True,//g; s/disable_web_page_preview=True,//g; s/disable_content_type_detection=True,//g' {} +
find bot/ -type f -name "*.py" -exec sed -i 's/\.is_topic_message/.topic_message/g' {} +
sed -i 's/WAIT_TIMEOUT = 15/WAIT_TIMEOUT = 60/g' /wzvenv/lib/python*/site-packages/pyrogram/session/session.py
sed -i 's/self\.user_transmission = False/pass/g' bot/helper/common.py
sed -i 's/self\.split_size = 2097152000/self.split_size = 4190000000/g' bot/helper/common.py
exec python -m bot
