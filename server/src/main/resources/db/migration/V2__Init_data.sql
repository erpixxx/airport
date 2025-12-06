--
-- Sample users
--
SET IDENTITY_INSERT [users] ON;
INSERT INTO [users] ([id], [name], [email], [password_hash], [created_at])
VALUES
    (1, N'Jan Kowalski', 'jan.kowalski@poczta.pl', '123123aa', '2025-01-02T09:15:00+01:00'),
    (2, N'Anna Nowak', 'anna.nowak@firma.com', '123123aa', '2025-01-03T14:30:00+01:00'),
    (3, N'Piotr Wiśniewski', 'piotr.wisniewski@web.pl', '123123aa', '2025-01-05T10:45:00+01:00'),
    (4, N'Katarzyna Wójcik', 'kasia.wojcik@domena.pl', '123123aa', '2025-01-08T18:20:00+01:00'),
    (5, N'Tomasz Kamiński', 'tomek.kaminski@serwer.pl', '123123aa', '2025-01-12T11:05:00+01:00'),
    (6, N'Małgorzata Lewandowska', 'm.lewandowska@biuro.pl', '123123aa', '2025-01-15T16:50:00+01:00'),
    (7, N'Michał Zieliński', 'michal.zielinski@tech.pl', '123123aa', '2025-01-18T08:10:00+01:00'),
    (8, N'Agnieszka Szymańska', 'aga.szymanska@poczta.fm', '123123aa', '2025-01-20T20:30:00+01:00'),
    (9, N'Oskar Keczmorski', 'firemi6233@idwage.com', '123123aa', '2025-01-20T20:10:00+01:00'),
    (10, N'Kamil Steinbach', 'wqertyu@interia.com', '123123aa', '2025-03-20T10:10:00+01:00'),
    (11, N'Magdalena Wójcik', 'magda.wojcik@onet.pl', '123123aa', '2025-03-22T09:30:00+01:00'),
    (12, N'Dariusz Mazur', 'd.mazur@firma.pl', '123123aa', '2025-03-25T14:15:00+01:00'),
    (13, N'Elżbieta Kaczmarek', 'ela.kaczmarek@dom.pl', '123123aa', '2025-03-28T08:45:00+01:00'),
    (14, N'Patryk Jasiński', 'patryk.j@tech.com', '123123aa', '2025-03-31T19:20:00+02:00'),
    (15, N'Zofia Król', 'zofia.krol@szkola.edu.pl', '123123aa', '2025-04-02T11:10:00+02:00');
SET IDENTITY_INSERT [users] OFF;
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
    (8, N'Agnieszka', N'Szymańska', '1995-12-24', 'AS554433'),
    (9, N'Piotr', N'Wiśniewski', '1982-04-12', 'PW482910'),
    (10, N'Maria', N'Lewandowska', '1991-09-22', 'ML739102'),
    (10, N'Krzysztof', N'Lewandowski', '1989-01-15', 'KL284711'),
    (11, N'Julia', N'Dąbrowska', '1995-05-30', 'JD847291'),
    (12, N'Paweł', N'Kozłowski', '1975-11-08', 'PK394821'),
    (12, N'Małgorzata', N'Kozłowska', '1978-03-25', 'MK928374'),
    (12, N'Oliwier', N'Kozłowski', '2012-07-14', 'OK112233');

GO

--
-- Sample airports
--
INSERT INTO [airports] ([code], [name], [country], [city])
VALUES
    ('BZG', N'Port Lotniczy Bydgoszcz', N'Polska', N'Bydgoszcz'),
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
    (N'Lufthansa', 'LH'),
    (N'British Airways', 'BA'),
    (N'Air France', 'AF'),
    (N'KLM Royal Dutch Airlines', 'KL'),
    (N'Ryanair', 'FR'),
    (N'Wizz Air', 'W6'),
    (N'Emirates', 'EK'),
    (N'Singapore Airlines', 'SQ'),
    (N'Delta Air Lines', 'DL'),
    (N'United Airlines', 'UA'),
    (N'American Airlines', 'AA'),
    (N'Uganda Airlines', 'UR'),
    (N'Kazakhstan Airlines', 'KC'),
    (N'Kulula Airlines', 'KZ'),
    (N'Casino Express Airlines', 'CE');
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
-- Loty bezpośrednie z Bydgoszczy
-- ==========================================
INSERT INTO [flights]
([airline_id], [plane_id], [departure_airport_id], [arrival_airport_id], [departure_gate_id], [arrival_gate_id], [number], [departure], [arrival])
SELECT
    al.id, pl.id, dep.id, arr.id, dep_g.id, arr_g.id, f.num, f.dep_t, f.arr_t
