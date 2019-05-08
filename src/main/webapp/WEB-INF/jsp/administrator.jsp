<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
         <link href="static/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="static/css/style.css"/>       
        <link href="static/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="static/assets/css/ace.min.css" />
        <link rel="stylesheet" href="static/font/css/font-awesome.min.css" />
		<script src="static/js/jquery-1.9.1.min.js"></script>
        <script src="static/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/Widget/Validform/5.3.2/Validform.min.js"></script>
		<script src="static/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="static/assets/js/jquery.dataTables.min.js"></script>
		<script src="static/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="static/assets/layer/layer.js" type="text/javascript" ></script>          
		<script src="static/js/lrtk.js" type="text/javascript" ></script>
         <script src="static/assets/layer/layer.js" type="text/javascript"></script>	
        <script src="static/assets/laydate/laydate.js" type="text/javascript"></script>
	<style type="text/css">

		#kongxian{background-color:#abbac3!important;}
		.zhuangtai{
			border-radius: 0;
			text-shadow: none;
			font-weight: normal;
			display: inline-block;
			font-size: 12px;
			line-height: 1.15;
			height: 20px;
			padding: .2em .6em .3em;
			color: #fff;
			text-align: center;
			white-space: nowrap;
			vertical-align: baseline;
		}
		#duankai{background-color:  #abbac3!important;}
		#shiyongzhong{background-color: lightsalmon!important;}
	</style>
<title>管理员</title>
</head>

<body>
<c:if test="${!empty mm }">
	<div items="${mm}" var="mm">
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
    <div class="search_style">
     
      <ul class="search_content clearfix">
       <li><label class="l_f">管理员名称</label><input name="" type="text"  class="text_add" id="sousuo" placeholder="输入管理员名称、手机"  style=" width:250px"/></li>
       <li style="display:none;"><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search" id="ss"><i class="fa fa-search"></i>查询</button></li>
      </ul>
    </div>

     <!--管理员列表-->
     <div class="clearfix administrator_style" id="administrator">
      <div class="left_style">
      <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        
       </div>
      </div>  
      </div>
      </div>
      <div class="table_menu_list"  id="testIframe">
           <table class="table table-striped table-bordered table-hover" id="sample_table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">序号</th>
				<th width="250">姓名</th>
				<th width="150">手机</th>
				<!-- <th width="100px">邮箱</th> -->
                <th width="100">角色</th>				
				<!-- <th width="180">加入时间</th> -->
				<th width="70">状态</th>
			 <th width="70">公司</th>
			 <th width="200">操作</th>
			</tr>
		</thead>
	<tbody>
<c:if test="${!empty mg }">
	<c:forEach items="${mg}" var="mg" varStatus="status">
		<tr>
			<td width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
			<td>${status.index+1}</td>
			<td>${mg.manager_name}</td>
			<td>${mg.manager_telephone}</td>
			<td>${mg.role}</td>
			<c:choose>
				<c:when test="${mg.headpic=='0'}">
					<td><span class="zhuangtai" id="kongxian">已停用</span></td>
				</c:when>
				<c:when test="${mg.headpic=='1'}">
					<td class="td-status"><span class="label label-success radius">已启用</span></td>
				</c:when>
			</c:choose>
			<td>${mg.factory}</td>
      <td class="td-manage">
		  <c:choose>
		  <c:when test="${mm.role=='超级管理员'}">
			  <a title="编辑"  onclick="admin_edit(this,'${mg.password}','${mg.headpic}','${mg.role}','${mm.role}','${mm.manager_telephone}')"
				 href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
			</c:when>
			<c:when test="${mm.role=='系统管理员'}">
				<a title="编辑"  onclick="admin_edit(this,'${mg.password}','${mg.headpic}','${mg.role}','${mm.role}','${mm.manager_telephone}')"
				   href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
			</c:when>
			<c:when test="${mm.role=='普通管理员'}">
				  <c:choose>
					  <c:when test="${mm.manager_telephone==mg.manager_telephone}">
						  <a title="编辑"  onclick="admin_edit(this,'${mg.password}','${mg.headpic}','${mg.role}','${mm.role}','${mm.manager_telephone}')"
							 href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
					  </c:when>
					  <c:otherwise>
						  <a title="编辑" href="javascript:;" onclick="tishi()" class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
					  </c:otherwise>
				  </c:choose>
		  	</c:when>
		  </c:choose>
       </td>
     </tr>
	</c:forEach>
