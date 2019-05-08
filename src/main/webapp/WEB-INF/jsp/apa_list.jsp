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
        <link href="static/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="static/css/style.css"/>
        <link href="static/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="static/assets/css/ace.min.css" />
        <link rel="stylesheet" href="static/assets/css/font-awesome.min.css" />
      <script src="static/assets/js/jquery.min.js"></script>
    <script src="static/assets/js/bootstrap.min.js"></script>
    <script src="static/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="static/assets/js/jquery.dataTables.min.js"></script>
    <script src="static/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="static/js/H-ui.js"></script>
        <script type="text/javascript" src="static/js/H-ui.admin.js"></script>
        <script src="static/assets/layer/layer.js" type="text/javascript" ></script>
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
<title>水表列表</title>
</head>

<body>
<div class="page-content clearfix">

    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
          <%--1搜索--%>
        <div class="search_style">
     
        <ul class="search_content clearfix">
             <li><label class="l_f"></label><input name="" type="text"  class="text_add" id="sousuo" placeholder="输入水表地址"  style=" width:250px"/></li>
             <li style="width:90px;"><button type="button" class="btn_search" id="ss"><i class="icon-search"></i>查询</button></li>
        </ul>
        </div>
       <%--2搜索--%>
              <div style="vertical-align:top;">
                  <a class="btn btn-mini btn-light"  title="导出到EXCEL">
                      点击下载该表格
                      <i id="nav-search-icon" class="icon-download-alt"></i>
                  </a>
              </div>

     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
        <thead>
         <tr>
             <th width="80">水表编号</th>
            <th width="60">水表地址</th>
             <th width="80">水表名</th>
             <th width="80">经纬度</th>
            <th width="70">状态</th>
             <th width="70">公司</th>
             <th width="70">上传频率</th>
             <th width="70">末次拍摄时间</th>
            <th width="100">操作</th>
         </tr>
         </thead>
        <tbody>
<c:if test="${!empty apalist }">
    <c:forEach items="${apalist}" var="apa">
            <tr>
                  <td><a onclick="showpic('${apa.apartment_id}')" title="点击查看水表对应二维码" style="cursor: pointer">${apa.apartment_id}</a></td>
                  <td>${apa.location}</td>
                <td>${apa.owner}</td>
                <td>(${apa.longitude},${apa.latitude})</td>

                    <c:choose>
                        <c:when test="${apa.useable=='0'}">
                            <td><span class="zhuangtai" id="kongxian">已停用</span></td>
                        </c:when>
                        <c:when test="${apa.useable=='1'}">
                            <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        </c:when>
                    </c:choose>
                    <td >${apa.factory}</td>
                    <td >${apa.intervall}</td>
                    <td >${apa.lasttime}</td>
                  <td class="td-manage">
                  <a title="编辑" onclick="apa_edit(this,'${apa.useable}','${apa.id}','${apa.longitude}','${apa.latitude}')"  href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                  </td>
            </tr>
    </c:forEach>
