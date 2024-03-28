package com.cs.common.core.config.datasource;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.MybatisConfiguration;
import com.baomidou.mybatisplus.core.config.GlobalConfig;
import com.baomidou.mybatisplus.extension.MybatisMapWrapperFactory;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.OptimisticLockerInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.baomidou.mybatisplus.extension.spring.MybatisSqlSessionFactoryBean;
import org.apache.ibatis.session.LocalCacheScope;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

/**
 * @description: 数据源配置
 * @author: cuiweiman
 * @date: 2024/3/27 17:14
 */
@Configuration
public class MybatisPlusConfig {

    @Bean("sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource, GlobalConfig globalConfig) throws Exception {
        MybatisSqlSessionFactoryBean sqlSessionFactory = new MybatisSqlSessionFactoryBean();
        /* datasource */
        sqlSessionFactory.setDataSource(dataSource);
        /* xml scan directory */
        sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
                .getResources("classpath:/mapper/*.xml"));

        MybatisConfiguration configuration = new MybatisConfiguration();
        configuration.setJdbcTypeForNull(JdbcType.NULL);
        /* underscore to camel case */
        configuration.setMapUnderscoreToCamelCase(true);
        /* 关闭一级缓存 */
        configuration.setLocalCacheScope(LocalCacheScope.STATEMENT);

        // set optimistic locker interceptor
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        mybatisPlusInterceptor.addInnerInterceptor(new OptimisticLockerInnerInterceptor());
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        configuration.addInterceptor(mybatisPlusInterceptor);

        configuration.setObjectWrapperFactory(new MybatisMapWrapperFactory());
        sqlSessionFactory.setConfiguration(configuration);
        sqlSessionFactory.setGlobalConfig(globalConfig);
        return sqlSessionFactory.getObject();
    }

    @Bean
    public GlobalConfig globalConfig() {
        GlobalConfig conf = new GlobalConfig();
        // close mybatis-plus banner
        conf.setBanner(false);
        GlobalConfig.DbConfig dbConfig = new GlobalConfig.DbConfig();
        dbConfig.setColumnFormat("`%s`");
        conf.setDbConfig(dbConfig);
        return conf;
    }

}