</c:if>
    </tbody>
    </table>
      </div>
     </div>
  </div>
</div>
 <!--添加管理员-->
 <div id="add_administrator_style" class="add_menber" style="display:none">
    <form action="" method="post" id="form-admin-add">
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>姓名：</label>
			<div class="formControls">
				<input type="text" class="input-text" value="" placeholder="" id="user-name" name="user-name" datatype="*2-16" nullmsg="用户名不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls">
			<input type="password" placeholder="密码" name="userpassword" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>确认密码：</label>
			<div class="formControls ">
		<input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error" errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword" id="newpassword2" name="newpassword2">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>性别：</label>
			<div class="formControls  skin-minimal">
		      <!-- <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp; -->
            <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">男</span></label>&nbsp;&nbsp;
            <label><input name="form-field-radio" type="radio" class="ace" ><span class="lbl">女</span></label>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>状态：</label>
			<div class="formControls  skin-minimal">
		      <!-- <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp; -->
            <label><input name="form-field-radio2" type="radio" class="ace" checked="checked"><span class="lbl">启用</span></label>&nbsp;&nbsp;
            <label><input name="form-field-radio2" type="radio" class="ace"><span class="lbl">停用</span></label>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>手机：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="" placeholder="" id="user-tel" name="user-tel" datatype="m" nullmsg="手机不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<!-- <label class="form-label"><span class="c-red">*</span>邮箱：</label> -->
			<!-- <div class="formControls ">
				<input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
			</div> -->
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label">角色：</label>
			<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-role" size="1">
					<option value="0">超级管理员</option>
					<option value="1">系统管理员</option>
					<option value="2">普通管理员</option>
					<!-- <option value="3">栏目编辑</option> -->
				</select>
				</span> </div>
		</div>
		<div class="form-group">
			<label class="form-label">备注：</label>
			<div class="formControls">
				<textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="checkLength(this);"></textarea>
				<span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
			</div>
			<div class="col-4"> </div>
		</div>
		<div> 
        <input class="btn btn-primary radius" type="submit" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
	</form>
   </div>
 </div>


     <!--操作-->
     <div class="clearfix" style="margin-left:10px">
       <span class="l_f">
		   <c:choose>
			<c:when test="${mm.role=='超级管理员'}">
        <a href="javascript:ovid()" id="administrator_add"  onclick="admin_add('${mm.manager_telephone}')" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
			</c:when>
			<c:when test="${mm.role=='系统管理员'}">
		   <a href="javascript:ovid()" id="administrator_add"  onclick="admin_add('${mm.manager_telephone}')" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
			</c:when>
			   <c:otherwise>
				   <a href="javascript:ovid()" id="administrator_ad" onclick="admin_add('${mm.manager_telephone}')" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
			   </c:otherwise>
		   </c:choose>
	   </span>
     </div>


<!--添加管理员图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
	<ul class=" page-content">
		<li><label class="label_name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label><span class="add_name">
        <input value="" name="姓名" type="text" data-shu='xingming' class="text_add"/></span><div class="prompt r_f"></div></li>
		<li><label class="label_name">手机号码：</label><span class="add_name">
        <input value="" name="手机号码" type="text" data-shu='shoujihao' class="text_add"/></span><div class="prompt r_f"></div></li>

		<li><label class="label_name">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><span class="add_name">
        <input value="" name="密码" type="text" data-shu='mima' class="text_add"/></span><div class="prompt r_f"></div></li>
		<li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace" value="1"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1"type="radio" class="ace" value="0"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
		<li>
		<c:choose>
			<c:when test="${mm.role=='超级管理员'}">
				<div class="form-group">
					<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
					<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-roleadd" size="1" style="width:165px;margin-left:9px;">
					<option value="1" disabled="">超级管理员</option>
					<option value="2">系统管理员</option>
					<option value="3">普通管理员</option>
				</select>
				</span> </div>
				</div>
			</c:when>
			<c:when test="${mm.role=='系统管理员'}">
				<div class="form-group">
					<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
					<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-roleadd" size="1" style="width:165px;margin-left:9px;">
					<option value="1" disabled="">超级管理员</option>
					<option value="2" disabled="">系统管理员</option>
					<option value="3">普通管理员</option>
				</select>
				</span> </div>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose></li>
		<li>
				<div class="form-group">
					<label class="form-label">公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;司：</label>
					<div class="formControls "> <span class="select-box" style="width:150px;">
						<select class="select" name="factory" size="1" style="width:165px;margin-left:9px;">
							<c:if test="${!empty factorylist }">
								<c:forEach items="${factorylist}" var="f" varStatus="status">
								<option value="${f.facotry}">${f.facotry}</option>
								</c:forEach>
							</c:if>
				</select>
				</span> </div>
				</div>
		</li>

	</ul>
