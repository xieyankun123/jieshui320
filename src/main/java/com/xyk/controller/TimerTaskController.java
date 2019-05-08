//package com.xyk.controller;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.xyk.model.*;
//import com.xyk.service.*;
//import com.xyk.util.DateUtil;
//import org.omg.Messaging.SYNC_WITH_TRANSPORT;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Controller;
//
//import javax.annotation.Resource;
//import java.io.BufferedReader;
//import java.io.DataOutputStream;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.text.DecimalFormat;
//import java.util.List;
//import java.util.concurrent.CountDownLatch;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//import java.util.stream.Collectors;
//
//import static com.xyk.controller.yqController.connection;
//
//@Controller
//@Component
//public class TimerTaskController {
//    @Resource
//    private apdataService as;
//    @Resource
//    private apService apservice;
//    @Resource
//    private yqService ys;
//    @Resource
//    private u_rService ur;
//    @Resource
//    private userService userservice;
//    @Resource
//    private apdataService ads;
//   @Scheduled(cron = "0 0 * * * ?")
//   public void gethourValue()
//   {
//       DateUtil date = new DateUtil();
//       String dt=date.getTime();
//       List<UserModel> userlist=userservice.selbystate("1");
//       for(int i=0;i<userlist.size();i++)
//       {
//           String factory=userlist.get(i).getFactory();
//           List<u_rModel> u_rModels = ur.selbyUtel(userlist.get(i).getUser_telephone());
//           String a1=u_rModels.get(u_rModels.size()-1).getRoom_id();
//           StringBuffer a2=new StringBuffer(a1);
//           a2.setCharAt(4,'0');
//           String a3=a2.toString();
//           List<yqModel> yqModels = ys.selbyRid(a3).stream().filter(k->k.getFactory().equals(factory)).collect(Collectors.toList());
//           List<yqModel> yqModels1=ys.selbyRid(a1).stream().filter(k->k.getFactory().equals(factory)).collect(Collectors.toList());
//           DecimalFormat df = new DecimalFormat("0.00");
//           if(yqModels.size()==0){}
//           else
//           {
//               for(int j=0;j<yqModels.size();j++)
//               {
//                   apdataModel ap=new apdataModel();
//                   String apparatus_id=yqModels.get(j).getId();
//                   String name=userlist.get(i).getUser_telephone();
//                   List<apdataModel> apdata1 = ads.selbynameP(name,apparatus_id);
//                   double sum = 0;
//                   for (int k= 0; k< apdata1.size(); k++) {
//                       double value = Double.parseDouble(apdata1.get(k).getValue());
//                       sum = sum + value / (30 * 1000);
//                   }
//                   String ssum=df.format(sum);
//                   ap.setName(name);
//                   ap.setApparatus_id(apparatus_id);
//                   ap.setValue(ssum);
//                   ap.setTime(dt);
//                   ap.setFactory(factory);
//                   ads.addhour(ap);
//               }}
//           if(yqModels1.size()==0){}
//           else
//           {
//               for(int j=0;j<yqModels1.size();j++)
//               {
//                   apdataModel ap=new apdataModel();
//                   String apparatus_id=yqModels1.get(j).getId();
//                   String name=userlist.get(i).getUser_telephone();
//                   List<apdataModel> apdata1 = ads.selbynameP(name,apparatus_id);
//                   double sum = 0;
//                   for (int k= 0; k< apdata1.size(); k++) {
//                       double value = Double.parseDouble(apdata1.get(k).getValue());
//                       sum = sum + value / (30 * 1000);
//                   }
//                   String ssum=df.format(sum);
//                   ap.setName(name);
//                   ap.setApparatus_id(apparatus_id);
//                   ap.setValue(ssum);
//                   ap.setTime(dt);
//                   ap.setFactory(factory);
//                   ads.addhour(ap);
//               }}
//       }
//   }
//    @Scheduled(cron = "0 59 23 * * ?")
//    public void getdayValue()
//    {
//            final List<yqModel> yqmodels=ys.list();
//        //创建一个线程池
//        ExecutorService exec= Executors.newCachedThreadPool();
//        //闭锁
//        final CountDownLatch countDownLatch=new CountDownLatch(yqmodels.size());
//            for(int j=0;j<yqmodels.size();j++)
//            {
//                final int i=j;
//                exec.execute(new Runnable() {
//                    @Override
//                    public void run() {
//                        if(yqmodels.get(i).getUseable().equals("1"))
//                            System.out.println("meibiyao");
//                            //每个一段时间你想要做的事
//                            //连接服务器
//                        else
//                        {
//                            try {
//                                apdataModel am = new apdataModel();
//                                HttpURLConnection connection = connection("http://ss1.chakonger.net.cn/web/deviceqry");
//                                DataOutputStream out = new DataOutputStream(
//                                        connection.getOutputStream());
//                                if(yqmodels.get(i).getDevID().matches("[0-9]{1,}") ){
//                                    JSONObject obj = new JSONObject();
//                                    obj.put("sessionID",yqmodels.get(i).getSessionID());
//                                    obj.put("devID", yqmodels.get(i).getDevID());
//                                    // 向腾讯请求传入编码为UTF-8格式的json数据
//                                    out.write(obj.toString().getBytes("UTF-8"));
//                                    out.flush();
//                                    out.close();
//                                    //获得服务器返回的结果
//                                    BufferedReader reader = new BufferedReader(new InputStreamReader(
//                                            connection.getInputStream()));
//                                    String lines;
//                                    StringBuffer sb = new StringBuffer();
//                                    while ((lines = reader.readLine()) != null) {
//                                        sb.append(lines);
//                                    }
//                                    reader.close();
//                                    connection.disconnect(); // 销毁连接
//                                    JSONObject js = JSON.parseObject(sb.toString());
//                                    if(js.getString("errmsg").equals("success")==false)
//                                        System.out.println("仪器没有连接网络");
//                                    else {
//                                        DateUtil date = new DateUtil();
//                                        am.setApparatus_id(yqmodels.get(i).getId());
//                                        String dat = date.getDay();
//                                        am.setTime(dat);
//                                        String val = js.getString("socketOut_W");
//                                        am.setValue(val);
//                                        if(ur.selbyRid(yqmodels.get(i).getRoom_id()).size()==0){}
//                                        else {
//                                            am.setName(ur.selbyRid(yqmodels.get(i).getRoom_id()).get(ur.selbyRid(yqmodels.get(i).getRoom_id()).size() - 1).getUser_telephone());
//                                        }
//                                        as.add(am);
//                                    }
//                                }
//                                else
//                                {
//                                    //System.out.println("无效的仪器");
//                                }
//                            } catch (Exception e) {
//                                e.printStackTrace();
//                            }}
//                        countDownLatch.countDown();
//                    }
//                });
//        }
//        try {
//            countDownLatch.await();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        exec.shutdown();
//            System.out.println("jieshu");
//    }
//  @Scheduled(cron = "0 59 23 * * ?")
//    public void getValue0()
//    {
//        DateUtil date = new DateUtil();
//        String dt=date.getDay();
//        List<UserModel> userlist=userservice.selbystate("1");
//        for(int i=0;i<userlist.size();i++)
//        {
//            String factory=userlist.get(i).getFactory();
//            List<u_rModel> u_rModels = ur.selbyUtel(userlist.get(i).getUser_telephone());
//            String a1=u_rModels.get(u_rModels.size()-1).getRoom_id();
//            StringBuffer a2=new StringBuffer(a1);
//            a2.setCharAt(4,'0');
//            String a3=a2.toString();
//            List<yqModel> yqModels = ys.selbyRid(a3).stream().filter(k->k.getFactory().equals(factory)).collect(Collectors.toList());
//           List<yqModel> yqModels1=ys.selbyRid(a1).stream().filter(k->k.getFactory().equals(factory)).collect(Collectors.toList());
//            DecimalFormat df = new DecimalFormat("0.00");
//            if(yqModels.size()==0){}
//            else
//            {
//            for(int j=0;j<yqModels.size();j++)
//            {
//               apdataModel ap=new apdataModel();
//                String apparatus_id=yqModels.get(j).getId();
//                String name=userlist.get(i).getUser_telephone();
//                List<apdataModel> apdata1 = ads.selbynameP(name,apparatus_id);
//                double sum = 0;
//                for (int k= 0; k< apdata1.size(); k++) {
//                    double value = Double.parseDouble(apdata1.get(k).getValue());
//                    sum = sum + value / (30 * 1000);
//                }
//                String ssum=df.format(sum);
//                ap.setName(name);
//                ap.setApparatus_id(apparatus_id);
//                ap.setValue(ssum);
//                ap.setFactory(factory);
//                ap.setTime(dt);
//                ads.add0(ap);
//            }}
//            if(yqModels1.size()==0){}
//            else
//            {
//                for(int j=0;j<yqModels1.size();j++)
//                {
//                    apdataModel ap=new apdataModel();
//                    String apparatus_id=yqModels1.get(j).getId();
//                    String name=userlist.get(i).getUser_telephone();
//                    List<apdataModel> apdata1 = ads.selbynameP(name,apparatus_id);
//                    double sum = 0;
//                    for (int k= 0; k< apdata1.size(); k++) {
//                        double value = Double.parseDouble(apdata1.get(k).getValue());
//                        sum = sum + value / (30 * 1000);
//                    }
//                    String ssum=df.format(sum);
//                    ap.setName(name);
//                    ap.setApparatus_id(apparatus_id);
//                    ap.setValue(ssum);
//                    ap.setFactory(factory);
//                    ap.setTime(dt);
//                    ads.add0(ap);
//                }}
//        }
//    }
//    @Scheduled(cron = "0 0/2 * * * ?")
//    public void getPower()
//    {
//        final List<yqModel> yqmodels=ys.list();
//        ExecutorService executorService=Executors.newCachedThreadPool();
//        final CountDownLatch countDownLatch=new CountDownLatch(yqmodels.size());
//        for(int j=0;j<yqmodels.size();j++) {
//            String factory=yqmodels.get(j).getFactory();
//            final int i=j;
//            //每个一段时间你想要做的事
//            //连接服务器
////            if (yqmodels.get(i).getUseable().equals("0") || yqmodels.get(i).getUseable().equals("1")) {
////                System.out.println("meibiyaoceshi");
////            }
////            else {
//            executorService.execute(new Runnable() {
//                @Override
//                public void run() {
//                    try {
//                        apdataModel am = new apdataModel();
//                        HttpURLConnection connection = connection("http://ss1.chakonger.net.cn/web/deviceqry");
//                        DataOutputStream out = new DataOutputStream(
//                                connection.getOutputStream());
//                        if (yqmodels.get(i).getDevID().matches("[0-9]{1,}")) {
//                            JSONObject obj = new JSONObject();
//                            obj.put("sessionID", yqmodels.get(i).getSessionID());
//                            obj.put("devID", yqmodels.get(i).getDevID());
//                            // 向腾讯请求传入编码为UTF-8格式的json数据
//                            out.write(obj.toString().getBytes("UTF-8"));
//                            out.flush();
//                            out.close();
//                            //获得服务器返回的结果
//                            BufferedReader reader = new BufferedReader(new InputStreamReader(
//                                    connection.getInputStream()));
//                            String lines;
//                            StringBuffer sb = new StringBuffer();
//                            while ((lines = reader.readLine()) != null) {
//                                sb.append(lines);
//                            }
//                            reader.close();
//                            connection.disconnect(); // 销毁连接
//                            JSONObject js = JSON.parseObject(sb.toString());
//                            if (js.getString("errmsg").equals("success") == false)
//                                System.out.println("仪器没有连接网络");
//                            else {
//                                DateUtil date = new DateUtil();
//                                am.setApparatus_id(yqmodels.get(i).getId());
//                                String dat = date.getTime();
//                                am.setTime(dat);
//                                String val = js.getString("socketOut_P");
////                            if (val.equals("0")) {
////                                //System.out.println("无效数据，丢了丢了");
////                            } else {
//                                am.setValue(val);
//                                am.setFactory(factory);
//                                if(apservice.selbyid(yqmodels.get(i).getId()).size()==0)
//                                {}
//                                else {
//                                    List<ApModel> collect= apservice.selbyid(yqmodels.get(i).getId()).stream().filter(k -> k.getFactory().equals(factory)).collect(Collectors.toList());
//                                    String name =collect.get(collect.size()-1).getUser_name_on();
//                                    am.setName(name);
//                                }
//                                as.addP(am);
//                                // }
//                            }
//                        } else {
//                            // System.out.println("无效的仪器");
//                        }
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                    countDownLatch.countDown();
//                }
//            });
//            //}
//        }
//        try {
//            countDownLatch.await();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        executorService.shutdown();
//        System.out.println("jieshu");
//    }
//    @Scheduled(cron = "0 1 0 * * ?")
//    public void cleardata(){
//       try {
//           ads.del();
//       }
//       catch (Exception e)
//       {
//           System.out.println("删除不成功");
//       }
//    }
//}
