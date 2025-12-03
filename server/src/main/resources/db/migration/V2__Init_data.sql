--
-- Sample users
--
INSERT INTO [users] ([name], [email], [password_hash], [created_at])
VALUES
    (N'Jan Kowalski', 'jan.kowalski@poczta.pl', '123123aa', '2025-01-02T09:15:00+01:00'),
    (N'Anna Nowak', 'anna.nowak@firma.com', '123123aa', '2025-01-03T14:30:00+01:00'),
    (N'Piotr Wiśniewski', 'piotr.wisniewski@web.pl', '123123aa', '2025-01-05T10:45:00+01:00'),
    (N'Katarzyna Wójcik', 'kasia.wojcik@domena.pl', '123123aa', '2025-01-08T18:20:00+01:00'),
    (N'Tomasz Kamiński', 'tomek.kaminski@serwer.pl', '123123aa', '2025-01-12T11:05:00+01:00'),
    (N'Małgorzata Lewandowska', 'm.lewandowska@biuro.pl', '123123aa', '2025-01-15T16:50:00+01:00'),
    (N'Michał Zieliński', 'michal.zielinski@tech.pl', '123123aa', '2025-01-18T08:10:00+01:00'),
    (N'Agnieszka Szymańska', 'aga.szymanska@poczta.fm', '123123aa', '2025-01-20T20:30:00+01:00');
GO

--
-- Sample passengers
--
INSERT INTO [passengers] ([user_id], [first_name], [last_name], [date_of_birth], [passport_number])
VALUES
    (1, N'Jan', N'Kowalski', '1985-05-15', 'JK123456'),
    (1, N'Ewa', N'Kowalska', '1987-08-20', 'EK654321'),
    (2, N'Anna', N'Nowak', '1990-03-12', 'AN987654'),
    (4, N'Katarzyna', N'Wójcik', '1992-11-05', 'KW112233'),
    (4, N'Marek', N'Jankowski', '1990-02-14', 'MJ332211'),
    (5, N'Tomasz', N'Kamiński', '1978-07-30', 'TK445566'),
    (7, N'Michał', N'Zieliński', '1983-09-19', 'MZ778899'),
    (7, N'Jan', N'Zieliński', '2015-06-01', 'JZ000111'),
    (8, N'Agnieszka', N'Szymańska', '1995-12-24', 'AS554433');
GO

--
-- Sample airports
--
INSERT INTO [airports] ([code], [name], [country], [city])
VALUES
    ('WAW', N'Lotnisko Chopina w Warszawie', N'Polska', N'Warszawa'),
    ('KRK', N'Międzynarodowy Port Lotniczy im. Jana Pawła II', N'Polska', N'Kraków'),
    ('GDN', N'Port Lotniczy Gdańsk im. Lecha Wałęsy', N'Polska', N'Gdańsk'),
    ('WRO', N'Port Lotniczy Wrocław im. Mikołaja Kopernika', N'Polska', N'Wrocław'),
    ('LHR', N'Port lotniczy Londyn-Heathrow', N'Wielka Brytania', N'Londyn'),
    ('FRA', N'Port lotniczy Frankfurt', N'Niemcy', N'Frankfurt nad Menem'),
    ('CDG', N'Port lotniczy Paryż-Charles de Gaulle', N'Francja', N'Paryż'),
    ('AMS', N'Port lotniczy Amsterdam-Schiphol', N'Holandia', N'Amsterdam'),
    ('FCO', N'Port lotniczy Rzym-Fiumicino', N'Włochy', N'Rzym'),
    ('JFK', N'Port lotniczy Johna F. Kennedy’ego', N'Stany Zjednoczone', N'Nowy Jork'),
    ('ORD', N'Port lotniczy Chicago-O''Hare', N'Stany Zjednoczone', N'Chicago'),
    ('LAX', N'Port lotniczy Los Angeles', N'Stany Zjednoczone', N'Los Angeles'),
    ('DXB', N'Port lotniczy Dubaj', N'Zjednoczone Emiraty Arabskie', N'Dubaj'),
    ('NRT', N'Port lotniczy Narita', N'Japonia', N'Tokio'),
    ('SIN', N'Port lotniczy Singapur-Changi', N'Singapur', N'Singapur');
GO

