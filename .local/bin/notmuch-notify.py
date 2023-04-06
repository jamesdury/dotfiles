#!/usr/bin/env python3

# Send notifications for all mails with the "notify" tag via notify-send
#
# This is best used in combination with afew. To notify for all new messages just add
# the following filter to your ~/.config/afew/config just before [InboxFilter]:
#
# [Filter.0]
# message = notify
# query = tag:new AND NOT tag:killed AND NOT tag:spam
# tags = +notify
#
# Then run this script after each call to afew, e.g. in you notmuch post-new hook

import datetime
from datetime import datetime

import notmuch
import subprocess

def notify(title, message):
    subprocess.Popen([
        'notify-send',
        "--app-name=notmuch-notify",
        "--icon=/usr/share/icons/Papirus/64x64@2x/apps/email.svg",
        title,
        message
    ])

# TODO and a filter preventing spam from appearing
for message in notmuch.Database(mode=notmuch.Database.MODE.READ_WRITE).create_query('tag:notify').search_messages():
    timestamp = message.get_date()
    time = datetime.utcfromtimestamp(timestamp).strftime("%H:%M")

    message.remove_tag('notify')
    notify(
            "{}".format( message.get_header('From')),
            f"<i>{time}</i> - {message.get_header('Subject')}"
    )
    del message  # python's scoping, message will survive the for loop and db will not be closed
