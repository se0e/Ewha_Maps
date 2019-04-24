package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.Buffer;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;


public class UploadFileUtils {
	
	// 정해놓은 3가지 이미지 파일이 사용함.
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException {
		BufferedImage sourceImg= ImageIO.read(new File(uploadPath+path, fileName)); // 이미지를 읽어와서 메모리(RAM)에 저장
		BufferedImage destImg= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // 메모리에서 읽어온 데이터를 가공해서 메모리에 저장함 (??)
									  // s_까지의 index번호 뒤에 오는 것이 파일네임
		String thumbnailName= uploadPath+path+File.separator+"s_"+fileName; // s_가 들어가면 썸네일
		File newFile= new File(thumbnailName);
		
		String formatName= fileName.substring(fileName.lastIndexOf(".")+1); // 파일명 마지막 인덱스" . " 에서 다음 값이 필요.
		
		// 어디에 생성할것인가
		ImageIO.write(destImg, formatName, newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/'); // 업로드시 return값. 다운로드/삭제시 separatorChar와 / 의 순서를 변경.
	}
	
	// 정해놓은 3가지(jpg,gif,png) 이미지 파일 외에 나머지가 사용함.
	private static String makeIcon(String uploadPath, String path, String fileName) {
		String iconName= uploadPath+File.separator+fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/'); // 업로드시 return값. 다운로드/삭제시 separatorChar와 / 의 순서를 변경.
	}
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {
		
		// 폴더만들고 업로드하는것들이 다 들어있다.
		
		UUID uid= UUID.randomUUID();
		String savedName= uid.toString()+"_"+originalName;
		String savedPath= calPath(uploadPath);
		File target= new File(uploadPath+savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		String formatName= originalName.substring(originalName.lastIndexOf(".")+1).toUpperCase(); // 파일명 마지막 인덱스" . " 에서 다음 값이 필요. 대문자 값이 필요하니 upper사용.
		
		if(MediaUtils.getMediaType(formatName)!=null) { // 이미지 파일일때
			return makeThumbnail(uploadPath, savedPath, savedName);
		} else { // 이미지 파일이 아닐때
			return makeIcon(uploadPath, savedPath, savedName);
		}
	}

	private static String calPath (String uploadPath) {
		
		Calendar cal= Calendar.getInstance();
		
		String yearPath= File.separator+cal.get(Calendar.YEAR);
		String monthPath= yearPath+File.separator+new DecimalFormat("00").format((cal.get(Calendar.MONTH)+1)); // DecimalFormat: 03,02 이런식으로 표시
		String datePath= monthPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
				 // supload폴더에, 년    , 월           , 일 폴더 만들 수 있음.
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}

	private static void makeDir(String uploadPath, String...paths) {
		File f= new File(uploadPath+paths[paths.length-1]);
		
		if(f.exists()) { // 폴더가 있으면
			return;
		}

		for(String path : paths) {
			File dirPath= new File(uploadPath+path);
			if(!dirPath.exists()) { // 폴더가 없으면
				dirPath.mkdir(); // 생성
			}
			
		}
	}
	
	
	
	
}