--
-- Sample terminals
--
INSERT INTO [terminals] ([airport_id], [code])
SELECT a.[id], t.[terminal_code]
FROM [airports] a
    JOIN (VALUES
        ('WAW', N'Terminal A'),
        ('KRK', N'Terminal Pasażerski'),
        ('GDN', N'T2'),
        ('WRO', N'Terminal T1'),
        ('LHR', N'Terminal 2'),
        ('LHR', N'Terminal 3'),
        ('LHR', N'Terminal 5'),
        ('FRA', N'Terminal 1'),
        ('FRA', N'Terminal 2'),
        ('CDG', N'Terminal 1'),
        ('CDG', N'Terminal 2E'),
        ('CDG', N'Terminal 3'),
        ('AMS', N'Schiphol Main'),
        ('FCO', N'Terminal 1'),
        ('FCO', N'Terminal 3'),
        ('JFK', N'Terminal 1'),
        ('JFK', N'Terminal 4'),
        ('JFK', N'Terminal 5'),
        ('ORD', N'Terminal 1'),
        ('ORD', N'Terminal 3'),
        ('ORD', N'Terminal 5'),
        ('LAX', N'TBIT'),
        ('LAX', N'Terminal 4'),
        ('LAX', N'Terminal 7'),
        ('DXB', N'Terminal 1'),
        ('DXB', N'Terminal 3'),
        ('NRT', N'Terminal 1'),
        ('NRT', N'Terminal 2'),
        ('SIN', N'Terminal 1'),
        ('SIN', N'Terminal 2'),
        ('SIN', N'Terminal 3')
) AS t([airport_code], [terminal_code])
    ON a.[code] = t.[airport_code];
GO

--
-- Generowanie bramek (Gates) - po 5 dla każdego terminala
--
INSERT INTO [gates] ([terminal_id], [name])
SELECT
    t.[id],
    N'Bramka ' + CAST(n.number AS nvarchar(10))
FROM [terminals] t
    CROSS JOIN (VALUES (1), (2), (3), (4), (5)) AS n(number);
GO



--
-- Sample airlines
--
INSERT INTO [airlines] ([name], [code])
VALUES
    (N'Polskie Linie Lotnicze LOT', 'LO'),
    (N'Lufthansa', 'LH'),            -- Hub: Frankfurt (FRA)
    (N'British Airways', 'BA'),      -- Hub: Londyn (LHR)
    (N'Air France', 'AF'),           -- Hub: Paryż (CDG)
    (N'KLM Royal Dutch Airlines', 'KL'), -- Hub: Amsterdam (AMS)
    (N'Ryanair', 'FR'),
    (N'Wizz Air', 'W6'),
    (N'Emirates', 'EK'),             -- Hub: Dubaj (DXB)
    (N'Singapore Airlines', 'SQ'),   -- Hub: Singapur (SIN)
    (N'Delta Air Lines', 'DL'),      -- Hub: JFK, LAX
    (N'United Airlines', 'UA'),      -- Hub: Chicago (ORD)
    (N'American Airlines', 'AA');    -- Hub: Chicago (ORD), LAX
GO

--
-- Sample planes
--
INSERT INTO [planes] ([airline_id], [model_name], [tail_number])
SELECT a.[id], p.[model], p.[tail]
FROM [airlines] a
    JOIN (VALUES
        ('LO', 'Boeing 787-9 Dreamliner', 'SP-LSC'),
        ('LO', 'Boeing 787-8 Dreamliner', 'SP-LRH'),
        ('LO', 'Boeing 737 MAX 8', 'SP-LVD'),
        ('LO', 'Embraer E195', 'SP-LND'),
        ('LO', 'Embraer E190', 'SP-LMA'),
        ('LH', 'Boeing 747-8', 'D-ABYA'),
        ('LH', 'Airbus A320neo', 'D-AINZ'),
        ('BA', 'Boeing 777-200', 'G-VIIA'),
        ('AF', 'Airbus A350-900', 'F-HTYA'),
        ('KL', 'Boeing 777-300ER', 'PH-BVA'),
        ('FR', 'Boeing 737-800', 'SP-RSQ'),
        ('FR', 'Boeing 737-8200 MAX', 'SP-RZA'),
        ('W6', 'Airbus A321neo', 'HA-LVC'),
        ('W6', 'Airbus A320', 'HA-LPJ'),
        ('EK', 'Airbus A380-800', 'A6-EEO'),
        ('EK', 'Boeing 777-300ER', 'A6-EGV'),
        ('SQ', 'Airbus A350-900ULR', '9V-SGB'),
        ('DL', 'Boeing 767-300', 'N123DL'),
        ('UA', 'Boeing 787-10 Dreamliner', 'N14011'),
        ('AA', 'Boeing 777-300ER', 'N717AN')
) AS p([airline_code], [model], [tail])
    ON a.[code] = p.[airline_code];
