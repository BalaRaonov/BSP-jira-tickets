SELECT DISTINCT
po.item_id,
max(po.unit_price) as unit_price,
po.currency_code,
po.buyer
from prd_dw.wc_po_dm po
inner join (
select
max(po_number) as po_number,
item_id
FROM
prd_dw.wc_po_dm
where
organization_id = 4226
and PO_status = 'APPROVED'
GROUP BY
item_id
) filter_latest_po
on filter_latest_po.item_id = po.item_id
and filter_latest_po.po_number = po.po_number
where
po.organization_id = 4226
and po.PO_status = 'APPROVED'
group BY
po.item_id,
po.currency_code,
po.buyer