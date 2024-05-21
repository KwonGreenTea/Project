package com.everytime.web.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//web.xml�� ����
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	// root application context(Root WebApplicationContext)�� �����ϴ� ���� Ŭ���� ���� �޼��� 
	@Override
	protected Class<?>[] getRootConfigClasses() {
		
		return new Class[] {RootConfig.class}; // RootConfig Ŭ���� ����
	}

	// servlet application context(Servlet WebApplicationContext)�� �����ϴ� ���� Ŭ���� ���� �޼���
	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class[] {ServletConfig.class}; // ServletConfig Ŭ���� ����
	}

	
	// Servlet Mapping �޼���
	@Override
	protected String[] getServletMappings() {
		
		return new String[] {"/"}; // �⺻ ��� ����
	}	
	
	// Filter ���� �޼���
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		encodingFilter.setForceEncoding(true);
		
		return new Filter[] { encodingFilter };
	}
	

} // end WebConfig





