/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import bean.Manager;
import java.io.IOException;
import javax.faces.application.ResourceHandler;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author
 */
@WebFilter("/faces/manager/*")
public class ManagerFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        boolean resourceRequest = req.getRequestURI().startsWith(req.getContextPath() + "/faces" + ResourceHandler.RESOURCE_IDENTIFIER);
        boolean imageResources = req.getRequestURI().endsWith("png") || req.getRequestURI().endsWith("jpg");
        Manager user = (Manager) session.getAttribute("connectedManager");
        try {
            if ((user != null && user.getLogin() != null) || req.getRequestURI().endsWith("Login.xhtml") || req.getRequestURI().endsWith("/") || resourceRequest || imageResources) {
                chain.doFilter(request, response);
            } else {
                HttpServletResponse res = (HttpServletResponse) response;
                res.sendRedirect(req.getContextPath()+"/faces/manager/Login.xhtml");
                return;
            }
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {
    }
}
