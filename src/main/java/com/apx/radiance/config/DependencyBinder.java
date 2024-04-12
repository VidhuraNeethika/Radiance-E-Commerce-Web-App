package com.apx.radiance.config;

import com.apx.radiance.service.UserService;
import com.apx.radiance.util.Encryption;
import com.apx.radiance.util.JwtTokenUtil;
import jakarta.inject.Singleton;
import org.glassfish.hk2.utilities.binding.AbstractBinder;

public class DependencyBinder extends AbstractBinder {

    @Override
    protected void configure() {

        System.out.println("DependencyBinder : Running...");

        bind(JwtTokenUtil.class).to(JwtTokenUtil.class).in(Singleton.class);
        bind(Encryption.class).to(Encryption.class).in(Singleton.class);
        bind(UserService.class).to(UserService.class).in(Singleton.class);

    }

}
