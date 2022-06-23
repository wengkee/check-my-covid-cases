CONTENT=$(exec /check-cases.sh)

curl -X POST \
-H 'Content-type: application/json' \
--data "{\"text\":\"$CONTENT\"}" \
${URL}