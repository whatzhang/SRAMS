package com.sust.entity;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class MyConfig {
	@Value("#{settings['Upload.Files.Url']}")
	public String UPLOADE_URL;
	@Value("#{settings['Templets.Files.Url']}")
	public String TEMPLET_URL;
	@Value("#{settings['Download.Files.Url']}")
	public String DOWNLOAD_URL;
}
