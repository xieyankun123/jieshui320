 $(function(){


        $(".cancel").click(function(){
            window.location.href="s-index.html";
        });


        // function tishia(x,n){
        //       x.html(n);
        //       x.css('display','block');
        //       setTimeout(function(){
        //       x.css('display','none');
        //       },1200);
        // }
        // var yonghuming_kong ="请输入用户名";
        // var mima_kong="请输入密码";
        // var mima_cuo="请输入正确密码";

    function panduan(){
        var url = location.search;
            if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs=str.split("=");
            var touid=strs[1];
            return touid;
        }
    }
    var denglu_id=panduan();
 function tishia(x,n){
              x.html(n);
              x.css('display','block');
              setTimeout(function(){
              x.css('display','none');
              },1200);
        }
        var yonghuming_kong ="请输入用户名";
        var mima_kong="密码格式不对";
        var mima_cuo="请输入正确密码";
    function enter() 
    { 
      var username=document.getElementById("username").value;//获取form中的用户名 
      var password=document.getElementById("password").value; 
      var regex=/^[/s]+$/;//声明一个判断用户名前后是否有空格的正则表达式 
      if(regex.test(username)||username.length==0)//判定用户名的是否前后有空格或者用户名是否为空 
        { 
          // alert("用户名格式不对"); 
          tishia( $('.tishikuang'),yonghuming_kong);
          return false; 
        } 
      if(regex.test(password)||password.length==0)//同上述内容 
      { 
        tishia( $('.tishikuang'),mima_kong);
        // alert("密码格式不对"); 
        return false; 
      } 
      return true; 
    } 

    // function enter(){
    //             if($('#username').val()==""){
    //         tishia( $('.tishikuang'),yonghuming_kong);
    //         return false;
    //         }
    //         else if($('#password').val()==""){
    //         tishia( $('.tishikuang'),mima_kong);
    //         return false;
    //         }
    //         // else if($('#password').val().length<6)
    //         // {tishia( $('.tishikuang'),mima_cuo);}
    //         else{return true; }
    // }
    // $('.green').click(function(){
    //         if($('#username').val()==""){
    //         tishia( $('.tishikuang'),yonghuming_kong);
    //         }
    //         else if($('#password').val()==""){
    //         tishia( $('.tishikuang'),mima_kong);
    //         }
    //         else if($('#password').val().length<6)
    //         {tishia( $('.tishikuang'),mima_cuo);}
    //         else{
                // window.location.href="s-index.html?panduan_denglu=1";
                // window.location.href="../php/enter.php";
                // if(denglu_id==0){
                //     window.location.href="s-index.html?panduan_denglu=1";
                // }
                // else if(denglu_id==1){
                //     window.location.href="tourist_3.html";
                // }
                // else if(denglu_id==2){
                //     window.location.href="userafter.html";
                // }
                // else if(denglu_id==3){
                //     window.location.href="myorder.html";
                // }
                // else if(denglu_id==4){
                //     window.location.href="youji.html";
                // }
                // else if(denglu_id==5){
                //     window.location.href="train.html";
                // }
                // else if(denglu_id==6){
                //     window.location.href="hotel.html";
                // }
                // else if(denglu_id==7){
                //     window.location.href="plane.html";
                // }
        //     }
        // });   
        // 点击跳转注册页面 
        $(".yellow").click(function(){
                window.location.href="register.html?denglu_id";
                
        });
});