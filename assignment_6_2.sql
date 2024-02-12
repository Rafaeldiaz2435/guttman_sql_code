select m.name name, c.committee_name as 'committee assignment'
from members m
inner join committees c
on m.committee_id = c.committee_id;
