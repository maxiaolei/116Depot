// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
window.onload=function(){
	try{
		$('#star_read').raty({readOnly:true,path:'../../images',start:product_level});
		}catch(e){		
	}
 	try{
		$('#star_edit').raty({path:'../../images',start:product_level,});					
	}catch(e){				
	}
};
