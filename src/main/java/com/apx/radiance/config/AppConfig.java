package com.apx.radiance.config;

import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

public class AppConfig extends ResourceConfig {

    public AppConfig(){
        packages("com.apx.radiance.controller"); // package to scan for resources
        packages("com.apx.radiance.middleware");

        register(JspMvcFeature.class); // register JSP MVC feature. it is required to use JSP as view template engine in the application.
        register(MultiPartFeature.class); // register MultiPartFeature to enable file upload feature in the application.
        property(JspMvcFeature.TEMPLATE_BASE_PATH,"/WEB-INF/views"); // set the base path of JSP files
        register(DependencyBinder.class); // register DependencyBinder to bind the dependencies
    }

}