GO

INSERT INTO [plane_features] ([plane_id], [feature_name])
SELECT p.[id], f.[name]
FROM [planes] p
    CROSS JOIN (VALUES
        (N'Toaleta'),
        (N'Klimatyzacja')
) AS f([name]) WHERE NOT EXISTS (
    SELECT 1 FROM [plane_features] pf WHERE pf.plane_id = p.id AND pf.feature_name = f.name
);
GO
-- Gniazdka USB
INSERT INTO [plane_features] ([plane_id], [feature_name])
SELECT p.[id], N'Gniazdka USB'
FROM [planes] p
WHERE (p.model_name LIKE '%MAX%'
    OR p.model_name LIKE '%neo%'
    OR p.model_name LIKE '%787%'
    OR p.model_name LIKE '%A350%'
    OR p.model_name LIKE '%E195%'
    OR p.model_name LIKE '%E190%'
    OR p.model_name LIKE '%777%'
    OR p.model_name LIKE '%747%')
AND NOT EXISTS (SELECT 1 FROM [plane_features] pf WHERE pf.plane_id = p.id AND pf.feature_name = N'Gniazdka USB');
GO
-- TV, Wi-Fi i Posiłki
INSERT INTO [plane_features] ([plane_id], [feature_name])
SELECT p.[id], feat.[name]
FROM [planes] p
    CROSS JOIN (VALUES
        (N'System Rozrywki (TV)'),
        (N'Wi-Fi'),
        (N'Ciepłe posiłki w cenie')
) AS feat([name])
WHERE (p.model_name LIKE '%787%'
    OR p.model_name LIKE '%777%'
    OR p.model_name LIKE '%747%'
    OR p.model_name LIKE '%767%'
    OR p.model_name LIKE '%A380%'
    OR p.model_name LIKE '%A350%')
AND NOT EXISTS (SELECT 1 FROM [plane_features] pf WHERE pf.plane_id = p.id AND pf.feature_name = feat.name);
GO
-- Płatny barek
INSERT INTO [plane_features] ([plane_id], [feature_name])
SELECT p.[id], N'Płatny barek i sklep'
FROM [planes] p
WHERE p.airline_id IN (SELECT id FROM airlines WHERE code IN ('FR', 'W6'))
AND NOT EXISTS (SELECT 1 FROM [plane_features] pf WHERE pf.plane_id = p.id AND pf.feature_name = N'Płatny barek i sklep');
GO

--
-- Generator Siedzeń (Seats Generator)
--
WITH
    Numbers AS (
        SELECT TOP 60 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
        FROM sys.all_objects -- systemowa tabela, która zawsze ma dużo wierszy, używamy jej jako licznika
    ),
    Letters AS (
        SELECT * FROM (VALUES ('A'),('B'),('C'),('D'),('E'),('F'),('G'),('H'),('J'),('K')) AS L(let)
    )

INSERT INTO [seats] ([plane_id], [number], [type])
SELECT
    p.id,
    CAST(n.n AS varchar(10)) + l.let, -- Tworzy numer np. "1A", "12F"
    CASE
        WHEN n.n <= 4 THEN 'Business' -- Pierwsze 4 rzędy to Biznes
        ELSE 'Economy'                -- Reszta to Ekonomiczna
        END
FROM [planes] p
         CROSS JOIN Numbers n
         CROSS JOIN Letters l
