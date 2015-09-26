<!--
	Copyright 2009 Jeremie Tisseau
	"Sliding Login Panel with jQuery 1.3.2" is distributed under the GNU General Public License version 3:
	http://www.gnu.org/licenses/gpl-3.0.html
-->
                            
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="EN">
<head>
<title>Admin</title>	<meta name="language" content="en"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content=""/>	
	<meta name="description" content=""/>
<meta name="ROBOTS" content="index,follow"/>
 
<link href="css/ie.css" rel="stylesheet" type="text/css" />
<link href="css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="css/demo_table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/slide.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/format.css" type="text/css" media="screen" />
<link href="css/themes/smoothness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />   
<!--[if IE]>
	<link href="css/ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery.jeditable.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="js/ColVis.js"></script>
<script type="text/javascript" language="javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" language="javascript" src="js/javascript.js"></script>
<script src="js/slide.js" type="text/javascript"></script>


<script type="text/javascript">
            $(document).ready(function() {
                var oTable = $('#example').dataTable( {
                "aoColumns": [
                   { "bSearchable": false, "bVisible": false },
                   { "sClass": 'editthis' },                  
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'ajaxupload', "bSearchable": false },
                   { "sClass": 'ajaxupload', "bSearchable": false },
                   { "sClass": 'ajaxupload', "bSearchable": false },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis' },
                                    
                   { "sClass": 'editthis' },
                   { "sClass": 'editthis', "bSearchable": false },
                    null
                ],
                    "sPaginationType": "full_numbers",
                            "sScrollY": 350,
                            "sScrollX": "100%",
                    "sDom": 'C<"clear">lfrtip',
                    "bProcessing": true,
                    "bServerSide": true,
                                        "fnDrawCallback": function () {
    oTable.$('.ajaxupload').click( function () {
        var aPos = oTable.fnGetPosition( this );
        var nTds = $('td', this);
        var sData = oTable.fnGetData( this.parentNode );
        var n=sData[0];
        var iMyWidth = (window.screen.width/2) - (275 + 10);
        var iMyHeight = (window.screen.height/2) - (12.5 + 50);
var win2 = window.open("filename.htm","Window2","status=no,height=25,width=550,resizable=yes,left=" + iMyWidth + ",top=" + iMyHeight + ",screenX=" + iMyWidth + ",screenY=" + iMyHeight + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
win2.document.write("<form action='upload.php?id="+n+"&pos="+aPos[2]+"' method='post' enctype='multipart/form-data' name='form1'>Image to upload&nbsp;<input name='photo' type='file'/> <input type='submit' class ='searchleft' value='Upload Image' name='submit' ></form>"  )
win2.focus();
  } );
                        $('#example tbody .editthis').editable( 'includes/editable_ajax.php', {
                        
                            "callback": function( Svalue, y ) {

                                /* Redraw the table from the new data on the server */
                             oTable.fnDraw();
                            },
                            "submitdata":function(value, settings){
                                return {
                                 "data" : oTable.fnGetData( this.parentNode ),
                                 "column" : oTable.fnGetPosition( this )[2]
                                };
                            
                            },
                            "height": "14px"
                        });
                        
                    }
                } );
            } );
        </script>
<script type="text/javascript">

$(document).ready(function() {
    $('#Loading').hide();
    $('#Loadinge').hide();     
    $('#Loadingp').hide();
    $('#Loadingmem').hide();     
    $('#Loadingmempass').hide();
    $('#accordion').accordion();    
});