</c:if>
        </tbody>
    </table>
   </div>

 <%--1添加--%>
     <div class="border clearfix" style="border:0px">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加水表</a>
       </span>
     </div>
 <%--2添加--%>
  </div>
 </div>


    <%--1添加水表图层--%>
    <div class="add_menber" id="add_menber_style" style="display:none">
        <ul class=" page-content">

            <%--<li><label class="label_name">水表编号：</label><span class="add_name">--%>
                <%--<input value="" name="编号" type="text" data-shu='bianhao' class="text_add"/></span><div class="prompt r_f"></div>--%>
            <%--</li>--%>
            <li><label class="label_name">水表地址：</label><span class="add_name">
                <input value="" name="地址" type="text" data-shu='dizhi' class="text_add"/></span><div class="prompt r_f"></div>
            </li>
            <li><label class="label_name">水&nbsp;表&nbsp;名：</label><span class="add_name">
                <input value="" name="水表名" type="text" data-shu='fangdong' class="text_add"/></span><div class="prompt r_f"></div>
            </li>

                <li><label class="label_name">经&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度：</label>
                    <span class="add_name">
                        <input value="" name="经度" type="text" data-shu='jingdu' class="text_add"
                               onBlur="if(!/^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/.test(this.value)){alert('经度范围：-180~180（只支持保留小数点后六位）');this.value='';}" />
                    </span>
                    <div class="prompt r_f"></div>
                </li>

                <li><label class="label_name">维&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度：</label>
                    <span class="add_name">
                        <input value="" name="维度" type="text" data-shu='weidu' class="text_add"
                               onBlur="if(!/^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/.test(this.value)){alert('纬度范围：-90~90（只支持保留小数点后六位）');this.value='';}" />
                    </span>
                    <div class="prompt r_f"></div>
                </li>

            <%--<li><label class="label_name">经纬度：</label><span class="add_name">--%>
            <%--<input value="" name="经纬度" type="text" data-shu='jingweidu' class="text_add"/></span><div class="prompt r_f"></div>--%>
            <%--</li>--%>
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

                <li><label class="label_name">拍照频率：</label><span class="add_name">
                <input value="" name="拍照频率" type="text" data-shu='pinglv' class="text_add"/></span><div class="prompt r_f"></div>
                </li>

                <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
                    <label><input name="form-field-radio1" type="radio" checked="checked" class="ace" value="1"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
                    <label><input name="form-field-radio1" type="radio" class="ace" value="0"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div>
                </li>
        </ul>
    </div>
    <%--2添加图层--%>

    <!--编辑房源图层-->
    <div class="add_menber" id="add_menber_style2" style="display:none">
        <ul class=" page-content">

            <li><label class="label_name">水表编号:</label><span class="add_name">
                <input value="" name="水表编号" type="text" data-shu='bianhao2' class="text_add" readonly/></span><div class="prompt r_f"></div>
            </li>
            <li><label class="label_name">水表地址：</label><span class="add_name">
                <input value="" name="水表地址" type="text" data-shu='dizhi2' class="text_add"/></span><div class="prompt r_f"></div>
            </li>
            <li><label class="label_name">水表名：</label><span class="add_name">
                <input value="" name="水表名" type="text" data-shu='fangdong2' class="text_add"/></span><div class="prompt r_f"></div>
            </li>

            <li><label class="label_name">经&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度：</label>
                <span class="add_name">
                        <input value="" name="经度" type="text" data-shu='jingdu' class="text_add"
                               onBlur="if(!/^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/.test(this.value)){alert('经度范围：-180~180（只支持保留小数点后六位）');this.value='';}" />
                    </span>
                <div class="prompt r_f"></div>
            </li>

            <li><label class="label_name">维&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度：</label>
                <span class="add_name">
                        <input value="" name="维度" type="text" data-shu='weidu' class="text_add"
                               onBlur="if(!/^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/.test(this.value)){alert('纬度范围：-90~90（只支持保留小数点后六位）');this.value='';}" />
                    </span>
                <div class="prompt r_f"></div>
            </li>

            <li><label class="label_name">拍照频率：</label><span class="add_name">
                <input value="" name="拍照频率" type="text" data-shu='pinglv' class="text_add"/></span><div class="prompt r_f"></div>
            </li>
            <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
                <label><input name="form-field-radio2" type="radio" checked="checked" class="ace" value="1"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
                <label><input name="form-field-radio2" type="radio" class="ace" value="0"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div>
            </li>
        </ul>
    </div>
    <%--编辑图层--%>

    <%--查看二维码--%>
    <div id="paizhaotupiao" style="display:none">
        <div class="kuang">
            <div class="tu" style="width:300px">
                <%--<div class="tishi_wenzi">二维码</div>--%>
                <img style="width:100%" src="../uploadpic/head_pic/1e5096f2f8394c5d99bde1ee8b27a5e0.png">
            </div>
        </div>
    </div>



</div>



</body>
</html>
<script>
    jQuery(function($) {
        // dataTable表格插件控制表格排序
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[ 0, "asc" ]],//默认第几个排序
            //   "bStateSave": true,//状态保存
            "paging":   true,  //分页功能
            "filter":false,   //搜索功能
            "bAutoWidth":false,
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8]}// 制定列不参与排序
            ]
        });


        // ----------搜索函数
        function sousuo(){
            $('#sample-table tbody tr').hide();
            $('#sample-table tbody tr').filter(":contains('" + ($('#sousuo').val()) + "')")
                .show();
            // window.location="/we/apa_list";
        };
        $('#ss').click(function(){
            sousuo();

        });
        $('#sousuo').keydown(function(event){
            if(event.keyCode==13){
                sousuo();
            }
        });