WHERE
   -- LOGIKA DLA MAŁYCH SAMOLOTÓW (Embraer)
    (p.model_name LIKE '%Embraer%'
        AND n.n <= 20              -- max 20 rzędów
        AND l.let IN ('A','B','C','D')) -- tylko 4 fotele w rzędzie

   OR

   -- LOGIKA DLA ŚREDNICH SAMOLOTÓW (B737, A320, A321)
    ((p.model_name LIKE '%737%' OR p.model_name LIKE '%A320%' OR p.model_name LIKE '%A321%')
        AND n.n <= 30              -- max 30 rzędów
        AND l.let IN ('A','B','C','D','E','F')) -- 6 foteli w rzędzie

   OR

   -- LOGIKA DLA DUŻYCH SAMOLOTÓW (Dreamliner, 747, 777, A380, A350)
    ((p.model_name LIKE '%787%' OR p.model_name LIKE '%777%' OR p.model_name LIKE '%747%' OR p.model_name LIKE '%767%' OR p.model_name LIKE '%A380%' OR p.model_name LIKE '%A350%')
        AND n.n <= 50              -- max 50 rzędów
        AND l.let IN ('A','B','C','D','E','F','G','H','J','K')); -- 10 foteli w rzędzie (pomijamy I)
GO



-- ==========================================
-- KROK 1: Wstawianie lotów (Start: 05.12.2025 19:00)
-- ==========================================

INSERT INTO [flights]
([airline_id], [plane_id], [departure_airport_id], [arrival_airport_id], [departure_gate_id], [arrival_gate_id], [number], [departure], [arrival])
SELECT
    al.id, pl.id, dep.id, arr.id, dep_g.id, arr_g.id, f.num, f.dep_t, f.arr_t
