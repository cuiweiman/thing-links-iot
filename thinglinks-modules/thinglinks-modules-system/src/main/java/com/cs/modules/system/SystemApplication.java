package com.cs.modules.system;

import com.alibaba.druid.spring.boot3.autoconfigure.DruidDataSourceAutoConfigure;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Optional;

/**
 * SpringBootApplication(exclude = DruidDataSourceAutoConfigure.class)
 * druid-3 和 dynamic-datasource-boot3 冲突，这里排除 druid 的数据源自动配置，使用 MybatisPlus 的
 *
 * @description: 系统模块
 * @author: cuiweiman
 * @date: 2024/3/26 17:07
 */
@Slf4j
@MapperScan(value = "com.cs.modules.system.mapper")
@SpringBootApplication(exclude = DruidDataSourceAutoConfigure.class)
public class SystemApplication {

    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(SystemApplication.class, args);
        applicationContext.registerShutdownHook();
        ConfigurableEnvironment environment = applicationContext.getEnvironment();

        String jdkVm = (String) environment.getSystemProperties().get("java.vm.name");
        String jdkVersion = (String) environment.getSystemProperties().get("java.version");
        String appName = environment.getProperty("spring.application.name");
        String pid = (String) environment.getSystemProperties().get("PID");
        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = environment.getProperty("server.port", "8080");
        String path = Optional.ofNullable(environment.getProperty("server.servlet.context-path")).orElse("");
        /*
         * 监控页面报404，主要是因为springboot3.0使用Jakarta EE 10，从 Java EE 变更为 Jakarta EE，
         * 包名以 javax开头的需要相应地变更为jakarta，如javax.servlet.*，修改为jakarta.servlet.*。
         * 目前Druid最新版本 1.2.18 仍使用javax的旧包，故无法使用，需要等Druid官方升级后方可使用。
         */
        log.info("""
                                
                -------------------------------------------------------------
                    JDK version: %s %s
                    应用 %s 启动成功!  (^_^)  PID: %s
                    访问链接:
                        Knife4j 接口文档:   http://%s:%s%s/doc.html
                        Druid 数据库监控:    http://%s:%s%s/druid/index.html
                -------------------------------------------------------------
                """.formatted(jdkVm, jdkVersion, appName, pid, ip, port, path, "127.0.0.1", port, path)
        );
    }
}
