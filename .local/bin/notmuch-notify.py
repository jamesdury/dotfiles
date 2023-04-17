#!/usr/bin/env python3
# Used the following for reference : https://gist.github.com/Nervengift/3262222875840d761f06784d9f8ba55e

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