FROM
    (VALUES
        ('LO', 'SP-LND', 'BZG', 'WAW', 'LO3991', '2025-12-05T06:00:00+01:00', '2025-12-05T06:50:00+01:00'),

        ('LH', 'D-AINZ', 'BZG', 'FRA', 'LH1383', '2025-12-05T10:00:00+01:00', '2025-12-05T11:45:00+01:00'),

        ('FR', 'SP-RSQ', 'BZG', 'LHR', 'FR2468', '2025-12-05T14:00:00+01:00', '2025-12-05T16:15:00+01:00'),

        ('W6', 'HA-LPJ', 'BZG', 'FCO', 'W61155', '2025-12-05T11:30:00+01:00', '2025-12-05T13:45:00+01:00'),

        ('LO', 'SP-LMA', 'BZG', 'KRK', 'LO3501', '2025-12-05T12:45:00+01:00', '2025-12-05T13:40:00+01:00'),

        ('KL', 'PH-BVA', 'BZG', 'AMS', 'KL1992', '2025-12-05T15:20:00+01:00', '2025-12-05T17:00:00+01:00'),

        ('FR', 'SP-RZA', 'BZG', 'GDN', 'FR7070', '2025-12-05T16:00:00+01:00', '2025-12-05T16:40:00+01:00'),

        ('W6', 'HA-LVC', 'BZG', 'CDG', 'W62234', '2025-12-05T17:15:00+01:00', '2025-12-05T19:25:00+01:00'),

        ('LO', 'SP-LVD', 'BZG', 'WAW', 'LO3995', '2025-12-05T18:50:00+01:00', '2025-12-05T19:40:00+01:00'),

        ('LH', 'D-AINZ', 'BZG', 'FRA', 'LH1385', '2025-12-05T19:30:00+01:00', '2025-12-05T21:15:00+01:00'),

        ('FR', 'SP-RSQ', 'BZG', 'LHR', 'FR2470', '2025-12-05T20:45:00+01:00', '2025-12-05T22:00:00+01:00'),

        ('EK', 'A6-EGV', 'BZG', 'DXB', 'EK9999', '2025-12-06T08:00:00+01:00', '2025-12-06T16:30:00+01:00'),

        ('FR', 'SP-RZA', 'BZG', 'WRO', 'FR9012', '2025-12-06T07:15:00+01:00', '2025-12-06T08:00:00+01:00'),

        ('LO', 'SP-LND', 'BZG', 'WAW', 'LO3987', '2025-12-06T10:30:00+01:00', '2025-12-06T11:20:00+01:00'),

        ('LO', 'SP-LSC', 'BZG', 'JFK', 'LO011', '2025-12-06T11:00:00+01:00', '2025-12-06T20:30:00+01:00'),

        ('BA', 'G-VIIA', 'BZG', 'LHR', 'BA850', '2025-12-06T12:00:00+01:00', '2025-12-06T14:15:00+01:00'),

        ('LO', 'SP-LRH', 'BZG', 'ORD', 'LO005', '2025-12-06T13:00:00+01:00', '2025-12-06T23:00:00+01:00'),

        ('LH', 'D-ABYA', 'BZG', 'FRA', 'LH1389', '2025-12-06T14:30:00+01:00', '2025-12-06T16:15:00+01:00'),

        ('KL', 'PH-BVA', 'BZG', 'AMS', 'KL1996', '2025-12-06T16:00:00+01:00', '2025-12-06T17:45:00+01:00'),

        ('LO', 'SP-LSC', 'BZG', 'NRT', 'LO085', '2025-12-06T17:50:00+01:00', '2025-12-07T09:00:00+01:00'),

        ('SQ', '9V-SGB', 'BZG', 'SIN', 'SQ303', '2025-12-06T20:00:00+01:00', '2025-12-07T12:00:00+01:00'),

        ('LO', 'SP-LRH', 'BZG', 'LAX', 'LO023', '2025-12-07T09:00:00+01:00', '2025-12-07T21:00:00+01:00'),

        ('LH', 'D-AINZ', 'FRA', 'FCO', 'LH240', '2025-12-05T13:30:00+01:00', '2025-12-05T15:20:00+01:00'),

        ('LO', 'SP-LVD', 'WAW', 'CDG', 'LO331', '2025-12-05T08:15:00+01:00', '2025-12-05T10:40:00+01:00'),

        ('BA', 'G-VIIA', 'LHR', 'JFK', 'BA179', '2025-12-05T18:30:00+01:00', '2025-12-06T02:00:00+01:00'),

        ('KL', 'PH-BVA', 'AMS', 'SIN', 'KL835', '2025-12-05T21:00:00+01:00', '2025-12-06T13:00:00+01:00'),

        ('LO', 'SP-LRH', 'WAW', 'LAX', 'LO024', '2025-12-06T13:00:00+01:00', '2025-12-07T01:35:00+01:00'),

        ('BA', 'G-VIIA', 'LHR', 'SIN', 'BA011', '2025-12-06T16:00:00+01:00', '2025-12-07T10:30:00+01:00'),

        ('LH', 'D-ABYA', 'FRA', 'JFK', 'LH404', '2025-12-06T17:30:00+01:00', '2025-12-06T20:20:00+01:00'),

        ('KL', 'PH-BVA', 'AMS', 'ORD', 'KL611', '2025-12-06T19:15:00+01:00', '2025-12-06T21:45:00+01:00'),

        ('LO', 'SP-LSC', 'WAW', 'NRT', 'LO079', '2025-12-05T22:50:00+01:00', '2025-12-06T18:30:00+01:00'),

        -- TRASA 1: BZG -> WAW -> SIN -> NRT
        -- Etap 1: BZG -> WAW (Start trasy)
        ('LO', 'SP-LND', 'BZG', 'WAW', 'LO4001', '2025-12-08T06:00:00+01:00', '2025-12-08T06:50:00+01:00'),
        -- Etap 2: WAW -> SIN (Środek trasy - przesiadka w WAW)
        ('LO', 'SP-LSC', 'WAW', 'SIN', 'LO099',  '2025-12-08T09:00:00+01:00', '2025-12-09T04:00:00+01:00'),
        -- Etap 3: SIN -> NRT (Koniec trasy - przesiadka w SIN)
        ('SQ', '9V-SGB', 'SIN', 'NRT', 'SQ638',  '2025-12-09T07:00:00+01:00', '2025-12-09T15:00:00+01:00'),

        -- TRASA 2: BZG -> FRA -> JFK -> LAX
        -- Etap 1: BZG -> FRA (Start trasy)
        ('LH', 'D-AINZ', 'BZG', 'FRA', 'LH9001', '2025-12-08T10:00:00+01:00', '2025-12-08T11:45:00+01:00'),
        -- Etap 2: FRA -> JFK (Środek trasy - przesiadka we FRA)
        ('LH', 'D-ABYA', 'FRA', 'JFK', 'LH400',  '2025-12-08T14:00:00+01:00', '2025-12-08T17:00:00+01:00'),
        -- Etap 3: JFK -> LAX (Koniec trasy - przesiadka w JFK)
        ('LO', 'SP-LRH', 'JFK', 'LAX', 'LO025',  '2025-12-08T20:00:00+01:00', '2025-12-08T23:30:00+01:00')
    ) AS f(airline, plane, dep_code, arr_code, num, dep_t, arr_t)
        JOIN airlines al ON al.code = f.airline
        JOIN planes pl ON pl.tail_number = f.plane
        JOIN airports dep ON dep.code = f.dep_code
        JOIN airports arr ON arr.code = f.arr_code
        OUTER APPLY (SELECT TOP 1 g.id FROM gates g JOIN terminals t ON g.terminal_id = t.id WHERE t.airport_id = dep.id) dep_g
        OUTER APPLY (SELECT TOP 1 g.id FROM gates g JOIN terminals t ON g.terminal_id = t.id WHERE t.airport_id = arr.id) arr_g;
