<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
    background-color: gray;
}

.content img, .content video{
    width:100%;
    height:100%;
    display:none;
}


    /*  css  로딩중 start */

#link {
  color: #e45635;
  display: block;
  font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
  text-align: center;
  text-decoration: none;
}
#link:hover {
  color: #cccccc;
}

#link,
#link:hover {
  -webkit-transition: color 0.5s ease-out;
  -moz-transition: color 0.5s ease-out;
  -ms-transition: color 0.5s ease-out;
  -o-transition: color 0.5s ease-out;
  transition: color 0.5s ease-out;
}

/** BEGIN CSS **/
body {
  background: #333333;
}
@keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-moz-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-webkit-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-o-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-moz-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-webkit-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-o-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@-moz-keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@-webkit-keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@-o-keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
.loading-container,
.loading {
  height: 100px;
  position: relative;
  width: 100px;
  border-radius: 100%;
  padding-top: 80px; 
}

.loading-container {
  margin: 40px auto;
}

.loading {
  border: 2px solid transparent;
  border-color: transparent #fff transparent #fff;
  -moz-animation: rotate-loading 1.5s linear 0s infinite normal;
  -moz-transform-origin: 50% 50%;
  -o-animation: rotate-loading 1.5s linear 0s infinite normal;
  -o-transform-origin: 50% 50%;
  -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
  -webkit-transform-origin: 50% 50%;
  animation: rotate-loading 1.5s linear 0s infinite normal;
  transform-origin: 50% 50%;
}

.loading-container:hover .loading {
  border-color: transparent #e45635 transparent #e45635;
}
.loading-container:hover .loading,
.loading-container .loading {
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
}

#loading-text {
  -moz-animation: loading-text-opacity 2s linear 0s infinite normal;
  -o-animation: loading-text-opacity 2s linear 0s infinite normal;
  -webkit-animation: loading-text-opacity 2s linear 0s infinite normal;
  animation: loading-text-opacity 2s linear 0s infinite normal;
  color: #ffffff;
  font-family: "Helvetica Neue, " Helvetica ", " "arial";
  font-size: 10px;
  font-weight: bold;
  margin-top: 45px;
  opacity: 0;
  position: absolute;
  text-align: center;
  text-transform: uppercase;
  top: 0;
  width: 100px;
  padding-top: 80px;
}

	/*  css 로딩중 end  */
</style>
<link rel="stylesheet" type="text/css" href="/resources/css/signIn.css">

	<div class="container"> 
		<h1 class="display-5" >
			決済が完了されました。 
			メールを確認してください。
			</h1></div>

	<script>
	
	opener.location.href = "/niji/list";
	


	</script>	
		
