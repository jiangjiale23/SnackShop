/**
 * 
 */

$(document).ready(function(){
	//退出登录
    var name=$('#pd').val();
	if(name!=null && name !=0 && name !='' && name !='0'){
		document.getElementById("headerLogout").style.display = "block";
	}else {
		document.getElementById("headerLogout").style.display = "none";
	}
	$(document).ready(function(){
		$(".headerLogout").click(function() {
		location.href="/SnackShop/shop/userlogout";
		});
	});
	
	
});