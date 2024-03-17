/*Index page sql */
SELECT * FROM Eveniment;

/*Index page sql_join1 */
SELECT P.nume, P.prenume 
FROM Participant P 
JOIN Echipa E ON P.EchipaID = E.EchipaID 
WHERE E.CapitanID = 1;

/*Index page sql_join2 */
SELECT E.nume
FROM Echipa E 
JOIN Meci M ON M.Echipa#1ID = E.EchipaID
WHERE M.Scor#1 < M.Scor#2;

/*Index page sql_join3 */
SELECT L.adresa, M.Scor#1, M.Scor#2, 
(SELECT E.nume FROM Echipa E WHERE E.EchipaID = M.Echipa#1ID),
(SELECT E.nume FROM Echipa E WHERE E.EchipaID = M.Echipa#2ID),
(SELECT A.Nume + A.Prenume AS Nume  FROM Arbitru A WHERE A.ArbitruID = M.ArbitruID) 
FROM Locatie L JOIN Meci M  ON M.LocatieID = L.LocatieID;

/*Index page sql_join4 */
SELECT MAX(M.Scor#1) AS MaxScor1, M.Scor#2, E.nume 
FROM Meci M JOIN Echipa E ON M.Echipa#1ID = E.EchipaID
GROUP BY E.nume, M.Scor#2 HAVING MAX(M.Scor#1) > 1;


/* DisplayPlayers page sql*/
SELECT P.ParticipantID, P.nume, P.prenume, 
E.nume AS NumeEchipa, 
P.email, P.parola, P.telefon, 
COUNT(*) AS NumarParticipanti 
FROM Participant P 
JOIN Echipa E ON P.EchipaID = E.EchipaID 
GROUP BY P.ParticipantID, P.nume, P.prenume, E.nume, P.email, P.parola, P.telefon ;

/*DisplayTeams page sql*/
SELECT E.EchipaID,E.nume,
(SELECT P.nume + P.prenume FROM Participant P WHERE P.ParticipantID = E.CapitanID) AS Capitan,
(SELECT P.Nume + P.Prenume FROM Antrenor P WHERE P.AntrenorID = E.AntrenorID) AS Antrenor
FROM Echipa E 
WHERE E.EchipaID = ANY(SELECT M.Echipa#1ID FROM Meci M)

DECLARE @id AS VARCHAR(1)
/*SelectPlayers sql_select_join id variabil*/
SELECT P.ParticipantID, P.nume, P.prenume, P.email, P.telefon 
FROM Participant P 
JOIN Echipa E ON P.EchipaID = E.EchipaID 
WHERE E.EchipaID = @id;

/*Select Teams sql_select_join */
SELECT E.EchipaID, E.nume, 
COALESCE((SELECT P.nume + P.prenume FROM Participant P WHERE P.ParticipantID = E.CapitanID), 'No Capitan') AS Capitan 
FROM Echipa E 
JOIN Eveniment Ev ON Ev.EvenimentID = E.EvenimentID 
WHERE Ev.EvenimentID = @id;

DECLARE @tipCompetitie AS VARCHAR(100)
DECLARE @data AS VARCHAR(12)
DECLARE @sponsori AS VARCHAR(100)
/*Edit events page */
SELECT * FROM Eveniment WHERE EvenimentID = @id

UPDATE Eveniment 
SET tipCompetitie = @tipCompetitie, Sponsori = @sponsori, data = @data 
WHERE EvenimentID = @id;

DECLARE @email AS VARCHAR(100)
DECLARE @nume AS VARCHAR(12)
DECLARE @prenume AS VARCHAR(100)
DECLARE @telefon AS VARCHAR(100)
DECLARE @echipa AS VARCHAR(100)
/*Edit players page */
SELECT * FROM Participant WHERE ParticipantID = @id

UPDATE Participant 
SET nume = @nume, prenume = @prenume, email = @email, telefon = @telefon, EchipaID = @echipa 
WHERE ParticipantID = @id;