GO

-- 1. BZG -> FRA (LH1383) łączymy z FRA -> FCO (LH240)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LH240')
WHERE number = 'LH1383';

-- 2. BZG -> WAW (LO3991) łączymy z WAW -> CDG (LO331)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO331')
WHERE number = 'LO3991';

-- 3. BZG -> LHR (FR2468) łączymy z LHR -> JFK (BA179)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'BA179')
WHERE number = 'FR2468';

-- 4. BZG -> AMS (KL1992) łączymy z AMS -> SIN (KL835)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'KL835')
WHERE number = 'KL1992';
GO

-- 5. BZG -> WAW (LO3987) łączymy z WAW -> LAX (LO024)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO024')
WHERE number = 'LO3987';

-- 6. BZG -> LHR (BA850) łączymy z LHR -> SIN (BA011)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'BA011')
WHERE number = 'BA850';

-- 7. BZG -> FRA (LH1389) łączymy z FRA -> JFK (LH404)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LH404')
WHERE number = 'LH1389';

-- 8. BZG -> AMS (KL1996) łączymy z AMS -> ORD (KL611)
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'KL611')
WHERE number = 'KL1996';

-- 9. BZG -> WAW (LO3995) łączymy z WAW -> NRT (LO079)
-- Uwaga: LO3995 był w Twoim skrypcie jako lot z dn. 05.12 o 18:50
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO079')
WHERE number = 'LO3995';
GO



