CREATE TABLE [users] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [name] nvarchar(255) NOT NULL,
    [email] nvarchar(255) UNIQUE NOT NULL,
    [password_hash] nvarchar(255) NOT NULL,
    [created_at] datetimeoffset NOT NULL
)
GO

CREATE TABLE [airlines] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [name] nvarchar(255) NOT NULL,
    [code] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [airports] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [code] nvarchar(3) UNIQUE NOT NULL,
    [name] nvarchar(255) NOT NULL,
    [country] nvarchar(255) NOT NULL,
    [city] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [terminals] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [airport_id] integer NOT NULL,
    [code] nvarchar(64) NOT NULL
)
GO

CREATE TABLE [gates] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [terminal_id] integer NOT NULL,
    [name] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [planes] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [airline_id] integer NOT NULL,
    [model_name] nvarchar(255) NOT NULL,
    [tail_number] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [seats] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [plane_id] integer NOT NULL,
    [number] nvarchar(255) NOT NULL,
    [type] nvarchar(255)
)
GO

CREATE TABLE [flights] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [airline_id] integer NOT NULL,
    [plane_id] integer NOT NULL,

    [departure_airport_id] integer NOT NULL,
    [arrival_airport_id] integer NOT NULL,
    [departure_gate_id] integer,
    [arrival_gate_id] integer,

    [number] nvarchar(255) NOT NULL,
    [departure] datetimeoffset NOT NULL,
    [arrival] datetimeoffset NOT NULL,
    [connecting_flight_id] integer
)
GO

CREATE TABLE [passengers] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [user_id] integer NOT NULL,
    [first_name] nvarchar(255) NOT NULL,
    [last_name] nvarchar(255) NOT NULL,
    [date_of_birth] date NOT NULL,
    [passport_number] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [tickets] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [flight_id] integer NOT NULL,
    [passenger_id] integer NOT NULL,
    [seat_id] integer NOT NULL,
    [code] nvarchar(255) UNIQUE NOT NULL,
    [booked_at] datetimeoffset
)
GO

CREATE TABLE [baggage] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [ticket_id] integer NOT NULL,
    [tag] nvarchar(255) UNIQUE NOT NULL,
    [weight] decimal(5, 2) NOT NULL,
    [baggage_type] nvarchar(64) NOT NULL,
)
GO

CREATE TABLE [baggage_standard] (
    [baggage_id] integer PRIMARY KEY NOT NULL,
    [dimensions_cm] nvarchar(64) NOT NULL
)
GO

CREATE TABLE [baggage_insured] (
    [baggage_id] integer PRIMARY KEY NOT NULL,
    [insurance_amount] decimal(10, 2) NOT NULL,
    [policy_number] nvarchar(100)
)

CREATE TABLE [baggage_special] (
    [baggage_id] integer PRIMARY KEY NOT NULL,
    [category] nvarchar(64) NOT NULL,
    [handling_instructions] nvarchar(500),
    [is_fragile] bit DEFAULT 0
)
GO

CREATE TABLE [plane_features] (
    [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
    [plane_id] integer NOT NULL,
    [feature_name] nvarchar(64) NOT NULL
)
GO

ALTER TABLE [plane_features] ADD CONSTRAINT [fk_plane_features_plane_id]
    FOREIGN KEY ([plane_id]) REFERENCES [planes] ([id])
        ON DELETE CASCADE
GO


CREATE UNIQUE INDEX [idx_uq_seats_plane_number] ON [seats] ("plane_id", "number")
GO

CREATE UNIQUE INDEX [idx_uq_terminals_airport_code] ON [terminals] ("airport_id", "code")
GO

CREATE UNIQUE INDEX [idx_uq_gates_terminal_name] ON [gates] ("terminal_id", "name")
GO



ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_airline_id_airlines] FOREIGN KEY ([airline_id]) REFERENCES [airlines] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_plane_id_planes] FOREIGN KEY ([plane_id]) REFERENCES [planes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_connecting_flight_id_flights] FOREIGN KEY ([connecting_flight_id]) REFERENCES [flights] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_departure_airport_id_airports] FOREIGN KEY ([departure_airport_id]) REFERENCES [airports] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_arrival_airport_id_airports] FOREIGN KEY ([arrival_airport_id]) REFERENCES [airports] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_departure_gate_id_gates] FOREIGN KEY ([departure_gate_id]) REFERENCES [gates] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [flights] ADD CONSTRAINT [fk_flights_arrival_gate_id_gates] FOREIGN KEY ([arrival_gate_id]) REFERENCES [gates] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [tickets] ADD CONSTRAINT [fk_tickets_flight_id_flights] FOREIGN KEY ([flight_id]) REFERENCES [flights] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [tickets] ADD CONSTRAINT [fk_tickets_passenger_id_passengers] FOREIGN KEY ([passenger_id]) REFERENCES [passengers] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [tickets] ADD CONSTRAINT [fk_tickets_seat_id_seats] FOREIGN KEY ([seat_id]) REFERENCES [seats] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [passengers] ADD CONSTRAINT [fk_passengers_user_id_users] FOREIGN KEY ([user_id]) REFERENCES [users] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [planes] ADD CONSTRAINT [fk_planes_airline_id_airlines] FOREIGN KEY ([airline_id]) REFERENCES [airlines] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [seats] ADD CONSTRAINT [fk_seats_plane_id_planes] FOREIGN KEY ([plane_id]) REFERENCES [planes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [baggage] ADD CONSTRAINT [fk_baggage_ticket_id_tickets] FOREIGN KEY ([ticket_id]) REFERENCES [tickets] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [baggage_standard] ADD CONSTRAINT [fk_baggage_standard_baggage]
    FOREIGN KEY ([baggage_id]) REFERENCES [baggage] ([id])
        ON DELETE CASCADE
GO
ALTER TABLE [baggage_insured] ADD CONSTRAINT [fk_baggage_insured_baggage]
    FOREIGN KEY ([baggage_id]) REFERENCES [baggage] ([id])
        ON DELETE CASCADE
GO
ALTER TABLE [baggage_special] ADD CONSTRAINT [fk_baggage_special_baggage]
    FOREIGN KEY ([baggage_id]) REFERENCES [baggage] ([id])
        ON DELETE CASCADE
GO

ALTER TABLE [terminals] ADD CONSTRAINT [fk_terminals_airport_id_airports] FOREIGN KEY ([airport_id]) REFERENCES [airports] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [gates] ADD CONSTRAINT [fk_gates_terminal_id_terminals] FOREIGN KEY ([terminal_id]) REFERENCES [terminals] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO