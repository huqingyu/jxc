
function getCurrentDate()
{
	var str;
	d=new Date();
	date=d.getDate();
	month=d.getMonth()+1;
	year=d.getYear();
	str.push(year);
	str.push("��");
	str.push(month);
	str.push("��");
	str.push(date);
	str.push("��");
	str.push(" ");
	if(d.getDay()==5) str.push("������");
	if(d.getDay()==6) str.push("������");
	if(d.getDay()==0) str.push("������");
	if(d.getDay()==1) str.push("����һ");
	if(d.getDay()==2) str.push("���ڶ�");
	if(d.getDay()==3) str.push("������");
	if(d.getDay()==4) str.push("������");

	return str.join();
}
