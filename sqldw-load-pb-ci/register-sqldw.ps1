Connect-AzAccount
Select-AzSubscription -SubscriptionId your-subscriptionId
Set-AzSqlServer -ResourceGroupName your-database-server-resourceGroup -ServerName your-database-servername -AssignIdentity