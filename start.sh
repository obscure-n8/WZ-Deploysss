#!/bin/bash

python update.py
find bot/ -type f -name "*.py" -exec sed -i 's/quote=True,//g; s/quote=True//g; s/disable_web_page_preview=True,//g; s/disable_web_page_preview=True//g; s/disable_content_type_detection=True,//g; s/disable_content_type_detection=True//g' {} +
find bot/ -type f -name "*.py" -exec sed -i 's/update\.is_topic_message/getattr(update, "topic_message", False)/g' {} +
exec python -m bot
