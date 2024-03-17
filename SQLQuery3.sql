SELECT
    E.EchipaID,
    E.nume,
    (
        SELECT  P.nume + P.prenume AS NUME
        FROM Participant P
        WHERE P.ParticipantID = E.CapitanID
    ) AS Capitan
FROM
    Echipa E
JOIN Eveniment Ev ON Ev.EvenimentID = E.EvenimentID 
WHERE Ev.EvenimentID = 1
