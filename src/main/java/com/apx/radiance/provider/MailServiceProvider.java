package com.apx.radiance.provider;

import java.util.Properties;
import java.util.concurrent.*;

import com.apx.radiance.mail.Mailable;
import com.apx.radiance.util.Env;
import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

public class MailServiceProvider {

    private ThreadPoolExecutor executor;

    private Authenticator authenticator;

    private static MailServiceProvider mailServiceProvider;

    private Properties properties = new Properties();

    private BlockingQueue<Runnable> blockingQueue = new LinkedBlockingQueue<>();

    private MailServiceProvider() {
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", Env.get("mail.host"));
        properties.put("mail.smtp.port", Env.get("mail.port"));
    }

    public static MailServiceProvider getInstance() {
        if (mailServiceProvider == null) {
            mailServiceProvider = new MailServiceProvider();
        }
        return mailServiceProvider;
    }

    public void start() {

        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Env.get("mail.username"), Env.get("mail.password"));
            }
        };

        executor = new ThreadPoolExecutor(2, 5, 5,
                TimeUnit.SECONDS, blockingQueue, new ThreadPoolExecutor.AbortPolicy());
        executor.prestartCoreThread();
        System.out.println("MailServiceProvider : Running...");

    }

    public void sendMail(Mailable mailable){
        blockingQueue.offer(mailable);
    }

    public Properties getProperties() {
        return properties;
    }

    public Authenticator getAuthenticator() {
        return authenticator;
    }

    public void shutDown() {
        if (executor != null) {
            executor.shutdown();
        }
    }

}
