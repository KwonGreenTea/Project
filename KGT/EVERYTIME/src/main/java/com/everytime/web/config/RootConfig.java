package com.everytime.web.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

// root-context.xml�� ����
@Configuration
@ComponentScan(basePackages = { "com.everytime.web.service" })
@ComponentScan(basePackages = { "com.everytime.web.aspect" })
@EnableAspectJAutoProxy // AutoProxy ����� ���� ������̼�
@MapperScan(basePackages = { "com.everytime.web.persistence" }) // ��Ű�� ��η� Mapper ��ĳ��
public class RootConfig {

	@Bean // ������ bean���� ����. xml�� <bean> �±׿� ����
	public DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		config.setDriverClassName("oracle.jdbc.OracleDriver");// jdbc ����̹� ����
		config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe"); // DB ���� url
		config.setUsername("STUDY"); // DB ����� ���̵�
		config.setPassword("1234"); // DB ����� ��й�ȣ

		config.setMaximumPoolSize(50); // �ִ� Ǯ(Pool) ũ�� ����
		config.setConnectionTimeout(30000); // Connection Ÿ�� �ƿ� ����(30��)
		HikariDataSource ds = new HikariDataSource(config);
		// config ��ü�� �����Ͽ� DataSource ��ü ����

		return ds; // ds ��ü ����
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		return (SqlSessionFactory) sqlSessionFactoryBean.getObject();
	}

	// Ʈ����� �Ŵ��� ��ü�� ������ ���
	@Bean
	public PlatformTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}

} // end RootConfig
