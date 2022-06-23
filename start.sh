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
echo "Setting $SCRIPT to run at cron schedule: $CRON_SCHEDULE"
echo "$CRON_SCHEDULE $SCRIPT" >> /var/spool/cron/crontabs/root
crond -l 2 -f