FROM
    (VALUES
         -- == GRUPA 0: PIERWSZE LOTY DOLOTOWE (FEEDERY) - START 19:00 ==

         -- 1. LOT: Gdańsk (GDN) -> Warszawa (WAW) | START SIATKI
         -- Idealny dolot na wieczorny wylot do USA
         ('LO', 'SP-LVD', 'GDN', 'WAW', 'LO 3836', '2025-12-05 19:00:00 +01:00', '2025-12-05 20:00:00 +01:00'),

         -- 2. LOT: Kraków (KRK) -> Warszawa (WAW)
         ('LO', 'SP-LND', 'KRK', 'WAW', 'LO 3904', '2025-12-05 19:30:00 +01:00', '2025-12-05 20:25:00 +01:00'),


         -- == GRUPA 1: GŁÓWNE LOTY MIĘDZYKONTYNENTALNE (Wyloty po 22:00 tego samego dnia lub później) ==

         -- 3. LOT: Warszawa (WAW) -> Nowy Jork (JFK) | Dreamliner
         -- Wylot 22:45, pasażerowie z Gdańska (przylot 20:00) mają 2h 45min na przesiadkę.
         ('LO', 'SP-LSC', 'WAW', 'JFK', 'LO 26', '2025-12-05 22:45:00 +01:00', '2025-12-06 02:15:00 -05:00'),

         -- 4. Emirates: Dubaj (DXB) -> Singapur (SIN)
         ('EK', 'A6-EEO', 'DXB', 'SIN', 'EK 354', '2025-12-07 03:15:00 +04:00', '2025-12-07 15:00:00 +08:00'),

         -- 5. Lufthansa: Frankfurt (FRA) -> Chicago (ORD)
         ('LH', 'D-ABYA', 'FRA', 'ORD', 'LH 430', '2025-12-08 10:45:00 +01:00', '2025-12-08 13:10:00 -05:00'),

         -- 6. British Airways: Londyn (LHR) -> Los Angeles (LAX)
         ('BA', 'G-VIIA', 'LHR', 'LAX', 'BA 269', '2025-12-10 16:15:00 +00:00', '2025-12-10 19:25:00 -08:00'), -- Zima: UK +0, LA -8

         -- 7. Singapore Airlines: Singapur (SIN) -> Narita (NRT)
         ('SQ', '9V-SGB', 'SIN', 'NRT', 'SQ 638', '2025-12-07 23:55:00 +08:00', '2025-12-08 08:00:00 +09:00'),


         -- == GRUPA 2: INNE LOTY DOLOTOWE (Dla przesiadek w późniejszych dniach) ==

         -- 8. British Airways: Warszawa (WAW) -> Londyn (LHR) -> (Na BA 269 do LAX)
         ('BA', 'G-VIIA', 'WAW', 'LHR', 'BA 847', '2025-12-10 12:00:00 +01:00', '2025-12-10 13:40:00 +00:00'),

         -- 9. Emirates: Warszawa (WAW) -> Dubaj (DXB) -> (Na EK 354 do SIN)
         ('EK', 'A6-EGV', 'WAW', 'DXB', 'EK 180', '2025-12-06 15:00:00 +01:00', '2025-12-06 23:45:00 +04:00'),


         -- == GRUPA 3: EUROPEJSKIE POINT-TO-POINT (Środek tygodnia) ==

         -- 10. Ryanair: Kraków (KRK) -> Londyn (LHR)
         ('FR', 'SP-RSQ', 'KRK', 'LHR', 'FR 2451', '2025-12-06 06:00:00 +01:00', '2025-12-06 07:35:00 +00:00'),

         -- 11. Wizz Air: Gdańsk (GDN) -> Rzym (FCO)
         ('W6', 'HA-LVC', 'GDN', 'FCO', 'W6 1651', '2025-12-07 18:00:00 +01:00', '2025-12-07 20:30:00 +01:00'),

         -- 12. Air France: Warszawa (WAW) -> Paryż (CDG)
         ('AF', 'F-HTYA', 'WAW', 'CDG', 'AF 1247', '2025-12-09 07:00:00 +01:00', '2025-12-09 09:20:00 +01:00'),

         -- 13. KLM: Amsterdam (AMS) -> Kraków (KRK)
         ('KL', 'PH-BVA', 'AMS', 'KRK', 'KL 1995', '2025-12-11 14:00:00 +01:00', '2025-12-11 15:55:00 +01:00'),

         -- 14. Lufthansa: Rzym (FCO) -> Frankfurt (FRA) (Dolot na LH 430)
         ('LH', 'D-AINZ', 'FCO', 'FRA', 'LH 233', '2025-12-08 07:00:00 +01:00', '2025-12-08 09:00:00 +01:00'),


         -- == GRUPA 4: LOTY KRAJOWE (Powroty / Biznes) ==

         ('LO', 'SP-LMA', 'WAW', 'WRO', 'LO 3855', '2025-12-12 16:30:00 +01:00', '2025-12-12 17:25:00 +01:00'),
         ('LO', 'SP-LMA', 'WRO', 'WAW', 'LO 3856', '2025-12-12 18:05:00 +01:00', '2025-12-12 19:00:00 +01:00'),
         ('FR', 'SP-RZA', 'GDN', 'KRK', 'FR 6722', '2025-12-13 20:00:00 +01:00', '2025-12-13 21:10:00 +01:00'),


         -- == GRUPA 5: USA DOMESTIC (Święta Bożego Narodzenia - późniejszy termin) ==

         ('UA', 'N14011', 'JFK', 'LAX', 'UA 567', '2025-12-20 08:00:00 -05:00', '2025-12-20 11:30:00 -08:00'),
         ('DL', 'N123DL', 'LAX', 'JFK', 'DL 421', '2025-12-20 14:00:00 -08:00', '2025-12-20 22:30:00 -05:00'),
         ('AA', 'N717AN', 'ORD', 'LAX', 'AA 112', '2025-12-21 09:00:00 -06:00', '2025-12-21 11:30:00 -08:00') -- Chicago CST -6

    ) AS f(airline, plane, dep_code, arr_code, num, dep_t, arr_t)

        JOIN airlines al ON al.code = f.airline
        JOIN planes pl ON pl.tail_number = f.plane
        JOIN airports dep ON dep.code = f.dep_code
        JOIN airports arr ON arr.code = f.arr_code
        OUTER APPLY (SELECT TOP 1 g.id FROM gates g JOIN terminals t ON g.terminal_id = t.id WHERE t.airport_id = dep.id) dep_g
        OUTER APPLY (SELECT TOP 1 g.id FROM gates g JOIN terminals t ON g.terminal_id = t.id WHERE t.airport_id = arr.id) arr_g;
GO


-- ==========================================
-- KROK 2: Ustawianie przesiadek (Connecting Flights)
-- ==========================================

-- 1. Gdańsk -> Warszawa -> Nowy Jork (NOWA GŁÓWNA TRASA)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO 26')
WHERE number = 'LO 3836';

-- 2. Kraków -> Warszawa -> Nowy Jork
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO 26')
WHERE number = 'LO 3904';

-- 3. Warszawa -> Londyn -> Los Angeles
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'BA 269')
WHERE number = 'BA 847';

-- 4. Warszawa -> Dubaj -> Singapur
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'EK 354')
WHERE number = 'EK 180';

-- 5. Rzym -> Frankfurt -> Chicago
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LH 430')
WHERE number = 'LH 233';

-- 6. Dubaj -> Singapur -> Tokio
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'SQ 638')
WHERE number = 'EK 354';

GO