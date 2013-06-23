
function getCurrentDate()
{
	var str;
	d=new Date();
	date=d.getDate();
	month=d.getMonth()+1;
	year=d.getYear();
	str.push(year);
	str.push("年");
	str.push(month);
	str.push("月");
	str.push(date);
	str.push("日");
	str.push(" ");
	if(d.getDay()==5) str.push("星期五");
	if(d.getDay()==6) str.push("星期六");
	if(d.getDay()==0) str.push("星期天");
	if(d.getDay()==1) str.push("星期一");
	if(d.getDay()==2) str.push("星期二");
	if(d.getDay()==3) str.push("星期三");
	if(d.getDay()==4) str.push("星期四");

	return str.join();
}