</div>

<!--编辑管理员图层-->
<div class="add_menber" id="add_menber_style2" style="display:none" >

	<ul class=" page-content">
		<li><label class="label_name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label><span class="add_name">
        <input value="" name="姓名" type="text" data-shu='xingming' class="text_add"/></span><div class="prompt r_f"></div></li>
		<li><label class="label_name">手机号码：</label><span class="add_name">
        <input value="" name="手机号码" type="text" data-shu='shoujihao' class="text_add"/></span><div class="prompt r_f"></div></li>

		<li><label class="label_name">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><span class="add_name">
        <input value="" name="密码" type="text" data-shu='mima' class="text_add"/></span><div class="prompt r_f"></div></li>
		<li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio8" type="radio" checked="checked" class="ace" value="1"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio8"type="radio" class="ace" value="0"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
		<c:choose>
			<c:when test="${mm.role=='超级管理员'}">
				<div class="form-group">
					<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
					<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select2" name="admin-role0" size="1" style="width:165px;margin-left:9px;">
					<option value="1" disabled="">超级管理员</option>
				<option value="2">系统管理员</option>
					<option value="3">普通管理员</option>

				</select>
				</span> </div>
				</div>
			</c:when>
			<c:when test="${mm.role=='系统管理员'}">
				<div class="form-group">
					<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
					<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select2" name="admin-role0" size="1" style="width:165px;margin-left:9px;">
					<option value="1" disabled="">超级管理员</option>
					<option value="2" disabled="">系统管理员</option>
					<option value="3">普通管理员</option>
				</select>
				</span> </div>
				</div>
			</c:when>
			<c:when test="${mm.role=='普通管理员'}">
				<div class="form-group">
					<label class="form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</label>
					<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select2" name="admin-role0" size="1" style="width:165px;margin-left:9px;">
					<option value="1" disabled="">超级管理员</option>
					<option value="2" disabled="">系统管理员</option>
					<option value="3" disabled="">普通管理员</option>
				</select>
				</span> </div>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
		</c:if>
</body>
</html>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample_table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"filter":false,   //搜索功能
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});

</script>
<script type="text/javascript">
$(function() { 
	$("#administrator").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
	});
});
//字数限制
function checkLength(which) {
	var maxChars = 100; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
// $(".table_menu_list").width($(window).width()-260);
 // $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	// $(".widget-box").height($(window).height()-215);
	 // $(".table_menu_list").width($(window).width()-260);
	  // $(".table_menu_list").height($(window).height()-215);
	})
 laydate({
    elem: '#start',
    event: 'focus' 
});

/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}
/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*产品-编辑*/


