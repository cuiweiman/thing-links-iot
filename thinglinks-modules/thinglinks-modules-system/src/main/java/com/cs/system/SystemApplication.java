package com.cs.system;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Optional;

/**
 * @description: 系统模块
 * @author: cuiweiman
 * @date: 2024/3/26 17:07
 */
@Slf4j
@SpringBootApplication
public class SystemApplication {

    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(SystemApplication.class, args);
        ConfigurableEnvironment environment = applicationContext.getEnvironment();

        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = environment.getProperty("server.port", "880");
        String path = Optional.ofNullable(environment.getProperty("server.servlet.context-path")).orElse("");
        String jdkVersion = (String) environment.getSystemProperties().get("java.version");
        String jdkVm = (String) environment.getSystemProperties().get("java.vm.name");
        String pid = (String) environment.getSystemProperties().get("PID");

        String appName = environment.getProperty("spring.application.name");

        log.info("\n-------------------------------------------------------------\n"
                + "\t JDK version: {} {} \n" + "\t 应用 '{}' 启动成功!  (^_^)  PID: {} \n"
                + "\t Swagger文档: \t\t http://{}:{}/swagger-ui.html\n"
                + "\t 数据库监控: \t\t http://{}:{}/druid\n",
                jdkVm, jdkVersion, appName, pid, ip, port, "127.0.0.1", port);

    }
}
