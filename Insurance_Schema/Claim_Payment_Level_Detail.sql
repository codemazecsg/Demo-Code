
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
	PC.ClaimPaymentTotalRequiredCount as 'ClaimPaymentTotalRequiredCount',
	PC.ClaimPaymentFrequencyCode as 'ClaimPaymentFrequencyCode',
	CP.CreateDate as 'PaymentDate',
	CP.PaymentAmount as 'PaymentAmount'
INTO _CLAIM_PAYMENT_LEVEL_DETAIL
FROM PolicyClaims PC
	INNER JOIN ClaimPayments CP
	on PC.ClaimID = CP.ClaimID