// 搜索函数----------

        //添加水表-----
        $('#member_add').on('click', function(){
            layer.open({
                type: 1,
                title: '添加水表',
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
                                window.location="<%=basePath%>/apartment/apa_list";
                                // console.log(1);
                                layer.close(index);
                            }
                        });
                        layer.close(index);
                        addapa();
                    }
                }
            });
        });

    })





        // 添加公寓函数
        function addapa(){
            // var bianhao= $("#add_menber_style input[data-shu='bianhao']").val();
            var dizhi=$("#add_menber_style input[data-shu='dizhi']").val();
            var fangdong=$("#add_menber_style input[data-shu='fangdong']").val();
            var jingdu = $("#add_menber_style input[data-shu='jingdu']").val();
            var weidu = $("#add_menber_style input[data-shu='weidu']").val();
            var zhuangtai=$("#add_menber_style input[name='form-field-radio1']:checked").val();
            var factory =$("select[name='factory']").val();
            var pinglv = $("#add_menber_style input[data-shu='pinglv']").val();

            $.ajax({
                type: "POST",
                url: 'apartment/add',
                data: {location:dizhi,owner:fangdong,useable:zhuangtai,factory:factory,
                    longitude:jingdu,latitude:weidu,intervall:pinglv},
                dataType:'json',
                cache: false,
                success: function(data){
                    console.log("success");
                }
            });

        }



        //------编辑
    function apa_edit(obj,zhuangtai,id,jingdu,weidu){
        var zhuangtai1=zhuangtai;
        var bianhao=$(obj).parent().parent().find("td").eq(0).text();
        var dizhi=$(obj).parent().parent().find("td").eq(1).html();
        var shuibiaoming=$(obj).parent().parent().find("td").eq(2).html();
        // var s =$(obj).parent().parent().find("td").eq(3).html();  //经纬度
        var gongsi=$(obj).parent().parent().find("td").eq(5).html();
        var pinglv=$(obj).parent().parent().find("td").eq(6).html();
        $("#add_menber_style2 input[data-shu='bianhao2']").val(bianhao);
        $("#add_menber_style2 input[data-shu='dizhi2']").val(dizhi);
        $("#add_menber_style2 input[data-shu='fangdong2']").val(shuibiaoming);
        // $("#add_menber_style2 input[data-shu='jingweidu']").val(s);
        $("#add_menber_style2 input[data-shu='jingdu']").val(jingdu);
        $("#add_menber_style2 input[data-shu='weidu']").val(weidu);
        $("#add_menber_style2 input[data-shu='pinglv']").val(pinglv);
        // $("#add_menber_style2 input[data-shu='gongsi2']").val(gongsi);
        if(zhuangtai1=="1"){
            // alert("状态为1启用");
            $("input[name='form-field-radio2']:eq(0)").attr("checked",'checked');
        }else if(zhuangtai1==0)
        {$("input[name='form-field-radio2']:eq(1)").attr("checked",'checked');}
        layer.open({
            type: 1,
            title: '修改水表信息',
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
                            window.location="<%=basePath%>/apartment/apa_list";
                            console.log("跳转");
                            layer.close(index);
                        }
                    });
                    layer.close(index);
                    upapa(gongsi,id);
                }
            }
        });
    }


    function upapa(factory,id){
        var bianhao2= $("#add_menber_style2 input[data-shu='bianhao2']").val();
        var dizhi2=$("#add_menber_style2 input[data-shu='dizhi2']").val();
        var fangdong2=$("#add_menber_style2 input[data-shu='fangdong2']").val();
        // var s=$("#add_menber_style2 input[data-shu='jingweidu']").val();
        var jingdu =$("#add_menber_style2 input[data-shu='jingdu']").val();
        var weidu =$("#add_menber_style2 input[data-shu='weidu']").val();
        var zhuangtai2=$("#add_menber_style2 input[name='form-field-radio2']:checked").val();
        var pinglv=$("#add_menber_style2 input[data-shu='pinglv']").val();

        console.log("提取获取了更新的数据");
        // if(s.indexOf(",")!= -1 ){
        //     var l = s.split(",");
        //     var l1 = l[0].substr(1);
        //     var l2 =l[1].substr(0, (l[1].length-1) );
        // }else {
        //     var l = s.split("，");
        //     var l1 = l[0].substr(1);
        //     var l2 =l[1].substr(0, (l[1].length-1) );
        // }
        $.ajax({
            type: "POST",
            url: 'apartment/update',
            data: {apartment_id:bianhao2,location:dizhi2,owner:fangdong2,useable:zhuangtai2,factory:factory,id:id,longitude:jingdu,latitude:weidu,intervall:pinglv},
            dataType:'json',
            cache: false,
            success: function(data){
                console.log("success");
            }
        });

    }
    // 编辑------


    //点击查看二维码函数
    function showpic(bianhao){
        var lv = "http://139.199.82.86:8080/jieshui/uploadpic/head_pic/"+bianhao+".png";
        // alert(bianhao);
        $('#paizhaotupiao img').attr('src',lv);
        layer.open({
            type: 1,
            title: "水表二维码",
            content: $('#paizhaotupiao'),
            area: ['300px']
        });
    }

</script>