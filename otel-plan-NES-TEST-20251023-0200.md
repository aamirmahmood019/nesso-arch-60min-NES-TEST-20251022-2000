Spans and Attributes

POST /tickets
	span: create_ticket
	Attributes: http.method, http.status_code, idempotency-key, traceId

GET /tickets/{id}
	span: get_ticket
	Attributes: ticket.id, http.status_code, traceId
	
POST /tickets/{id}/attachments
	span: upload_attachment
	Attributes: ticket.id, filename, traceId
	
Traceparent curl example
curl -X GET http://localhost:4010/tickets/abc123 \
-H "Authorization: Bearer test-token" \
-H "traceparent: 00-4bf992f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01"

Expected trace flow
> Frontend sends traceparent header
> API Gateway propagates it
> Tickets API creates spans with traceId
> Logs and matrics correlate via traceId