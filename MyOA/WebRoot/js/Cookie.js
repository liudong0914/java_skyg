function setCookie(sName, sValue)
{
	var dt=new Date();
	var y=dt.getYear();
	y=y<100?(2000+y):y;
	y++;
	dt=new Date(y,dt.getMonth(),dt.getDate());
	document.cookie = sName + "=" + escape(sValue) +
					";expires="+dt.toGMTString()+";";
}
function getCookie(sName)
{
	var aCookie = document.cookie.split("; ");
	for (var i=0; i < aCookie.length; i++)
	{
		var aCrumb = aCookie[i].split("=");
		if (sName == aCrumb[0]) 
			return unescape(aCrumb[1]);
	}

	return null;
}
