package com.apx.radiance.config;

import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

public class AppConfig extends ResourceConfig {

    public AppConfig(){
        packages("com.apx.radiance.controller"); // package to scan for resources
        packages("com.apx.radiance.middleware");

        register(JspMvcFeature.class);
        register(MultiPartFeature.class);
        property(JspMvcFeature.TEMPLATE_BASE_PATH,"/WEB-INF/views");
        register(DependencyBinder.class);
    }

}
