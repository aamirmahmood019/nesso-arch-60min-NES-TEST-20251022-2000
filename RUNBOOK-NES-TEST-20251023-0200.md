# Runook: Nessovo Ticket Plateform

# 1. Service Overview
	A platform for creating Tickets, messaging, and attachments.
	User Authenticated via OIDC, and notifications via external service.

# 2. Common Prolems
	>>	Ticket not created
		- Check Idempotency key
		- Check logs with traceId
		- Retry with new Idempotency key
		
	>> 	Authentication failure
		- Validate OIDC token
		- Check token expiry
		- Check the logs with '401' and traceId
		
	>>  Notification not sent
		- Check the status of downstream service
		- Check the logs with traceId
		- Use retry 
		
# 3. Debugging the Issues
		- Use traceparent to correlate the logs
		- Use ticket.id for search
		- Check circuit breaker matrics
		
# 4. Recovery Actions
		- Use retry mechanism for the failed service
		- Use new Idempotency key for failed requests
		- Notify system admin for the service outage