function check_username(){

    var username = $("#signup").val();
    if(username.length > 2){
        $('#Loading').show();
        $.post("includes/check_username_availablity.php", {
            username: $('#signup').val(),
        }, function(response){
            $('#Info').fadeOut();
             $('#Loading').hide();
            setTimeout("finishAjax('Info', '"+escape(response)+"')", 450);
        });
        return false;
    }
}
function check_usernamemem(){

    var usernamemem = $("#log").val();
    if(usernamemem.length > 2){
        $('#Loadingmem').show();
        $.post("includes/check_username_availablity.php", {
            usernamemem: $('#log').val(),
        }, function(response){
            $('#Infomem').fadeOut();
             $('#Loadingmem').hide();
            setTimeout("finishAjax('Infomem', '"+escape(response)+"')", 450);
        });
        return false;
    }
}
function check_userpassmem(){

    var usernamemem = $("#log").val();
    var userpassmem = $("#pwd").val();
    if(userpassmem.length > 2){
        $('#Loadingmempass').show();
        $.post("includes/check_username_availablity.php", {
            usernamemem1: $('#log').val(),
            userpassmem: $("#pwd").val(),
        }, function(response){
            $('#Infomempass').fadeOut();
             $('#Loadingmempass').hide();
            setTimeout("finishAjax('Infomempass', '"+escape(response)+"')", 450);
        });
        return false;
    }
}
function finishAjax(id, response){
 
  $('#'+id).html(unescape(response));
  $('#'+id).fadeIn(1000);
} 
function check_email(){

    var email = $("#email").val();
    if(email.length > 2){
        $('#Loadinge').show();
        $.post("includes/check_username_availablity.php", {
            email: $('#email').val(),
        }, function(response){
            $('#Infoe').fadeOut();
             $('#Loadinge').hide();
            setTimeout("finishAjax('Infoe', '"+escape(response)+"')", 450);
        });
        return false;
    }
}
function check_passwords(){

    var pwd = $("#pwdn").val();
    var pwd1 = $("#pwdn1").val();
    var response1="";
    if(pwd.length > 3){
        $('#Loadingp').show();
      if(pwd == pwd1) {
        response1 = escape('<div id="Success" style="color:lime;">Passwords match</div>')
         $('#Infop').fadeOut();
         $('#Loadingp').hide(); 
        $('#Infop').html(unescape(response1));
        $('#Infop').fadeIn(1000); 
    } else {
        response1 = escape('<div id="Error" style="color:red;">No match</div>')
        $('#Infop').fadeOut();
        $('#Loadingp').hide();
        $('#Infop').html(unescape(response1));
        $('#Infop').fadeIn(1000); 
    }
    } else {
    return false;
    }
}
</script>
<link rel="shortcut icon" href="/favicon.ico" />
</head><body>
<!-- Panel -->
<div id="toppanel">
    <div id="panel">
        <div class="content clearfix">
            <div class="left">
                <h1>Welcome to Autoexec Online</h1>
                                <h2>Please login to access the Admin Panel</h2>        
                <p class=\"grey\">When logged in you will be able to enter the workings of this site</p>
                        </div>
            <div class="left">
                <!-- Login Form -->
                                <form class="clearfix" action="/admin/index.php" method="post">
                    <h1>Member Login</h1>
                    <div>
                    <label class="grey" for="log">Username:</label>
                    <input class="field" type="text" name="log" id="log" value="" onblur="return check_usernamemem();" size="23" style="float: left;" />
                    <div id="Infomem" style="float: left; margin-top: 5px;"></div>
                    <span id="Loadingmem" style="margin-top: 5px;">Checking</span>
                    </div>
                    
                    <div>
                    <label class="grey" for="pwd">Password:</label>
                    <input class="field" type="password" name="pwd" id="pwd" size="23" onblur="return check_userpassmem();" size="23" style="float: left;" />
                    <div id="Infomempass" style="float: left; margin-top: 5px;"></div>
                    <span id="Loadingmempass" style="margin-top: 5px;">Checking</span>
                    </div>                    
                    <label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;Remember me</label>
                    <div class="clear"></div>
                    <input type="submit" name="submit" value="Login" class="bt_login" />
                    <a class="lost-pwd" href="#">Lost your password?</a>
                                    </form>
            </div>
            <div class="left right">            
                <!-- Register Form -->
                                <form action="/admin/index.php" method="post">
                    <h1>Not a member yet? Sign Up!</h1>
                    <div>                
                    <label class="grey" for="signup">Username:</label>
                    <input class="field" type="text" name="user" id="signup" value="" onblur="return check_username();" size="23" style="float: left;" />
                    <div id="Info" style="float: left; margin-top: 5px;"></div>
                    <span id="Loading" style="margin-top: 5px;">Checking</span>
                    </div>
                    <div>
                    <label class="grey" for="email">Email:</label>
                    <input class="field" type="text" name="email" id="email" onblur="return check_email();" size="23" style="float: left;" />
                    <div id="Infoe" style="float: left; margin-top: 5px;"></div>
                    <span id="Loadinge" style="margin-top: 5px;">Checking</span></div>
                    <div>
                    <label class="grey" for="pwd">Password:</label>
                    <input class="field" type="password" name="pwdn" id="pwdn" size="23" style="float: left;"/>
                    <div id="Infop" style="float: left; margin-top: 5px;"></div>
                    <span id="Loadingp" style="margin-top: 5px;">Checking</span></div>
                    <div>
                    <label class="grey" for="pwd1">Re enter Password:</label>
                    <input class="field" type="password" name="pwdn1" id="pwdn1" onblur="return check_passwords();" size="23" style="float: left;"/></div>
                    <label>An activation will be e-mailed to you.</label>
                    <input type="submit" name="subjoin" value="Register" class="bt_register" />
                </form>
                            </div>
        </div>
</div> <!-- /login -->    

    <!-- The tab on top -->    
    <div class="tab">
        <ul class="login">
            <li class="left">&nbsp;</li>
            <li>Hello Guest</li>
            <li class="sep">|</li>
            <li id="toggle">
                                <a id="open" class="open" href="#">Log In | Register</a>
                                <a id="close" style="display: none;" class="close" href="#">Close Panel</a>            
            </li>
            <li class="right">&nbsp;</li>
        </ul> 
    </div> <!-- / top -->

	<div id="wrapper">
<body>
        <img src="images/AdminLogo.png" width="600" height="600" /></div><!-- / content -->		
	</div><!-- / wrapper -->
</body>
</html>
