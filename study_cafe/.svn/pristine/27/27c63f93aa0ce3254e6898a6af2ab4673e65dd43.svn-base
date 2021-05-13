package kr.co.scm.common.web;

import com.itextpdf.text.FontFactoryImp;

import java.io.IOException;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;

//한글을 지원하기 위한 폰트를 설정하는 클래스
public class DefaultFontProvider extends FontFactoryImp {
	private String _default;
	
	public DefaultFontProvider(String def) {
		_default = def;
	}
	
	public Font getFont(String fontName, String encoding, boolean embedded, float size, int style, BaseColor color) {
		try {
			//한글 깨짐 방지 셋팅
			return new Font(BaseFont.createFont(_default, BaseFont.IDENTITY_H, BaseFont.EMBEDDED), 9, style, BaseColor.BLACK);
		}catch(DocumentException e1) {
			e1.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
