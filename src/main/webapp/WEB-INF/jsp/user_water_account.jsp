<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragrma","no-cache");
    response.setDateHeader("Expires",0);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <meta HTTP-EQUIV="expires" CONTENT="0">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="static/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="static/css/style.css"/>
        <link href="static/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="static/assets/css/ace.min.css" />
        <link rel="stylesheet" href="static/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="static/js/jquery-1.9.1.min.js"></script>
        <script src="static/js/jquery.SuperSlide.2.1.1.js"></script>
        <script src="static/assets/js/bootstrap.min.js"></script>
		<script src="static/assets/js/typeahead-bs2.min.js"></script>
		<script src="static/assets/js/jquery.dataTables.min.js"></script>
		<script src="static/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="static/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="static/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="static/js/lrtk.js" type="text/javascript" ></script>
    <script >

    </script>
        <style type="text/css">
            th{color: #547ea8;}
            /*.xuan1{display: block;}*/
            .bao2,.bao3{display: none;}
            .baozhe{height: 30px;border-bottom: 1px solid #ddd;}
            .xinxi{
                display: block;
                width: 108px;
                height: 33px;
                background: #fff;
                border: 1px solid #ddd;
                border-bottom: 2px solid #fff;
                color: #333333;
                line-height: 33px;
                text-align: center;
                font-size: 14px;

            }
            .paizhao{width: 30px;}
            .edit_xie li {
    margin: 10px 0px;
    height: 40px;
    line-height: 40px;
    float: left;
    width: 100%;
}
.kuang {
    background: #fff;
    margin: 0;
    padding: 0px 15px;
}
.tishi_wenzi{font-size: 14px;font-weight: bold; color: #307ecc;margin-bottom: 5px}
        </style>
<title>水电气实时统计</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Account_style">
<!--账户基本信息-->
    <div class="baozhe">
             <span class="xinxi">用户基本信息</span>
    </div>
 <div class="Manager_style clearfix">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr style="color: #307ecc;font-weight:normal">
                    <th width="80">ID</th>
                    <th width="100">姓名</th>
                    <th width="80">性别</th>
                    <th width="120">手机</th> 
                    <th width="150">公司</th>
                    <th width="200">地址</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${!empty user }">
            <div items="${user}" var="user">
                <tr>
                    <td>1</td>
                    <td>${user.user_name}</td>
                    <td>${user.user_sex}</td>
                    <td>${user.user_telephone}</td>
                    <td>${user.factory}</td>
                    <td class="text-l">${user.user_address}</td>
                </tr>
                </c:if>
            </tbody>
        </table>
 
 </div>


        <div class="recording_style">
            <div id="recording">
                <div class="hd" >
                    <ul>
                        <li >水表的结算</li>
                    </ul>
                </div>
<c:if test="${!empty list }">
    <c:forEach items="${list}" var="list" varStatus="status">
                <div class="bd">
                    <ul>
                        <div class="biaoming" style="text-align: center;font-weight:600;color: #547ea8"><span>水表名:${list.gyModel.owner}  (水表编号:${list.gyModel.apartment_id})</span></div>
                            <div style="margin: 10px 30% 0 30%;">
                                <button class="btn btn-success" onclick="anniu1(this)">表数视图</button>
                                <button class="btn" onclick="anniu2(this)">表号视图</button>
                                <button class="btn" onclick="anniu3(this)">全局视图</button>
                            </div>
                            <%--表1  表数视图--%>
                        <div class="bao bao1">
                            <table class="table table-striped table-bordered table-hover mytable xuan1" >
                                <thead>
                                <tr>
                                    <th width="">拍照时间</th>
                                    <th width="">拍照人</th>
                                    <th width="" >表数图片</th>
                                    <th width="" >智能识别</th>
                                    <th width="">校对数据</th>
                                    <th width="">操作</th>
                                </tr>

                                </thead>
                                <tbody>
                                    <%--表1  表数视图开始遍历--%>
                                <c:if test="${!empty list.type1 }">
                                    <c:forEach items="${list.type1}" var="water" varStatus="status">
                                        <tr>
                                            <td>${water.time}</td>
                                            <td>${water.user_id}</td>
                                            <td><a href="javascript:;" class="shui"  data-tupian="${water.picture}" onclick="chakan(this,'${water.picture}')">
                                                <img  src="${water.picture}" style="max-width: 120px;max-height: 200px;" >
                                            </a></td>
                                            <td>${water.zzvalue}</td>
                                            <td>${water.value}</td>
                                                <%--<td><a href="javascript:;" onclick="tianshuju('5')"><img class="paizhao" src="static/images/xie.png"></a></td>--%>
                                            <c:choose>
                                                <c:when test="${water.jiaozhun==Null}">
                                                    <td><a href="javascript:;" onclick="tianshuju(this,${water.id},'update','${user.user_telephone}','${room.room_id}','${water.zzvalue}','${water.value}')" data-tupian="${water.picture}">
                                                        <img class="paizhao" src="static/images/xie.png" ></a></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <%--<td>${water.value}</td>--%>
                                                    <td><a href="javascript:;" onclick="tianshuju(this,${water.id},'update','${user.user_telephone}','${room.room_id}','${water.zzvalue}','${water.value}')" data-tupian="${water.picture}">
                                                        <img class="paizhao" src="static/images/tongguo.png" ></a></td>
                                                </c:otherwise>

                                            </c:choose>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>

                        <div class="bao bao2">
                        <%--表2 表号视图  --%>
                        <table class="table table-striped table-bordered table-hover mytable xuan2" >
                            <thead>
                            <tr>
                                <th width="">拍照时间</th>
                                <th width="">拍照人</th>
                                <th width="" >表号图片</th>
                                <th width="" >智能识别</th>
                                <th width="">校对数据</th>
                                <th width="">操作</th>
                            </tr>

                            </thead>
                            <tbody>
                                <%--表2 表号视图开始遍历  --%>
                            <c:if test="${!empty list.type2 }">
                                <c:forEach items="${list.type2}" var="water" varStatus="status">
                                    <tr>
                                        <td>${water.time}</td>
                                        <td>${water.user_id}</td>
                                        <td><a href="javascript:;" class="shui"  data-tupian="${water.picture}" onclick="chakan(this,'${water.picture}')">
                                            <img  src="${water.picture}" style="max-width: 120px;max-height: 200px;" >
                                        </a></td>
                                        <td>${water.zzvalue}</td>
                                        <td>${water.value}</td>
                                            <%--<td><a href="javascript:;" onclick="tianshuju('5')"><img class="paizhao" src="static/images/xie.png"></a></td>--%>
                                        <c:choose>
                                            <c:when test="${water.jiaozhun==Null}">
                                                <td><a href="javascript:;" onclick="tianshuju(this,${water.id},'update','${user.user_telephone}','${room.room_id}','${water.zzvalue}','${water.value}')" data-tupian="${water.picture}">
                                                    <img class="paizhao" src="static/images/xie.png" ></a></td>
                                            </c:when>
                                            <c:otherwise>
                                                <%--<td>${water.value}</td>--%>
                                                <td><a href="javascript:;" onclick="tianshuju(this,${water.id},'update','${user.user_telephone}','${room.room_id}','${water.zzvalue}','${water.value}')" data-tupian="${water.picture}">
                                                    <img class="paizhao" src="static/images/tongguo.png" ></a></td>
                                            </c:otherwise>

                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        </div>

                        <div class="bao bao3">
                        <%--表3 全局视图--%>
                        <table class="table table-striped table-bordered table-hover mytable xuan3" >
                            <thead>
                            <tr>
                                <th width="">拍照时间</th>
                                <th width="">拍照人</th>
                                <th width="" >全局图片</th>
                                <th width="" >智能识别</th>
                                <th width="">校对数据</th>
                                <th width="">操作</th>
                            </tr>

                            </thead>
                            <tbody>
                                <%--表3 全局视图开始遍历  --%>
                            <c:if test="${!empty list.type3 }">
                                <c:forEach items="${list.type3}" var="water" varStatus="status">
                                    <tr>
                                        <td>${water.time}</td>
                                        <td>${water.user_id}</td>
                                        <td><a href="javascript:;" class="shui"  data-tupian="${water.picture}" onclick="chakan(this,'${water.picture}')">
                                            <img  src="${water.picture}" style="max-width: 120px;max-height: 200px;" >
                                        </a></td>
                                        <td>${water.zzvalue}</td>
                                        <td>${water.value}</td>
                                            <%--<td><a href="javascript:;" onclick="tianshuju('5')"><img class="paizhao" src="static/images/xie.png"></a></td>--%>
                                        <c:choose>
                                            <c:when test="${water.jiaozhun==Null}">
                                                <td><a href="javascript:;" onclick="tianshuju(this,${water.id},'update','${user.user_telephone}','${room.room_id}','${water.zzvalue}','${water.value}')" data-tupian="${water.picture}">
                                                    <img class="paizhao" src="static/images/xie.png" ></a></td>
                                            </c:when>
                                            <c:otherwise>
                                                <%--<td>${water.value}</td>--%>
                                                <td><a href="javascript:;" onclick="tianshuju(this,${water.id},'update','${user.user_telephone}','${room.room_id}','${water.zzvalue}','${water.value}')" data-tupian="${water.picture}">
                                                    <img class="paizhao" src="static/images/tongguo.png" ></a></td>
                                            </c:otherwise>

                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        </div>
                    </ul>
                </div> <!-- bd -->
    </c:forEach>
</c:if>
            </div>
        </div>
 <script type="text/javascript">jQuery("#recording").slide({trigger:"click" });</script>



</div>
</div>

<!-- 弹出拍照图片 -->
<div id="paizhaotupiao" style="display:none">
    <div class="kuang">
        <div class="tu" style="width:300px">
            <div class="tishi_wenzi">租户拍摄照片如下</div>
            <img style="width:100%" src="../images/dianbiao.png">
        </div>
        <div ><a onclick="jiexi(this)" id="dian" style="font-size: 14px;font-weight: bold; color:orangered;margin-bottom: 5px;cursor: pointer" data-tupian="xx">点击解析图片</a></div>
        <div id="result"></div>
    </div>
</div>

<div id="tianxie" style="width:500px;display:none" >
    <div class="kuang">
        <div class="tu" style="width:300px">
            <div class="tishi_wenzi">拍摄照片如下，请填入数据</div>
            <img style="width:100%" src="static/images/dianbiao.png" >
        </div>
        <div class="tian">
            <ul class="edit_xie">
                <%--<li><label class="label_name">拍照时间：</label><span class="add_name"><input value="2018年9月25日" name="拍照时间" type="text"  class="text_add"/></span></li>--%>
                <%--<li><label class="label_name">拍&nbsp;&nbsp;照&nbsp;&nbsp;人：</label><span class="add_name"><input value="张三" name="拍照人" type="text"  class="text_add"/></span></li>--%>
                    <li><label class="label_name">自动识别数据为：</label><span class="add_name"><input value="" name="数据" type="text" id="zidong" class="text_add" readonly /></span></li>
                    <li><label class="label_name">填写数据：</label><span class="add_name"><input value="" name="数据" type="text" id="biaoshu" class="text_add"/></span></li>
            </ul>

        </div>
    </div>

</div>

</body>
</html>

<script type="text/javascript">

    // 选项卡
    function anniu1(obj) {
        $(obj).siblings().attr('class','btn');
        $(obj).addClass('btn btn-success');
        $(obj).parent().parent().children('.bao').css('display','none');
        $(obj).parent().parent().children('.bao1').css('display','block');
    }
    function anniu2(obj) {
        $(obj).siblings().attr('class','btn');
        $(obj).addClass('btn btn-success');
        $(obj).parent().parent().children('.bao').css('display','none');
        $(obj).parent().parent().children('.bao2').css('display','block');
        // $("#echarts_4").css('display','block');
    }
    function anniu3(obj) {
        $(obj).siblings().attr('class','btn');
        $(obj).addClass('btn btn-success');
        $(obj).parent().parent().children('.bao').css('display','none');
        $(obj).parent().parent().children('.bao3').css('display','block');
    }
    var lv;
// 编写筛选函数
jQuery(function($) {

        var totallength = ${fn:length(list)};
        if (totallength>0) {
            $('table.mytable').dataTable({
                "aaSorting": [[ 0, "desc" ]],//默认第几个排序
                "paging":   true,  //分页功能
                "filter":false,   //搜索功能
                "bAutoWidth":false,
                "aoColumnDefs": [
                    //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                    {"orderable":false,"aTargets":[1,2,3,4,5]}// 制定列不参与排序
                ]
            });
        }



    // 设置成全选
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});	
});


window.onload = function () {
    // $('.shui').on('click', function(){
    //
    //
    // })


}



function chakan(obj,s) {
    // alert(s);
    var lv=$(obj).attr("data-tupian");
    // alert(lv);
    $('#paizhaotupiao img').attr('src',lv);
    $('#dian').attr('data-tupian',lv);
    layer.open({
        type: 1,
        title: "查看租户拍摄的照片",
        content: $('#paizhaotupiao'),
        area: ['500px']
    });
}

function jiexi(obj) {
    // alert("开始解析");
   var coo = $(obj).attr("data-tupian");
    console.log(coo);
    $.ajax({

        url:"<%=basePath%>/apartment/readTD",
        type:"post",
        data:{latitude:coo},
        success:function(d){
            alert(d.result);
        },
        dataType:"json"
    });


}

// 编写函数让管理员填写水电气表的数据
function tianshuju(obj,id,path,userte,roomid,ocrvalue,tianvalue){
    // alert($(obj))

    if (tianvalue!=null)
    {$("#biaoshu").val(tianvalue);}else {$("#biaoshu").val("");}
    $("#zidong").val(ocrvalue);
    var lv=$(obj).attr("data-tupian");
    $('#tianxie img').attr('src',lv);
    // alert(id);
    // alert(path);
    // alert(1);
    // alert(lv);
    layer.open({
        type: 1,
        title: "填写数据",
        content: $('#tianxie'),
        btn:['保存','取消'],
        area: ['500px', '500px'],
        yes:function(index,layero){
            var num=0;
            var str="";
            $("#tianxie input[type$='text']").each(function(n){
                if($(this).val()=="")
                {
                    layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                        title: '提示框',
                        icon:0,
                    });
                    num++;
                    return false;
                }
            });
            if(num>0){ return false;}
            else{
                layer.alert('保存成功！',{
                    title: '提示框',
                    icon:1,
                    yes: function(index){
                        window.location="<%=basePath%>/meter/sdq1?user_telephone="+userte+"";
                        console.log(1);
                        layer.close(index);
                    }
                });
                gochuanshu(id,path);
                layer.close(index);
            }
        }
    });
}
function gochuanshu(biaoid,lvjing){

    var zhi= $("#biaoshu").val();
    // alert(zhi);
    $.ajax({
        type: "POST",
        url: 'meter/'+lvjing,
        data: {id:biaoid,value:zhi},
        dataType:'json',
        cache: false,
        success: function(data){
            console.log("success");
        }
    });
}

</script>