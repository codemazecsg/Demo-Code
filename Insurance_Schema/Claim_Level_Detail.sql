
USE contosodb01;

SELECT 
	PC.ClaimID as 'ClaimID',
	PC.PolicyNumber as 'PolicyNumber',
	PC.CreateDate as 'ClaimCreateDate',
	PC.StatusCode as 'ClaimStatusCode',
	PC.ApprovalCode as 'ClaimApprovalCode',
	PC.ApproverEmployeeID as 'ClaimApproverEID',
	PC.IncidentDate as 'ClaimIncidentDate',
	PC.TotalSettledClaimAmount as 'ClaimSettlementAmount',
	PC.ClaimPaymentStructure as 'ClaimPaymentStructure',
	PC.ClaimPaymentFrequencyCode as 'ClaimPaymentFrequencyCode',
	CA.ClaimAdjustmentID as 'ClaimAdjustmentID',
	CA.AdjusterEmployeeID as 'AdjusterEmployeeID',
	CA.ItemTotalAdjustmentAmount as 'AdjustedItemAmount',
	PHP.PropertyInsuredValue as 'PropertyInsuredValue',
	PHP.CoverageItemCode as 'CoverageItemCode',
	PHP.PropertyLocationPostalCode as 'PropertyLocationPostalCode'
INTO _CLAIM_LEVEL_DETAIL
FROM PolicyClaims PC
	INNER JOIN ClaimAdjustments CA
	on PC.ClaimID = CA.ClaimID
	INNER JOIN PolicyHolderProperty PHP
	on PHP.PhPID = CA.PhPID