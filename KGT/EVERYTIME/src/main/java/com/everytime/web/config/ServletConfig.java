package com.everytime.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.everytime.web.exception.ChatWebSocketHandler;

// servlet-context.xml과 동일
@EnableWebSocket
@Configuration // Spring Container에서 관리하는 설정 클래스
@EnableWebMvc // Spring MVC 기능 사용
@ComponentScan(basePackages = { "com.everytime.web" }) // component scan 설정
public class ServletConfig implements WebMvcConfigurer, WebSocketConfigurer {

	// ViewResolver 설정 메소드
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		registry.viewResolver(viewResolver);
	}

	// ResourceHandlers 설정 메소드
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// resources 디렉토리 설정
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatHandler(), "/chat/message-ws").setAllowedOrigins("*");
	}

	@Bean
	public ChatWebSocketHandler chatHandler() {
		return new ChatWebSocketHandler();
	}

} // end ServletConfig
