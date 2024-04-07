/*
The following is a selection of queries that can be run on the three databases.
*/

-- Query #1: Sample SELECT statement that shows a vendor’s parts and the product the parts support. 
select parp.part_name, venc.company_name, prodp.product_name
from parts.part parp join parts.partvendor parv on parp.part_id = parv.part_id
	join vendors.company venc on venc.company_id = parv.company_id
		join parts.partproduct parprod on parp.part_id = parprod.part_id
			join products.product prodp on prodp.product_id = parprod.product_id
-- where venc.company_id = "" -- Uncomment to search by a specific company ID, otherwise organized by product name.
order by prodp.product_name;

-- Query #2: Sample select statement that lists all of the sales people, their contact info, and the name of the company they work for
select concat(s_fn, " ", s_ln) as firstlastname, company_name, contact_desc, contact
from salesperson sp join salespersoncontact spc on sp.s_id = spc.s_id
	join company c on sp.company_id = c.company_id
		join contact con on spc.contact_id = con.contact_id
order by firstlastname, company_name;

-- Query #3: Gets most recent prices & quantities for all products
select p.product_id as "ID#", product_name as "Product", pi_qty as "Stock", pi_date as "Last Inv Update" , pph_price as "Price", pph_date as "Last Price Update"
from products.product p join products.productinventory pi1 on p.product_id = pi1.product_id
	join products.productpricehistory pph1 on p.product_id = pph1.product_id
inner join(
	select product_id, max(pi_date) as MaxDate
    from products.productinventory
    group by product_id
    ) pi2 on pi1.product_id = pi2.product_id and pi1.pi_date = pi2.MaxDate
inner join (
	select product_id, max(pph_date) as MaxDate
    from products.productpricehistory
    group by product_id
    ) pph2 on pph1.product_id = pph2.product_id and pph1.pph_date = pph2.MaxDate;
    
--     Query #4: All Parts (NOTE: Quantity history is not tracked, and therefore is subsituted with the part's associated brand)
select p.part_id as "Part ID", p.part_name as "Part Name", vc.company_name as "Brand",pi.pi_qty as "Quantity", parhis_price as "Price", parhis_date as "Last Price Update"
from parts.part p join parts.partinventory pi on p.part_id = pi.part_id
	join parts.parthistory parhis1 on p.part_id = parhis1.part_id
		join parts.partvendor pv on p.part_id = pv.part_id
			join vendors.company vc on pv.company_id = vc.company_id
inner join (
	select part_id, max(parhis_date) as MaxDate
    from parts.parthistory
    group by part_id
    ) parhis2 on parhis1.part_id = parhis2.part_id and parhis1.parhis_date = parhis2.MaxDate
order by vc.company_name;

-- Query #5: Finds all products that must be reordered (below their minumum)
select p.product_id as "Product ID#", p.product_name as "Product Name", pi1.pi_qty as "Current Stock", pi1.pi_trigger_order as "Minimum Stock", pph1.pph_price as "Price Per Unit", pi1.pi_date as "As of Date"
from products.product p join products.productinventory pi1 on p.product_id = pi1.product_id
	join products.productpricehistory pph1 on p.product_id = pph1.product_id
inner join(
	select product_id, max(pi_date) as MaxDate
    from products.productinventory
    group by product_id
    ) pi2 on pi1.product_id = pi2.product_id and pi1.pi_date = pi2.MaxDate
inner join (
	select product_id, max(pph_date) as MaxDate
    from products.productpricehistory
    group by product_id
    ) pph2 on pph1.product_id = pph2.product_id and pph1.pph_date = pph2.MaxDate
where pi1.pi_qty < pi1.pi_trigger_order;

-- Query #6: All Parts that must be reordered, price, current quantity, as well as what company to order from (Combine with Query #2 to coordinate an order with a vendor)
select p.part_id as "Part ID", p.part_name as "Part Name", pi.pi_qty as "Current Stock", pi.pi_trigger_order as "Min Stock", vc.company_name as "Brand", parhis1.parhis_price as "Price", parhis1.parhis_date as "As of Date"
from parts.part p join parts.partinventory pi on p.part_id = pi.part_id
	join parts.parthistory parhis1 on p.part_id = parhis1.part_id
		join parts.partvendor pv on p.part_id = pv.part_id
			join vendors.company vc on pv.company_id = vc.company_id
inner join (
	select part_id, max(parhis_date) as MaxDate
    from parts.parthistory
    group by part_id
    ) parhis2 on parhis1.part_id = parhis2.part_id and parhis1.parhis_date = parhis2.MaxDate
where pi.pi_qty < pi.pi_trigger_order;

-- Query #7: Checks the current total number of products in the database
select sum(pi1.pi_qty) as "Total Number of Products"
from products.productinventory as pi1
inner join (
	select product_id, max(pi_date) as MaxDate
    from products.productinventory
    group by product_id
    ) pi2 on pi1.product_id = pi2.product_id and pi1.pi_date = pi2.MaxDate;

--  Query #8: History of a price & quantity for a particular product
select p.product_id "Product ID#", p.product_name as "Product Name", pi.pi_qty as "Quantity", pi.pi_date as "Inventory Update Date", pph.pph_price as "Price", pph.pph_date as "Price Update Date"
from products.product p join products.productinventory pi on p.product_id = pi.product_id
	join products.productpricehistory pph on p.product_id = pph.product_id
-- where p.product_id = "23" (Uncomment to search for a particular product)
order by p.product_id, pph.pph_date; -- Substitute pph.pph_date for pi.pi_date to order by the inventory change

--     Query #9: Parts (Without quantity tracking)
select p.part_id as "ID", p.part_name as "Part Name", pi.pi_qty as "Stock", parhis_price as "Price", parhis_date "As of Date"
from parts.part p join parts.partinventory pi on p.part_id = pi.part_id
	join parts.parthistory parhis on p.part_id = parhis.part_id
-- where p.part_id = ""
order by p.part_id, parhis.parhis_date;

-- Query #10: A table of parts that a customer may browse to see what parts to choose to repair their bike
select partp.part_name as "Part Name", prodp.product_name as "Related Product", vc.company_name as "Brand", parhis1.parhis_price as "Current Price"
from parts.part partp join parts.partproduct pp on partp.part_id = pp.part_id
	join products.product prodp on prodp.product_id = pp.product_id
		join parts.partvendor pv on partp.part_id = pv.part_id
			join vendors.company vc on pv.company_id = vc.company_id
				join parts.parthistory parhis1 on partp.part_id = parhis1.part_id
inner join (
	select part_id, max(parhis_date) as MaxDate
    from parts.parthistory
    group by part_id
    ) parhis2 on parhis1.part_id = parhis2.part_id and parhis1.parhis_date = parhis2.MaxDate
order by prodp.product_name, partp.part_name, parhis1.parhis_price