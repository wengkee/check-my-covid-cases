CONTENT=$(exec /check-cases.sh)

# https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks
# https://stackoverflow.com/questions/62227905/using-curl-in-the-cmd-to-send-a-discord-webhook

curl -i -H "Accept: application/json" -H "Content-Type:application/json" \
-X POST --data "{\"content\": \"$CONTENT\"}" \
${URL}