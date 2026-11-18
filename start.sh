#!/bin/bash

python update.py
sed -i 's/quote=True,//g; s/disable_web_page_preview=True,//g; s/disable_content_type_detection=True,//g' bot/helper/telegram_helper/message_utils.py bot/helper/mirror_leech_utils/upload_utils/telegram_uploader.py
find bot/ -type f -name "*.py" -exec sed -i 's/update\.is_topic_message/getattr(update, "topic_message", False)/g' {} +
exec python -m bot
