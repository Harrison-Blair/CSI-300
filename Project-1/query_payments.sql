use payments; -- Identify Database to use

-- Which customers have both a checking account and a credit or debit card?
select cpm.cid, pm.method_desc, c.routing_id, cc.card_name
from paymentmethod as pm join customerpaymentmethod as cpm on pm.method_id = cpm.method_id
	join checking as c on c.cid = cpm.cid
		join creditdebit as cd on cd.cid = cpm.cid
			join custcard as cc on cd.card_number = cc.card_number
where not pm.method_id = 444;

-- What are the credit and debit cards that have since expired since being added to the database (As of 2/25/2024)?
select cc.card_name, cc.card_number, cc.card_month, cc.card_year
from custcard as cc join creditdebit as cd on cc.card_number = cd.card_number
where card_year < 2024 or (card_year = 2024 and card_month < 2);

-- Is there a correlation between zipcode and bank used?
select cpm.cid, b.bank_name, cc.card_zip
from bank as b join checking as c on b.routing_id = c.routing_id
    join customerpaymentmethod as cpm on c.cid = cpm.cid
		join creditdebit as cd on cpm.cid = cd.cid
			join custcard as cc on cd.card_number = cc.card_number;

-- What kind of users use American Express?
select cc.card_name, cpm.cid, cc.card_zip, pm.method_desc
from custcard as cc join creditdebit as cd on cc.card_number = cd.card_number
	join customerpaymentmethod as cpm on cpm.cid = cd.cid
		join paymentmethod as pm on cpm.method_id = pm.method_id
where card_name = "American Express";


-- What kinds of customers have gift cards connected to their account?
select cpm.cid, pm.method_desc
from customerpaymentmethod as cpm join giftcard as gc on cpm.cid = gc.cid
	join giftcardamt as gca on gc.gift_card_number = gca.gift_card_number
			join paymentmethod as pm on cpm.method_id = pm.method_id
where gc.method_id = 444;
