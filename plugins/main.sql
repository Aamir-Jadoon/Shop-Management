-- Advance Search Query

DECLARE
	a varchar2(300);
BEGIN
	if :searchblk.srch = 'num' then
	a := 'cstid = '||:searchblk.Searchvalue;
	set_block_property ('customer', default_where, a);
	go_block('customer');
	execute_query;

elsif :searchblk.srch = 'cname' then
	a := 'upper(cname) = '||''''||upper(:searchblk.Searchvalue)||'''';
	set_block_property ('customer', default_where, a);
	go_block('customer');
	execute_query;

elsif :searchblk.srch = 'nation' then 
	a:= 'upper (nationality) like '||''''||upper(:searchblk.Searchvalue)||'''';
	set_block_property('customer',default_where,a);
	go_block ('customer');
	execute_query;

else
	message('Please Select Proper Choice and then Search');
	message('Please Select Proper Choice and then Search');

	end if;
end;