# 使用 OpenJDK 8 作为基础镜像
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制 pom.xml 和源代码到容器中
COPY pom.xml .
COPY src ./src

# 使用 Maven 构建项目
RUN mvn clean package -DskipTests

# 暴露应用端口
EXPOSE 8080

# 启动应用
CMD ["java", "-jar", "target/usercenter-0.0.1-SNAPSHOT.jar","spring.profiles.active=prod"]