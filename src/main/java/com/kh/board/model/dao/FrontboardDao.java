package com.kh.board.model.dao;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;



public class FrontboardDao {
	
	private Properties prop = new Properties();
	
	/**
	 * board-query.properties 파일의 key=value 쿼리를 가져온다.
	 * - 클래스객체를 통해 build-path에 배포된 파일에 접근할 것!
	 * 
	 */
	public FrontboardDao() {
		File file = new File(FrontboardDao.class.getResource("/frontboard-query.properties").getPath());
		try {
			prop.load(new FileReader(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
