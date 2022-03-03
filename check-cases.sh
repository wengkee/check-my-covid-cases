
ACTIVE_CASES_URL="https://raw.githubusercontent.com/MoH-Malaysia/covid19-public/main/epidemic/cases_malaysia.csv"
DEATH_CASES_URL="https://raw.githubusercontent.com/MoH-Malaysia/covid19-public/main/epidemic/deaths_malaysia.csv"

ACTIVE_CASES=$(curl -s $ACTIVE_CASES_URL | tail -1 | cut -d"," -f1,2)
ACTIVE_TODAY=$(echo $ACTIVE_CASES | cut -d"," -f1)
ACTIVE=$(echo $ACTIVE_CASES | cut -d"," -f2)

echo "##### $ACTIVE_TODAY ACTIVE CASES #####"
echo "$ACTIVE"

echo ""

DEATH_CASES=$(curl -s $DEATH_CASES_URL | tail -1 | cut -d"," -f1,2)
DEATH_TODAY=$(echo $DEATH_CASES | cut -d"," -f1)
DEATH=$(echo $DEATH_CASES | cut -d"," -f2)

echo "##### $DEATH_TODAY DEATH CASES #####"
echo "$DEATH"