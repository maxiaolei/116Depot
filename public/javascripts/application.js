// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
window.onload=function(){
	try{
		for(var i=0;i<id.length;i++){
			$(id.pop()).raty({readOnly:true,path:'../../images',start:level.pop()});
		};
	}catch(e){
		try{
			$('#star_read').raty({readOnly:true,path:'../../images',start:product_level});
			}catch(e){
		}
	}
 	try{
		$('#star_edit').raty({path:'../../images',start:product_level,});					
	}catch(e){				
	}
};
