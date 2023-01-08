#!/bin/bash

#enter phone number here
USER=
#Optional: enter PATH in case you don't have signal-cli installed in the proper directory
#PATH=

touch /tmp/signal-bot-temp-file-epic

{ echo "Hello, here is your automated alert for Epic Games Free Game offer: "; echo; } >> /tmp/signal-bot-temp-file-epic
curl https://store-site-backend-static.ak.epicgames.com/freeGamesPromotions?country=IN | jq '.data.Catalog.searchStore.elements[].title' >> /tmp/signal-bot-temp-file-epic

signal-cli -a $USER send --message-from-stdin $USER < /tmp/signal-bot-temp-file-epic
rm /tmp/signal-bot-temp-file-epic
