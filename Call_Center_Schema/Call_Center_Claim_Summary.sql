
USE CallCenter;

DROP TABLE _CALL_CENTER_CLAIM_SUMMARY

SELECT c.ClaimID, COUNT(c.CaseID) as 'NumCases', SUM(c.NumContacts) as 'NumContacts', SUM(c.NumActions) as 'NumActions' 
	INTO _CALL_CENTER_CLAIM_SUMMARY
FROM (
	SELECT 
		CSC.ClaimId as 'ClaimID',
		CSC.CaseID as 'CaseID',
		(SELECT COUNT(*) FROM CustomerContactHistory WHERE CaseID = CSC.CaseID) as 'NumContacts',
		(SELECT COUNT(*) FROM CaseActionItems WHERE CaseID = CSC.CaseID) as 'NumActions'
	FROM ClaimsSupportCase CSC ) c
	GROUP BY c.ClaimID;
