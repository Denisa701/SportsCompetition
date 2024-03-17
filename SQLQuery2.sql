
SELECT P.ParticipantID, P.nume, P.prenume,
    (SELECT E.nume FROM Echipa E WHERE P.EchipaID = E.EchipaID ) AS Nume, 
    P.email, P.parola, P.telefon 
FROM Participant P join Echipa E On
P.EchipaID = E.EchipaID
WHERE E.AntrenorID = 1;


SELECT MAX(M.Scor#1) AS MaxScor1, M.Scor#2, E.nume
FROM Meci M
JOIN Echipa E ON M.Echipa#1ID = E.EchipaID
GROUP BY E.nume, M.Scor#2
HAVING MAX(M.Scor#1) > 1;


SELECT P.ParticipantID, P.nume, P.prenume,
       E.nume AS NumeEchipa,
       P.email, P.parola, P.telefon,
       COUNT(*) AS NumarParticipanti
FROM Participant P
JOIN Echipa E ON P.EchipaID = E.EchipaID
WHERE E.AntrenorID = 1
GROUP BY P.ParticipantID, P.nume, P.prenume, E.nume, P.email, P.parola, P.telefon;