-- 1. TRASA AZJATYCKA: BZG -> WAW -> SIN -> NRT
-- Krok A: Łączymy BZG->WAW z WAW->SIN
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO099')
WHERE number = 'LO4001';

-- Krok B: Łączymy WAW->SIN z SIN->NRT
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'SQ638')
WHERE number = 'LO099';


-- 2. TRASA TRANSATLANTYCKA: BZG -> FRA -> JFK -> LAX
-- Krok A: Łączymy BZG->FRA z FRA->JFK
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LH400')
WHERE number = 'LH9001';

-- Krok B: Łączymy FRA->JFK z JFK->LAX
UPDATE flights
SET connecting_flight_id = (SELECT id FROM flights WHERE number = 'LO025')
WHERE number = 'LH400';
GO



INSERT INTO [tickets] ([flight_id], [passenger_id], [seat_id], [code], [booked_at])
SELECT
    f.id,
    p.id,
    s.id,
    -- Generujemy unikalny kod biletu: TKT-[Lot]-[Miejsce]
    N'TKT-' + f.number + N'-' + s.number,
    DATEADD(day, -30, f.departure)
FROM
    (VALUES
         -- Pasażer (Paszport),  Nr Lotu,  Nr Miejsca
         ('JK123456', 'LO3991', '1A'),   -- Jan K. (Biznes do W-wy)
         ('EK654321', 'LO3991', '1B'),   -- Ewa K. (Biznes do W-wy)
         ('AN987654', 'LH1383', '5A'),   -- Anna N. (Eco do Frankfurtu)
         ('KW112233', 'FR2468', '10A'),  -- Kasia W. (Tani lot do Londynu)
         ('MJ332211', 'FR2468', '10B'),  -- Marek J. (Tani lot do Londynu)
         ('TK445566', 'W61155', '3A'),   -- Tomasz K. (Rzym)
         ('MZ778899', 'LO3501', '12C'),  -- Michał Z. (Kraków)
         ('JZ000111', 'LO3501', '12D'),  -- Jan Z. (Dziecko, Kraków)
         ('AS554433', 'KL1992', '2A'),   -- Agnieszka S. (Biznes do Amsterdamu)
         ('PW482910', 'W62234', '15F'),  -- Piotr W. (Paryż)
         ('ML739102', 'EK9999', '30A'),  -- Maria L. (Dubaj - A380/777)
         ('KL284711', 'EK9999', '30B'),  -- Krzysztof L. (Dubaj)
         ('JD847291', 'LO011',  '40A'),  -- Julia D. (USA - Dreamliner)
         ('PK394821', 'LO011',  '40B'),  -- Paweł K. (USA)
         ('MK928374', 'LO011',  '40C')   -- Małgorzata K. (USA)
    ) AS d(passport, flight_num, seat_num)
        JOIN [passengers] p ON p.passport_number = d.passport
        JOIN [flights] f ON f.number = d.flight_num
        JOIN [seats] s ON s.number = d.seat_num AND s.plane_id = f.plane_id;