/*产品-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
$('#administrator_ad').on('click', function(){
    alert("您没有权利添加");
})
/*添加管理员*/
function admin_add(mt){
    layer.open({
        type: 1,
        title: '添加管理员',
        maxmin: true,
        shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
        btn:['提交','取消'],
        yes:function(index,layero){
            var num=0;
            var str="";
            $("#add_menber_style input[type$='text']").each(function(n){
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
            if(num>0){  return false;}
            else{
                layer.alert('添加成功！',{
                    title: '提示框',
                    icon:1,
                    yes: function(index){
                        window.location="<%=basePath%>/mg/guanliyuan?manager_telephone="+mt+"";
                        console.log(1);
                        layer.close(index);
                    }
                });
                layer.close(index);
                addman();
            }
        }
    });
}

function addman(){
    // alert(1);
	var juese1;
    var xingming= $("#add_menber_style input[data-shu='xingming']").val();
    var shoujihao=$("#add_menber_style input[data-shu='shoujihao']").val();
    var juese=$("select[name='admin-roleadd']").val();
    var factory=$("select[name='factory']").val();
    var mima=$("#add_menber_style input[data-shu='mima']").val();
    var zhuangtai=$("#add_menber_style input[name='form-field-radio1']:checked").val();
    var shengfenzhenghao="1";
    var nicheng="1";
    if(juese=="1"){
		juese1="超级管理员";
    }else if(juese=="2")
    {
        juese1="系统管理员";
	}else if(juese=="3"){
        juese1="普通管理员";
	}
    // alert("获取成功");

    $.ajax({
        type: "POST",
        url: 'mg/add',
        data: {manager_name:xingming,manager_telephone:shoujihao,role:juese1,password:mima,headpic:zhuangtai,
            manager_IDcard:shengfenzhenghao,manager_nicheng:nicheng,factory:factory},
        dataType:'json',
        cache: false,
        success: function(data){
            console.log("提交过去了");
        }
    });

}

function tishi()
{alert("您没有权利修改")}

/*系统管理员-编辑*/
function admin_edit(obj,pwd,zhuangtai,role,mr,mt){
    var xingming=$(obj).parent().parent().find("td").eq(2).html();
    var shoujihao=$(obj).parent().parent().find("td").eq(3).html();
    var juese=role;
    // alert(juese);
    if(juese=="系统管理员"){
        $("select[name='admin-role0']").val("2");
    }else if(juese=="超级管理员"){
        $("select[name='admin-role0']").val("1");
    }else if(juese=="普通管理员"){
        $("select[name='admin-role0']").val("3");
    }
    // if(juese="超级管理员"){
    //     alert(1);
    //     // alert("是超级管理员")
    //     // $("select[name='admin-role0']").val("1");
    // }else if(juese="系统管理员"){
    //     alert(2);
    //     // alert("是系统管理员");
    //     // $("select[name='admin-role0']").val("2");
    // }else if(juese="普通管理员"){
    //     alert(3);
    //     // $("select[name='admin-role0']").val("3");
    // }
    var mima=pwd;
    var state=zhuangtai;
    // var zhuangtai1=zhuangtai;
	// alert(xingming);
	// alert(shoujihao);
	// alert(juese);
	// alert(zhuangtai1);
    $("#add_menber_style2 input[data-shu='xingming']").val(xingming);
    $("#add_menber_style2 input[data-shu='shoujihao']").val(shoujihao);
    $("#add_menber_style2 input[data-shu='mima']").val(mima);
    if(state=="1"){
        $("input[name='form-field-radio8']:eq(0)").attr("checked",'checked');
    }else if(state=="0")
    {$("input[name='form-field-radio8']:eq(1)").attr("checked",'checked');}

    layer.open({
        type: 1,
        title: '修改管理员信息',
        maxmin: true,
        shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style2'),
        btn:['提交','取消'],
        yes:function(index,layero){
            var num=0;
            var str="";
            $("#add_menber_style2 input[type$='text']").each(function(n){
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
            if(num>0){  return false;}
            else{
                layer.alert('修改成功！',{
                    title: '提示框',
                    icon:1,
                    yes: function(index){
                        window.location="<%=basePath%>/mg/guanliyuan?manager_telephone="+mt+"";
                        console.log(1);
                        layer.close(index);
                    }
                });
                layer.close(index);
                upadmin(mr);

            }
        }
    });
}

function upadmin(mmr){
    var juese1;
    var xingming= $("#add_menber_style2 input[data-shu='xingming']").val();
    var shoujihao=$("#add_menber_style2 input[data-shu='shoujihao']").val();
    var juese=$("select[name='admin-role0']").val();
    var mima=$("#add_menber_style2 input[data-shu='mima']").val();
    var zhuangtai=$("#add_menber_style2 input[name='form-field-radio8']:checked").val();
    var shengfenzhenghao="1";
    var nicheng="1";
    if(juese=="1"){
        juese1="超级管理员";
    }else if(juese=="2")
    {
        juese1="系统管理员";
    }else if(juese=="3"){
        juese1="普通管理员";
    }else{juese1=mmr;}
    // alert("获取成功");
    // alert(xingming);
    // alert(shoujihao);
    // alert(mima);
    // alert(zhuangtai);


    $.ajax({
        type: "POST",
        url: 'mg/update',
        data: {manager_name:xingming,manager_telephone:shoujihao,role:juese1,password:mima,headpic:zhuangtai,
            manager_IDcard:shengfenzhenghao,manager_nicheng:nicheng},
        dataType:'json',
        cache: false,
        success: function(data){
            console.log("提交修改过去的参数");
        }
    });

}

function sousuo(){
    $('#sample_table tbody tr').hide();
    $('#sample_table tbody tr').filter(":contains('" + ($('#sousuo').val()) + "')")
        .show();
};
$('#ss').click(function(){
    sousuo();
});
$('#sousuo').keydown(function(event){
    if(event.keyCode==13){
        sousuo();
    }
});


</script>

