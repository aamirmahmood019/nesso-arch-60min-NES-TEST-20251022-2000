
curl -X POST http://localhost:4010/tickets \
-H "Authorization: Bearer test-token"
-H "content-type: application/json"
-H "Idempotency-kay: abc123"
-d '{"subject":"Login issue","description":"access denied"}'

curl -X GET http://localhost:4010/tickets/abc123\
-H "Authorization: Bearer test-token"

curl -X GET http://localhost:4010//ticketsabc123/messages \
-H "Authorization: Bearer test-token"

curl -X POST http://localhost:4010/tickets/abc123/attachments \
-H "Authorization: Bearer test-token"
-F "file=image.png"