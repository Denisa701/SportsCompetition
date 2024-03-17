SELECT L.adresa, M.Scor#1, M.Scor#2,
(SELECT A.Nume + A.Prenume AS Nume  FROM Arbitru A WHERE A.ArbitruID = M.ArbitruID)
FROM Locatie L
JOIN Meci M  
ON M.LocatieID = L.LocatieID;


SELECT M.Scor#1, M.Scor#2
From Meci M Join Echipa E
ON M.