package kr.co.utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
									// org.springframework.http.MediaType
	private static Map<String, MediaType> mediaMap;
	static {
		mediaMap= new HashMap<String, MediaType>(); // 인스턴스 초기화.
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	// 위의 변수는 private이기 때문에 값을 외부에서 사용 못함
	// 사용하기위해서 public static 메서드 생성.
	// 리턴값 private static 변수
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type);
	}
	
	
}
