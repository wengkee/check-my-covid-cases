#!/bin/sh

set -e

SCRIPT=""
if [[ $TYPE == 'SLACK' ]]; then
    SCRIPT='/slack.sh'
elif [[ $TYPE == 'DISCORD' ]]; then
    SCRIPT='/discord.sh'
else
    echo "No messenger type is specified, exiting.."
    exit 1
fi

if [[ "$MODE" == 'NOW' ]]; then
    echo "Instant mode.."
    echo $SCRIPT
    exec $SCRIPT $(exec /check-cases.sh)
    exit 0
fi

echo "Timezone is set to: $TZ"

# avoid double setting crons in case of docker-compose restart
CRON_FILE=/var/spool/cron/crontabs/root
if grep -q $SCRIPT $CRON_FILE; then
  echo "$SCRIPT already set in $CRON_FILE"
else
  echo "Setting $SCRIPT to run at cron schedule: $CRON_SCHEDULE"
  echo "$CRON_SCHEDULE $SCRIPT" > $CRON_FILE
fi

# setting log level to 2, default was 8
# setting crond to run at foreground
crond -l 2 -f
