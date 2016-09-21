var Pngfix={doPngImageFix:function(){var arVersion=navigator.appVersion.split("MSIE");
var version=parseFloat(arVersion[1]);
if((version>=5.5)&&(document.body.filters)){document.getElementsByClassName("ad-container").each(function(element){var imageElements=element.getElementsByTagName("img");
for(var i=0,length=imageElements.length;
i<length;
i++){var img=imageElements[i];
if(img){var imageName=img.src.toUpperCase();
if(imageName.substring(imageName.length-3,imageName.length)=="PNG"){var imgID=(img.id)?"id='"+img.id+"' ":"";
var imgClass=(img.className)?"class='"+img.className+"' ":"";
var imgTitle=(img.title)?"title='"+img.title+"' ":"title='"+img.alt+"' ";
var imgStyle="display:inline-block;"+img.style.cssText;
if(img.align=="left"){imgStyle="float:left;"+imgStyle
}if(img.align=="right"){imgStyle="float:right;"+imgStyle
}var strNewHTML="<span "+imgID+imgClass+imgTitle+" style=\"width:"+img.width+"px; height:"+img.height+"px;"+imgStyle+";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+img.src+"', sizingMethod='scale');\"></span>";
img.outerHTML=strNewHTML
}}}})
}}}
