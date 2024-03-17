SELECT P.nume, P.prenume
FROM Participant P join Echipa E
ON P.EchipaID = E.EchipaID
WHERE(E.CapitanID = 1)

SELECT E.nume
FROM Echipa E join Meci M
On M.Echipa#1ID = E.EchipaID
WHERE(M.Scor#1 > M.Scor#2)

SELECT M.
FROM Meci