select m.name name, c.committee_name as 'committee assignment'
from members m
cross join committees c;
