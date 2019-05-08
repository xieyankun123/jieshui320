package com.xyk.Interceptor;

import java.net.InetAddress;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xyk.model.managerModel;
import com.xyk.util.Cons;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * @description 利用spring框架提供的HandlerInterceptorAdapter，实现自定义拦截器
 */
@Slf4j
public class UserLoginInterceptorBySpring extends HandlerInterceptorAdapter {
    // 在业务处理器处理请求之前被调用
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // equalsIgnoreCase 与 equals的区别？
        if ("GET".equalsIgnoreCase(request.getMethod())) {
            //RequestUtil.saveRequest();
        }
        log.info("正在拦截");
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());
        managerModel attribute = (managerModel) request.getSession().getAttribute(Cons.MANAGER);
        Cookie[] cookies = request.getCookies();
        managerModel m = null;
        try {
            for (Cookie c : cookies) {
                if ("sessionid".equals(c.getName())) {
                    //cookie解码
                    String decode = URLDecoder.decode(c.getValue(), "UTF-8");
                    m = new managerModel(decode);
                    log.info("找到cookie了");
                    break;                }
            }
        }
        catch (Exception e)
        { request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        log.info("cookie异常，返回到的登录界面");
            return false;
        }
        if(null==m&&null==attribute)
        {
            // 跳转到登录页面 请求转发
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            log.info("cookie和session不存在管理员信息,返回登录页面");
            return false;

        }
        else if (m!=null&&null==attribute) {
                log.info("cookie存在,session不存在,单点登录成功");
               request.getSession().setAttribute(Cons.MANAGER,m);
                return true;

        } else {
            try {
                log.info(attribute.getManager_telephone()+m.getManager_telephone());
            }
            catch (Exception e)
            {
                log.info(attribute.getManager_telephone()+"m为空");
            }
            log.info("已经设置session了,登录成功");
//            if (request.getRequestURI().equals("/mg/index")) {
//
//            }
            return true;
        }
}
    // 在业务处理器处理请求完成之后，生成视图之前执行
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }
    // 在DispatcherServlet完全处理完请求之后被调用，可用于清理资源
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        if (request.getRequestURL().substring(request.getContextPath().length()).contains("mg/index")) {
            managerModel attribute = (managerModel)request.getSession().getAttribute(Cons.MANAGER);
            String ip = "";
            if (request.getHeader("x-forwarded-for") == null) {
                ip = request.getRemoteAddr();
            } else {
                ip = request.getHeader("x-forwarded-for");
            }
            System.out.println(attribute.getManager_telephone() + "在" + new Date() + "登陆了" + "ip为" + ip);
        }
    }
}

