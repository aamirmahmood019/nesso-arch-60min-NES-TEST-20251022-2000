CREATE TABLE Ticket(
id UUID PRIMARY KEY,
subject TEXT NOT NULL,
description TEXT,
status TEXT NOT NULL DEFAULT 'open',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE TicketMessage(
id UUID PRIMARY KEY,
ticket_id UUID NOT NULL,
context TEXT NOT NULL,
sender TEXT,
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (ticket_id) REFERENCES Ticket(id));

CREATE INDEX idx_ticket_id ON TicketMessage(ticket_id);

CREATE TABLE Attachment (
id UUID PRIMARY KEY,
ticket_id UUID NOT NULL,
filename TEXT NOT NULL,
url TEXT NOT NULL
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (ticket_id) REFERENCES Ticket(id));

CREATE INDEX idx_ticket_id ON Attachment(ticket_id);




