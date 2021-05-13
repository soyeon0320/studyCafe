package kr.co.scm.command;

import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRCodeView extends AbstractView{

	public QRCodeView() {
	
		setContentType("image/png; charset=UTF-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType(getContentType());
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		QRCodeWriter qr = new QRCodeWriter();
		
		String text = (String) model.get("content");
		
		text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
		
		BitMatrix bitMatrix = qr.encode(text, BarcodeFormat.QR_CODE, 100, 100);
		
		MatrixToImageWriter.writeToStream(bitMatrix, "png", out);
		
		out.flush();
	}

}
