/*
Query Each customer and a payment method for each customer 
*/

select c.cid, c.cfn, c.cln, cc.card_number, cc.card_name
from Customers.Customer c join Payments.customerpaymentmethod cpm on c.cid = cpm.cid
	join Payments.CreditDebit cd on cd.method_id = cpm.method_id
		join Payments.CustCard cc on cc.card_number = cd.card_number;