GO



-- =============================================
-- 1. Bagaż Standardowy (15 sztuk)
-- =============================================
DECLARE @StandardBaggageIds TABLE (id INT);

-- Wstawiamy do tabeli głównej i przechwytujemy ID
INSERT INTO [baggage] ([ticket_id], [tag], [weight], [baggage_type])
OUTPUT inserted.id INTO @StandardBaggageIds
SELECT TOP 15
    t.id,
    N'TAG-STD-' + CAST(t.id AS nvarchar(20)) + N'-' + LEFT(NEWID(), 4), -- Unikalny TAG
    20.00,
    'Standard'
FROM [tickets] t
ORDER BY t.id; -- Bierzemy 15 pierwszych biletów

-- Uzupełniamy tabelę szczegółową
INSERT INTO [baggage_standard] ([baggage_id], [dimensions_cm])
SELECT id, '55x40x23' -- Standardowa walizka kabinowa
FROM @StandardBaggageIds;
GO

-- =============================================
-- 2. Bagaż Ubezpieczony (15 sztuk)
-- =============================================
DECLARE @InsuredBaggageIds TABLE (id INT);

INSERT INTO [baggage] ([ticket_id], [tag], [weight], [baggage_type])
OUTPUT inserted.id INTO @InsuredBaggageIds
SELECT TOP 15
    t.id,
    N'TAG-INS-' + CAST(t.id AS nvarchar(20)) + N'-' + LEFT(NEWID(), 4),
    25.50,
    'Insured'
FROM [tickets] t
ORDER BY t.id DESC; -- Bierzemy bilety od końca, dla urozmaicenia

-- Uzupełniamy tabelę szczegółową (różne kwoty ubezpieczenia w zależności od ID)
INSERT INTO [baggage_insured] ([baggage_id], [insurance_amount], [policy_number])
SELECT
    id,
    CASE WHEN id % 2 = 0 THEN 5000.00 ELSE 10000.00 END, -- Kwota ubezpieczenia
    N'POL-' + CAST(id AS nvarchar(20)) + N'-AXA'
FROM @InsuredBaggageIds;
GO

-- =============================================
-- 3. Bagaż Specjalny (15 sztuk)
-- =============================================
DECLARE @SpecialBaggageIds TABLE (id INT);

INSERT INTO [baggage] ([ticket_id], [tag], [weight], [baggage_type])
OUTPUT inserted.id INTO @SpecialBaggageIds
SELECT TOP 15
    t.id,
    N'TAG-SPC-' + CAST(t.id AS nvarchar(20)) + N'-' + LEFT(NEWID(), 4),
    30.00,
    'Special'
FROM [tickets] t
ORDER BY NEWID(); -- Losowe bilety

-- Uzupełniamy tabelę szczegółową (losujemy typ sprzętu)
INSERT INTO [baggage_special] ([baggage_id], [category], [handling_instructions], [is_fragile])
SELECT
    id,
    CASE (id % 3)
        WHEN 0 THEN 'Sports Equipment'
        WHEN 1 THEN 'Musical Instrument'
        ELSE 'Medical Device'
        END,
    CASE (id % 3)
        WHEN 0 THEN N'Narty - ostrożnie przy załadunku'
        WHEN 1 THEN N'Gitara - nie kłaść innych bagaży na wierzch'
        ELSE N'Wózek inwalidzki - dostarczyć pod drzwi samolotu'
        END,
    1 -- Wszystkie specjalne oznaczamy jako delikatne
FROM @SpecialBaggageIds;
GO