package com.apx.radiance.listener;

import com.apx.radiance.provider.MailServiceProvider;
import com.apx.radiance.util.AppUtil;
import com.apx.radiance.util.Env;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ServletContext context = sce.getServletContext();
        context.setAttribute("BASE_URL", context.getContextPath() + "/");

        context.setAttribute("App", new AppUtil(context));

        Env.getProperties().put("app_url","http://localhost:8080"+context.getContextPath());
        MailServiceProvider.getInstance().start();

        System.out.println("ContextListener : Running...");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        MailServiceProvider.getInstance().shutDown();
    }
}
