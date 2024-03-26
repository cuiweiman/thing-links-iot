## Windows
- MySQL: 127.0.0.1:3306 root/root
- Redis: 127.0.0.1:6379 cuiweiman
- MinIO:
- RocketMQ:
- Tdengine:
- Nacos: 


## MAC 

- MySQL: 127.0.0.1:3306 root/Baidu@123
- Redis(docker): 127.0.0.1:6379
- Nacos:
    1. JDK1.8编译,
    2. mvn -Prelease-nacos -Dmaven.test.skip=true clean install -U
    3.1 ls -al distribution/target/
    3.2 cd distribution/target/nacos-server-2.3.1/nacos
    4. 修改配置文件 conf/application.properties
    5. 启动 sh distribution/bin/startup.sh -m standalone
       http://localhost:8848/nacos
    6. 关闭 sh distribution/bin/shutdown.sh
- MinIO: http://localhost:9000/
- RocketMQ: localhost:9876
- Tdengine: localhost:6041 root/taosdata
    https://docs.taosdata.com/deployment/docker/


## 启动后端
```bash
    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-gateway-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-auth-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-file-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-gen-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-job-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-system-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-tdengine-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-link-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms400m -Xmx400m -Xmn150m -Xss512k -XX:MetaspaceSize=1024m -XX:MaxMetaspaceSize=1024m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-broker-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms400m -Xmx400m -Xmn150m -Xss512k -XX:MetaspaceSize=1024m -XX:MaxMetaspaceSize=1024m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-rule-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms400m -Xmx400m -Xmn150m -Xss512k -XX:MetaspaceSize=1024m -XX:MaxMetaspaceSize=1024m -server -jar -Dfile.encoding=utf-8  ./thinglinks-modules-protocolAnalysis-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -jar -Dfile.encoding=utf-8  ./thinglinks-visual-monitor-1.0.0.RELEASE.jar >/dev/null 2>&1 &

    nohup java -Xms150m -Xmx150m -Xmn100m -Xss512k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -server -Dserver.port=19101 -Dcsp.sentinel.dashboard.server=localhost:19101 -Dproject.name=sentinel-dashboard -Dsentinel.dashboard.auth.username=thinglinks -Dsentinel.dashboard.auth.password=123456 -jar -Dfile.encoding=utf-8  ./sentinel-dashboard-1.8.2.jar >/dev/null 2>&1 &
```

## 启动前端
```bash
    # 进入项目目录

    cd thinglinks-ui

    # 安装依赖

    npm install

    # 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题

    npm install --registry=https://registry.npm.taobao.org

    # 构建测试环境
    npm run build:stage

    # 构建生产环境
    npm run build:prod
```

## 登录系统
    超级管理员账户：admin 密码：admin123