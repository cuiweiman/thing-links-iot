package com.cs.common.core.config.cache;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.codec.JsonJacksonCodec;
import org.redisson.config.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

/**
 * @description: Redisson 配置
 * @author: cuiweiman
 * @date: 2024/3/28 11:15
 */
@Configuration
public class RedissonConfig {

    @Bean
    public RedissonClient redissonClient() throws IOException {
        Config config = Config.fromYAML(
                RedissonConfig.class.getClassLoader().getResource("redisson.yml"));
        // 配置 Jackson 序列化, yaml 配置 codec: !org.redisson.codec.JsonJacksonCodec { } 时会判断 yaml 格式错误，因此代码配置
        config.setCodec(new JsonJacksonCodec());
        return Redisson.create(config);
    }


}
