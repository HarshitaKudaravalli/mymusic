function getOption(a,b) {
    var obj = document.getElementById("mySelect"+b+"");
	var mul=obj.value;
	var res=mul*a;
	var a1=a;
	document.getElementById("ret"+b+"").innerHTML = res;
        document.getElementById("myvalue"+b+"").value = res;
        document.getElementById("myval"+b+"").value = a1;
        
	}