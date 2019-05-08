jQuery(function($) {

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

//添加公寓-----
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
                            window.location="http://139.199.82.86:8080/jieshui/apartment/apa_list";
                            console.log(1);
                            layer.close(index);
                        }
                    });
                    layer.close(index);
                    addapa();
                }
            }
        });
    });

    // 添加公寓函数
    function addapa(){
        // var bianhao= $("#add_menber_style input[data-shu='bianhao']").val();
        var dizhi=$("#add_menber_style input[data-shu='dizhi']").val();
        var fangdong=$("#add_menber_style input[data-shu='fangdong']").val();
        var zhuangtai=$("#add_menber_style input[name='form-field-radio1']:checked").val();
        var factory =$("select[name='factory']").val();
        // alert("获取成功");
        // alert(bianhao)
        // alert(dizhi)
        // alert(fangdong);
        // alert(zhuangtai);
        $.ajax({
            type: "POST",
            url: 'apartment/add',
            data: {location:dizhi,owner:fangdong,useable:zhuangtai,factory:factory},
            dataType:'json',
            cache: false,
            success: function(data){
                console.log("success");
            }
        });

    }

//添加公寓-----------





})