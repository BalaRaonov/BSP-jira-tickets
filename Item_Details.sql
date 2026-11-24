select
MSI.organization_id,
MSI.inventory_item_id,
MSI.MAX_MINMAX_QUANTITY,
MSI.MIN_MINMAX_QUANTITY,
it.default_buyer
from 
WC_ORA_MTL_SYSTEM_ITEMS_B_DS MSI
inner join prd_dw.wc_item_dm IT
on MSI.inventory_item_id = IT.inventory_item_id
and MSI.organization_id = IT.organization_id
where MSI.organization_id = 4226